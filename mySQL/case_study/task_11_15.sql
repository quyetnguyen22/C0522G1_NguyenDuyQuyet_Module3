use case_study_1;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là 
-- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang k on hd.ma_khach_hang = k.ma_khach_hang
join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' 
and (k.dia_chi like '% Vinh' or k.dia_chi like '% Quảng Ngãi')
and is_deleted = 0;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten as nhan_vien, k.ho_ten as khach_hang, k.so_dien_thoai,
 dv.ten_dich_vu, sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem,  hd.tien_dat_coc
from hop_dong hd 
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join khach_hang k on k.ma_khach_hang = hd.ma_khach_hang
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31' and k.is_deleted = 0
and hd.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd 
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-06-30')
group by hdct.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
drop view if exists v_so_luong_dvdk;
create view v_so_luong_dvdk as 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem as dvdk_su_dung_nhieu_nhat, 
sum(hdct.so_luong) as so_luong_dvdk
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem;

select vs.ma_dich_vu_di_kem, vs.dvdk_su_dung_nhieu_nhat, vs.so_luong_dvdk
from v_so_luong_dvdk vs
where vs.so_luong_dvdk =(
select max(so_luong_dvdk) 
from v_so_luong_dvdk);

-- select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
-- from dich_vu_di_kem dvdk
-- join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
-- group by ma_dich_vu_di_kem
-- having so_luong_dich_vu_di_kem = (
-- 	select sum(hdct.so_luong) as sl
-- 	from hop_dong_chi_tiet hdct
--     group by ma_dich_vu_di_kem
--     order by sl desc
--     limit 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, dv.ten_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung_dv
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung_dv = 1
order by hdct.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, 
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi,
count(hd.ma_nhan_vien) as nv_so_hop_dong
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) 
between '2020' and '2021' and is_deleted = 0
group by hd.ma_nhan_vien
having nv_so_hop_dong <= 3;