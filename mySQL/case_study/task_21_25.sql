use case_study_1;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Lê Văn Hoa','1997-06-09','755432343','15000000','0934215314','hoalv@gmail.com','22 Hải Châu, Đà Nẵng',1, 1, 2);
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values
('2019-12-12','2020-12-08',0,11,1,3);
create view v_nhan_vien as 
select 
nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi like '%Hải Châu%' and hd.ngay_lam_hop_dong = '2019-12-12';
drop view v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set dia_chi = 'Liên Chiểu';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang (in sp_ma_khach_hang int)
begin 
update khach_hang 
set is_deleted = 1
where ma_khach_hang = sp_ma_khach_hang;
end //
delimiter ;
call sp_xoa_khach_hang(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và 
-- đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(in 
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double ,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int) 
begin
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
end //
delimiter ;
call sp_them_moi_hop_dong('2022-12-08','2022-12-08',0,2,1,3);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
update hop_dong
set is_deleted = 0
where tien_dat_coc = 10;

-- drop table lich_su_hop_dong;
create table lich_su_hop_dong(
so_hop_dong int,
is_deleted bit default 0,
ma_hop_dong int,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
mhd_thay_doi int,
nlhd_thay_doi datetime,
nkt_thay_doi datetime,
tdc_thay_doi double,
mnv_thay_doi int,
mkh_thay_doi int,
mdv_thay_doi int,
ngay_thay_doi date);

delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin
declare so_hop_dong int;
select count(is_deleted) into so_hop_dong
from hop_dong
where is_deleted = 0;
insert into lich_su_hop_dong(is_deleted,ma_hop_dong,mhd_thay_doi,ngay_lam_hop_dong, nlhd_thay_doi,ngay_ket_thuc,nkt_thay_doi,tien_dat_coc,tdc_thay_doi,
ma_nhan_vien,mnv_thay_doi,ma_khach_hang,mkh_thay_doi,ma_dich_vu,mdv_thay_doi,ngay_thay_doi, so_hop_dong)
values(new.is_deleted,old.ma_hop_dong,new.ma_hop_dong,old.ngay_lam_hop_dong,new.ngay_lam_hop_dong,old.ngay_ket_thuc,new.ngay_ket_thuc,old.tien_dat_coc,new.tien_dat_coc,
old.ma_nhan_vien,new.ma_nhan_vien,old.ma_khach_hang,new.ma_khach_hang,old.ma_dich_vu,new.ma_dich_vu, now(), so_hop_dong);

end //
delimiter ;
drop trigger tr_xoa_hop_dong;