-- melihat table
show tables;

-- membuat table
create table barang (
    id int not null,
    nama varchar(100) not null,
    harga int not null default 0,
    jumlah int not null default 0
);

-- melihat struktur table
describe nama_tabel;

desc nama_tabel;

-- mengubah table
-- langsung
alter table
    barang
add
    column nama_column text,
    drop column nama,
    rename column nama to nama_baru,
modify
    nama varchar(100)
after
    jumlah,
modify
    nama varchar(100) first;

-- satu-satu
alter table
    barang
add
    column deskripsi text;

alter table
    barang drop column deskripsi text;

alter table
    barang
modify
    nama varchar(200)
after
    jumlah;

alter table
    barang
modify
    nama varchar(200) first;

-- null value
alter table
    barang
modify
    id int not null;

-- default value
alter table
    barang
modify
    jumlah int not null default 0;

alter table
    barang
add
    waktu_dibuat timestamp not default current_timestamp;

-- membuat ulang table
truncate barang;

-- menghapus table
drop table barang;
