drop database if exists nhap_xuat_kho; 
create database nhap_xuat_kho;
use nhap_xuat_kho;

-- PHIEU XUAT
create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

-- VAT TU
create table vat_tu(
ma_vt int primary key,
ten_vt varchar(45)
);

-- PHIEU NHAP
create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

-- NHA CUNG CAP
create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(45),
dia_chi varchar(45)
);

-- DON DAT HANG
create table don_dat_hang(
so_dh int primary key,
ngay_dh date,
ma_ncc_id int,
foreign key(ma_ncc_id) references nha_cc(ma_ncc)
);

-- CHI TIET PHIEU XUAT
create table xuat_vt(
don_gia_xuat double,
sl_xuat int,
so_px int,
ma_vt int,
primary key(so_px, ma_vt),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vt) references vat_tu(ma_vt)
);

-- CHI TIET PHIEU NHAP
create table nhap_vt(
don_gia_nhap double,
sl_nhap int,
ma_vt int,
so_pn int,
primary key(ma_vt, so_pn),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_pn) references phieu_nhap(so_pn)
);

-- CHI TIET DDH
create table chi_tiet_ddh(
ma_vt int,
so_dh int,
primary key(ma_vt, so_dh),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_dh) references don_dat_hang(so_dh)
);

-- SO DIEN THOAI
create table sdt(
so_dt varchar(10),
ma_ncc_id int,
foreign key(ma_ncc_id) references nha_cc(ma_ncc)
);