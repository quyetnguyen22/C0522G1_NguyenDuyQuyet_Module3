use case_study_1;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là 
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * 
from nhan_vien
-- where ho_ten regexp '^[HTK]' and char_length(ho_ten) < 15;
where ho_ten like 'T%' or ho_ten like 'H%' or ho_ten like '%K' and char_length(ho_ten) < 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where ((year(current_date()) - year(ngay_sinh)) between 18 and 50) and is_deleted = 0
and dia_chi like '% Đà Nẵng' 
or dia_chi like '% Quảng Trị';

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần 
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.ma_khach_hang, k.ho_ten, count(hd.ma_khach_hang) as so_lan_dat
from khach_hang k
join hop_dong hd
on k.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk 
on k.ma_loai_khach = lk.ma_loai_khach
Where lk.ten_loai_khach = 'Diamond' and is_deleted = 0
group by hd.ma_khach_hang
order by so_lan_dat;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và 
-- Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- drop view v_tong_tien;
create view v_tong_tien as
select k.ma_khach_hang, k.ho_ten, lk.ten_loai_khach, lk.ma_loai_khach, hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
 dv.ten_dich_vu,( ifnull(dv.chi_phi_thue,0)+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
 from khach_hang k
 left join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
 left join hop_dong hd on k.ma_khach_hang = hd.ma_khach_hang
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 group by hd.ma_hop_dong, k.ma_khach_hang
 order by k.ma_khach_hang;
 select *
 from v_tong_tien;