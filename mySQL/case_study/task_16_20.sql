use case_study_1;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
update nhan_vien 
set is_deleted = 1 
where ma_nhan_vien in (select mnv.ma_nhan_vien from 
(select nv.ma_nhan_vien, nv.ho_ten
from nhan_vien nv
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) 
between '2019' and '2021' is null) as mnv);

select*
from nhan_vien
where is_deleted = 0;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 
-- là lớn hơn 10.000.000 VNĐ.
update khach_hang
set ma_loai_khach = 1
where ma_loai_khach in (select mlk.ma_loai_khach from (
select ma_khach_hang, ho_ten, ten_loai_khach, ma_loai_khach,
sum(ifnull(tong_tien,0)) as tong_tien_2021
from v_tong_tien 
where year(ngay_lam_hop_dong) = '2021' 
and ten_loai_khach= 'Platinum'
group by ma_khach_hang
having tong_tien_2021 > 1000000) as mlk);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
update khach_hang
set is_deleted = 1
where ma_khach_hang in ( select mk.ma_khach_hang from(
select k.ma_khach_hang, k.ho_ten
from khach_hang k
left join hop_dong hd on k.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < '2021') as mk);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = gia * 2
where gia in (select ct.gia from(
select dvdk.ten_dich_vu_di_kem, dvdk.gia, sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct  on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = '2020'
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10
order by dvdk.ma_dich_vu_di_kem) as ct);

select*
from dich_vu_di_kem;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị 
-- bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
k.ma_khach_hang id, k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
from khach_hang k
-- where is_deleted = 0
union all
select 
nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv;
-- where is_deleted = 0;

delimiter //
create procedure sp_infor()
begin
select 
k.ma_khach_hang , k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
from khach_hang k;
select 
nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv;
end //
delimiter ;
call sp_infor();