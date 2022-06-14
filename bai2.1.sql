create table phieu_xuat(
SoPX int primary key auto_increment,
NgayXuat date
);

create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(45)
);

create table phieu_nhap(
so_phieu_nhap int primary key auto_increment,
ngay_nhap date
);


create table so_dien_thoai(
id_sdt int primary key auto_increment,
so_dt int
);

create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(45),
dia_chi varchar(45),
so_dienthoai int,
don_dathang int,
foreign key (so_dienthoai) references so_dien_thoai(id_sdt),
foreign key (don_dathang) references don_dat_hang(so_dh)

);

create table don_dat_hang(
so_dh int primary key auto_increment,
ngay_dat_hang date,
ma_nhacc int,
foreign key (ma_nhacc) references nha_cc(ma_ncc)
);

create table vat_tu_phieu_xuat(
don_gia_xuat int,
so_luong_xuat int,
so_px int,
ma_vtu int,
foreign key (so_px) references phieu_xuat(SoPX),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table don_gia_nhap_so_luong_nhap(
don_gia_nhap int,
so_luong_nhap int,
ma_vat_tu int,
so_pn int,
foreign key (ma_vat_tu) references vat_tu(ma_vtu),
foreign key (so_pn) references phieu_nhap(so_phieu_nhap)
);

create table vat_tu_don_hang(
ma_vat_tu int,
so_don_hang int,
foreign key (ma_vat_tu) references vat_tu(ma_vtu),
foreign key (so_don_hang) references don_dat_hang(so_dh)
);






