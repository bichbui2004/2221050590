CREATE DATABASE IF NOT EXISTS quan_ly_web_phim; /* chạy nhiều lần */
USE quan_ly_xem_phim;
1. Thể loại
    - mã thể loại int pk
    - tên thế loại varchar(50)

2. User
    - id int pk
    - ten_dang_nhap varchar(50)
    - matkhau varchar(50)
    - ho_ten varchar(50)
    - email varchar(50)
    - sdt varchar(10)
    - ngày sinh datetime
    - quyền quản trị: int
    - loai_tk varchar(20)
3. vai_tro
    - id int pk
    - ten_vai_tro varchar(20)
4. Phim
    - id INT pk
    - tên phim VarChar
    - dao_dien_id int
    - the_loai_id int
    - quốc_gia_id int
    - tuổi int
    - năm phát hành int
    - poster varchar
    - số tập int
    - trailer varchar
    - mô tả text
5. Phim_dien_vien
    - id int
    - phim_id int
    - dien_vien_id int
6. Phim_the_loai
    - id int
    - phim_id int
    - the_loai_id int
8. quốc gia
    - mã qg int
    - tên quốc gia varchar
9. Tập phim 
    - id int
    - id phim int
    - số tập int
    - tieu_de varchar
    - thoi_luong float
    - trailer varchar

- Hoàn thiện CSDL để quản lý web phim
- Viết các câu lệnh để chạy được nhiều lần ko bị lỗi
- Viết câu lệnh để mỗi 1 bảng tạo khoảng 30 dữ liệu

