/*
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
7. quốc gia
    - mã qg int
    - tên quốc gia varchar
8. Tập phim 
    - id int
    - id phim int
    - số tập int
    - tieu_de varchar
    - thoi_luong float
    - trailer varchar

- Hoàn thiện CSDL để quản lý web phim
- Viết các câu lệnh để chạy được nhiều lần ko bị lỗi
- Viết câu lệnh để mỗi 1 bảng tạo khoảng 30 dữ liệu
*/

CREATE DATABASE IF NOT EXISTS quan_ly_web_phim; 
USE quan_ly_web_phim;
CREATE TABLE IF NOT EXISTS the_loai(
	id INT PRIMARY KEY,
    ten_the_loai varchar(50)
);
CREATE TABLE IF NOT EXISTS vai_tro(
    id INT PRIMARY KEY,
    ten_vai_tro varchar(20)
);
CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY,
    ten_dang_nhap varchar(50),
    mat_khau varchar(50),
    ho_ten varchar(50),
    email varchar(50),
    so_dien_thoai varchar(10),
    ngay_sinh datetime,
    quyen_quan_tri int,
    loai_tai_khoan varchar(20),
    FOREIGN KEY (quyen_quan_tri) REFERENCES vai_tro(id)
);
CREATE TABLE IF NOT EXISTS quoc_gia(
	id INT PRIMARY key,
    ten_quoc_gia varchar(100)
);
CREATE TABLE IF NOT EXISTS phim(
	id INT PRIMARY KEY,
    ten_phim varchar(100),
    dao_dien_id int,
    the_loai_id int,
    quoc_gia_id int,
    tuoi int,
    nam_phat_hanh int,
    poster varchar(255),
    so_tap int,
    trailer varchar(255),
    mo_ta text,
    FOREIGN KEY (dao_dien_id) REFERENCES users(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id),
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);
CREATE TABLE IF NOT EXISTS phim_dien_vien(
	id INT PRIMARY KEY,
    phim_id int,
    dien_vien_id int,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS phim_the_loai(
	id INT PRIMARY key,
    phim_id int,
    the_loai_id int,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);
CREATE TABLE IF NOT EXISTS tap_phim(
	id INT PRIMARY key,
    id_phim int,
    so_tap int,
    tieu_de varchar(50),
    thoi_luong float,
    trailer varchar(255),
    FOREIGN KEY (id_phim) REFERENCES phim(id)
);
INSERT IGNORE INTO the_loai (id, ten_the_loai) VALUES
(1, 'Phim bộ'), (2, 'Phim chiếu rạp'), (3, 'Hành động'),(4, 'Tình cảm'),(5, 'Kinh dị'),
(6, 'Phiêu lưu'),(7, 'Hoạt hình'),(8, 'Hài'),(9, 'Viễn tưởng'),(10,'Chiến tranh'),
(11,'Học đường'),(12,'Lãng mạn'),(13,'Khoa học'),(14,'Gia đình'),(15,'Thần thoại'),(16,'Tâm lý'), 
(17,'Cổ trang'),(18,'Siêu anh hùng'),(19,'Tội phạm'),(20,'Hình sự'),(21,'Kịch'),(22,'Xuyên không'),
(23,'Đời sống'),(24,'Drama'),(25,'Phép thuật'),(26,'Zombie'),(27,'Thiếu nhi'),(28,'Game'),
(29,'Trinh thám'),(30,'Võ thuật');
INSERT IGNORE INTO vai_tro (id, ten_vai_tro) VALUES (1,'Admin'), (2,'User'), (3,'Đạo diễn'), (4,'Diễn viên');
INSERT IGNORE INTO users (id, ten_dang_nhap, mat_khau, ho_ten, email, so_dien_thoai, ngay_sinh, quyen_quan_tri, loai_tai_khoan) VALUES
(1,'haanh','lha123','Lê Hạ Anh','anhleha@gmail.com','0987655555','1995-08-31',4,'Diễn viên'),
(2,'hoangdo','13111997','Đỗ Nhật Hoàng','hoangdo@gmail.com','0987654444','1997-11-13',4,'Diễn viên'),
(3,'dinhtu','tukhang1911','Nguyễn Đình Khang','dinhkhang@gmail.com','0968857823','2000-10-1',4,'Diễn viên'),
(4,'dthaihuyen','huyen03091980','Đặng Thái Huyền','dangthaihuyen@gmail.com','0965837667','1980-09-03',3,'Đạo diễn'),
(5,'emma1990','15041990','Emma Watson','emmawatson@gmail.com','0987665544','1990-04-15',4,'Diễn Viên'),
(6,'dandan','123456789','Dan Stevens','stevens@gmail.com','0966823339','1982-10-10',4,'Diễn viên'),
(7,'billcondon','billbill2017','Bill Condon','billcondon10@gmail.com','0982138610','1955-10-22',3,'Đạo diễn'),
(8,'bichbui2004','2221050590','Bùi Ngọc Bích','buingocbich@gmail.com','0842184299','2004-01-10',1,'admin'),
(9,'thuy037','2221050037','Nguyễn Thị Thúy','thuy037@gmail.com','0822246912','2003-06-26',1,'admin'),
(10,'thuy039','2221050039','Nguyễn Thị Thúy','thuy039@gmail.com','0928367513','2004-12-11',1,'admin'),
(11,'lthanhmy','21092005','Lâm Thanh Mỹ','my2005@gmail.com','0920056664','2005-09-21',4,'Diễn viên'),
(12,'rima','rima123','Thanh Vy','rima15@gmail.com',NULL,'1995-03-08',4,'Diễn viên'),
(13,'diemdiem','diem123','Thúy Diễm','diem16@gmail.com',NULL,NULL,4,'Diễn viên'),
(14,'huutan1983','18101983','Trần Hữu Tấn','huutan1983@gmail.com',NULL,'1983-10-18',3,'Đạo diễn'),
(15,'trucanhne','tructruc98','Trúc Anh','trucanh1998@gmail.com',NULL,'1998-09-23',4,'Diễn Viên'),
(16,'nguyenthao','thao123','Huỳnh Thới Ngọc Thảo','nthao1994@gmail.com',NULL,NULL,4,'Diễn viên'),
(17,'phuonglan','05031983','Nguyễn Lan Phương','phuonglannguyen@gmail.com',NULL,'1983-03-05',4,'Diễn viên'),
(18,'phanhdao','phanh123','Đào Phương Anh',NULL,NULL,'1992-04-30',4,'Diễn viên'),
(19,'tranthanhtown','tranthanhhari','Huỳnh Trấn Thành',Null,Null,'1987-02-05',3,'Đạo diễn'),
(20,'nana33','nanana33','Cổ Lực Na Trát','natrat33@gmail.com',NULL,'1992-05-02',4,'Diễn Viên'),
(21,'maihuong24','huongphanmai','Phan Mai Hương','huonghuong24@gmail.com','0924036377','1992-01-04',2,'user'),
(22,'myle','23071999','Trần Thị Mỹ Lệ','tranle5@gmail.com','0958273666','1999-07-23',2,'user'),
(23,'uyenan26','an123','Huỳnh Uyển Ân','an26@gmail.com',NULL,'1999-02-15',4,'Diễn viên'),
(24,'baongoc','lambaongoc23@','Lâm Bảo Ngọc','baongoc23@gmail.com','0933028727','2001-01-28',2,'user'),
(25,'hoangoanh06','27092006','Nguyễn Lê Hoàng Oanh','Oanh06@gmail.com','0937268228','2006-09-27',2,'user'),
(26,'trangtit','123456789','Đòn Thị Quỳnh Trang','trangdoan@gmail.com','0929387382','2004-09-14',2,'user'),
(27,'lannhinguyen','987654321','Nguyễn Lan Nhi','nlnhi04@gmail.com','0922872003','2004-04-20',2,'user'),
(28,'qthang123','123@123','Trần Quyết Thắng','quyetthang123@gmail.com','0911111111','2000-01-01',2,'user'),
(29,'mhduy','duy123','Mai Hồng Duy','maihongduy@gmail.com','0911111112','2000-02-01',2,'user'),
(30,'truongdang','084321','Đặng Quang Trường','truong21@gmail.com','0911111113','2000-03-01',2,'user');

INSERT IGNORE INTO quoc_gia(id, ten_quoc_gia) VALUES
(1,'Việt Nam'), (2,'Trung Quốc'), (3,'Hàn Quốc'), (4,'Lào'), (5,'Nhật Bản'), (6,'Đài Loan'), (7,'HongKong'), (8,'Philippin'), (9,'Thái Lan'), 
(10,'Mexico'), (11,'Anh'), (12,'Mỹ'), (13,'Malaysia'), (14,'Canada'), (15,'Brazil'), (16,'Cuba'), (17,'Ấn Độ'), (18,'Peru'), (19,'Đan Mạch'), (20,'Myanmar'), (21,'Panama'), (22,'Ý'), (23,'Pháp'), (24,'Úc'), (25,'Đức'), (26,'Tây Ban Nha'), (27,'Ai Cập'), (28,'New Zealand'), (29,'Thụy Sĩ'), (30,'Singapore');
INSERT IGNORE INTO phim (id, ten_phim, dao_dien_id, the_loai_id, quoc_gia_id, tuoi, nam_phat_hanh, poster, so_tap, trailer, mo_ta)
VALUES
(1,'Mưa đỏ',4,10,1,16,2024,'640x396-muado.jpg',1,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF','Mưa đỏ là một bộ phim điện ảnh Việt Nam thuộc thể loại lịch sử – chiến tranh – chính kịch ra mắt năm 2025 do Đặng Thái Huyền làm đạo diễn, được chuyển thể từ tiểu thuyết cùng tên của nhà văn Chu Lai và đồng thời lấy cảm hứng từ sự kiện 81 ngày đêm chiến đấu để bảo vệ Thành cổ Quảng Trị năm 1972.'),
(2,'Thám tử lừng danh Conan',NULL,7,5,10,2024,'conanposter.jpg',1,'https://www.youtube.com/embed/C4pG3GbhQZw?si=AxYaCIxzFuW1jkDm','Thám tử lừng danh Conan: Ngôi sao 5 cánh 1 triệu đô là phim điện ảnh thứ 27 của series, xoay quanh cuộc đối đầu giữa Conan và Kaito Kid liên quan đến một thanh kiếm cổ của Toshizō Hijikata. Phim có sự xuất hiện của các nhân vật như Heiji Hattori và Toyama Kazuha, với nhiều pha hành động gay cấn và yếu tố lãng mạn, hài hước. '),
(3,'Người đẹp và quái vật',7,12,12,16,2022,'nguoidep_quaivat_poster.png',1,'https://www.youtube.com/embed/o6k1ChY8kDg?si=egpgKrR3uFIf507d','Người đẹp và Quái vật" (2017) kể về câu chuyện của Belle (Emma Watson) - một cô gái thông minh bị Quái vật (Dan Stevens) giam cầm trong lâu đài. Để hóa giải lời nguyền, Quái vật cần nhận được tình yêu đích thực trước khi cánh hoa hồng cuối cùng rơi xuống. Bộ phim còn có dàn diễn viên tài năng, âm nhạc hấp dẫn và công nghệ kỹ xảo tiên tiến.'),
(4,'Bỗng dưng trúng số',NULL,8,3,16,2022,'bongdungtrungso_poster.jpg',10,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ',NULL),
(5,'Kungfu Panda',NULL,7,2,12,2024,'pandaposter.jpg',1,'https://www.youtube.com/embed/habnAmcXrvc?si=1e8JDy2lso2QmVJb','Kung Fu Panda 4 là phần tiếp theo của loạt phim hoạt hình nổi tiếng, kể về hành trình của Po khi anh chuẩn bị trở thành Thủ lĩnh tinh thần của Thung lũng Bình Yên. Po phải tìm và huấn luyện một Chiến binh Rồng mới, đồng thời đối mặt với kẻ thù mới là mụ phù thủy Tắc Kè Bông (The Chameleon), kẻ có thể triệu hồi lại tất cả những kẻ thù cũ của Po. '),
(6,'Toy Story',NULL,7,12,16,2022,'toy.jpg',1,'https://www.youtube.com/embed/wmiIUN-7qhE?si=FA-0dvv9Gh_trLgP','Toy Story 4 là bộ phim hoạt hình của Pixar, ra mắt năm 2019, là phần tiếp theo của Toy Story 3. Bộ phim xoay quanh cuộc hành trình của Woody khi cậu cùng những người bạn đồ chơi mới là Forky, một món đồ chơi tự chế từ bộ đồ ăn, đi tìm chủ nhân mới của mình là Bonnie. Trên đường đi, Woody gặp lại tình cũ Bo Peep, người đã trở nên mạnh mẽ và độc lập sau nhiều năm lưu lạc. '),
(7,'Findet Nemo',NULL,7,12,12,2022,'nemo.jpg',1,'https://www.youtube.com/embed/86eaAc2Buvg?si=VMDo2i0ph20C8NNG','Hành trình đầy mạo hiểm của chú cá hề cha tên Marlin đi khắp đại dương để tìm lại con trai mình là Nemo, một chú cá hề nhỏ bị bắt đi khỏi rạn san hô. Đồng hành cùng Marlin trong cuộc tìm kiếm là cô cá Dory.'),
(8,'Ultraman Arc',NULL,18,5,12,2022,'ultra.webp',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(9,'Hiệp sĩ mặt nạ: Gia đình siêu phàm',NULL,18,5,12,2023,'hiepsimatna.jpg',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(10,'Hiệp sĩ mặt nạ: Bộ tam tội lỗi',NULL,18,5,12,2022,'hiepsimatna.jpg',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(11,'Cám',14,5,1,16,2024,'cam.jpg',1,'https://www.youtube.com/embed/_8qUFEmPQbc?si=k_Gd6II2SIy31W6D','Lấy bối cảnh đầu thế kỷ 19, vào cuối thời nhà Lê - đầu nhà Nguyễn, phim xoay quanh câu chuyện hai chị em cùng cha khác mẹ Cám và Tấm. Từ bé, Cám sinh ra với ngoại hình dị dạng, bị xem là nỗi ô nhục của dòng họ.'),
(12,'Mắt Biếc',NULL,12,1,16,2019,'matbiec.jpg',1,'https://www.youtube.com/embed/ITlQ0oU7tDA?si=y0u_KJ9aJJupq1hb','"Mắt Biếc" là tiểu thuyết của nhà văn Nguyễn Nhật Ánh, kể về mối tình đơn phương của Ngạn dành cho Hà Lan, một cô gái có đôi mắt đẹp và ước mơ rời quê hương. Câu chuyện mở đầu từ tuổi thơ ở làng Đo Đo, Quảng Nam, sau đó đi qua những biến cố và sự xa cách khi cả hai ra thành phố, đan xen những xúc cảm về tình yêu, nỗi buồn và tình quê hương.'),
(13,'Tết ở làng địa ngục',NULL,5,1,16,2023,'tetolangdianguc.jpg',12,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH','"Tết ở làng địa ngục" là một phim truyền hình kinh dị cổ trang của Việt Nam, dựa trên tiểu thuyết cùng tên của nhà văn Thảo Trang. Phim xoay quanh những vụ án mạng kỳ dị tại một ngôi làng hẻo lánh, nơi sinh sống của hậu duệ một băng cướp khét tiếng, và những điềm báo về nghiệp báo từ tổ tiên.'),
(14,'Kẻ ăn hồn',NULL,5,1,16,2023,'keanhon.jpg',1,'https://www.youtube.com/embed/xWh0g4rKGjI?si=KFERjCjPMZ7oFmGW','Được chuyển thể từ tiểu thuyết cùng tên của nhà văn Thảo Trang. Phim xoay quanh câu chuyện về nhiều cái chết bí ẩn tại một ngôi làng nơi tồn tại thứ cổ thuật tà ác, với sự kiện chính là việc "5 mạng sống đổi lấy bình Rượu Sọ Người".'),
(15,'Mai',19,12,1,16,2023,'mai.jpg',1,'https://www.youtube.com/embed/EX6clvId19s?si=sDjvodTLY9sb0ZdO','Phim kể về cuộc đời của Mai, một người phụ nữ xinh đẹp nhưng phải đối mặt với nhiều khó khăn và định kiến xã hội vì nghề nghiệp. Cuộc sống của cô thay đổi khi gặp Dương, một chàng trai đào hoa, và cả hai đã cùng nhau tìm thấy những khoảnh khắc hạnh phúc.'),
(16,'Walle',NULL,7,5,10,2022,'walle.jpg',1,'https://www.youtube.com/embed/_kslEYbMr1g?si=8HKaMm-t_7ctP7mY',NULL),
(17,'Kẻ trộm mặt trăng: Minions',NULL,7,12,16,2022,'minion.jpg',10,'https://www.youtube.com/embed/1EHAxur2a2E?si=5M-iBzpYIdyO5ISA',NULL),
(18,'Phó Sơn Hải',NULL,17,2,16,2024,'phosonhai.jpg',15,'https://www.youtube.com/embed/km9F4c7hCjs?si=0JmyvbvWsnDc4ato',NULL),
(19,'Tử Dạ Quy',NULL,17,2,16,2024,'tudaquy.jpg',12,'https://www.youtube.com/embed/ygjm1DVpzjk?si=dKXLfwbhZp3wMC4w',NULL),
(20,'Hiến Ngư',NULL,17,2,16,2024,'hienngu.jpg',10,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF',NULL),
(21,'Ngày mưa đưa em đến',1,1,9,16,2024,'ngaymuaduaemden.jpg',20,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd',NULL),
(22,'Dữ Tấn Trường An',NULL,17,2,16,2024,'truongan.jpg',18,'https://www.youtube.com/embed/Y7yxVonwoPw?si=IZNf-QTCCSv1krGJ',NULL),
(23,'Quỷ Ăn Tạng',NULL,5,1,16,2024,NULL,1,NULL,NULL),
(24,'Công chúa bạch tuyết',NULL,15,12,16,2024,NULL,1,NULL,NULL),
(25,'Lọ lem',NULL,15,12,16,2024,NULL,1,NULL,NULL),
(26,'Về nhà đi con',NULL,14,1,16,2020,NULL,35,NULL,'Mo ta phim 1'),
(27,'Tử chiến trên không',NULL,3,1,16,2025,NULL,1,NULL,'Mo ta phim 1'),
(28,'Doraemon',NULL,1,5,10,2015,NUll,60,NULL,'Mo ta phim 1'),
(29,'Shin: Cậu bé bút chì',NULL,1,5,10,2015,NUll,60,NULL,'Mo ta phim 1'),
(30,'Home Alone',NULL,24,12,11,2008,NULL,2,NULL,'Mo ta phim 1');
INSERT IGNORE INTO phim_the_loai(id, phim_id, the_loai_id) VALUES
(1,1,2),(2,1,3),(3,1,10),(4,2,2),(5,2,7),(6,2,28),(7,3,2),(8,3,4),(9,3,12),(10,3,24),(11,4,4),(12,4,8),(13,5,7),(14,5,2),(15,6,7),(16,8,3),(17,8,18),
(18,8,27),(19,9,18),(20,9,27),(21,10,18),(22,10,27),(23,11,5),(24,11,17),(25,12,4),(26,12,12),(27,12,11),(28,13,2),(29,13,5),(30,13,17),(31,14,5),
(32,14,17),(33,15,4),(34,15,23),(35,15,14),(36,16,11),(37,17,11),(38,18,1),(39,18,23),(40,18,21),(41,19,1),(42,19,12),(43,20,4),(44,20,1),
(45,20,12),(46,21,4),(47,21,12),(48,21,1),(49,22,1),(50,22,12),(51,22,23);
INSERT IGNORE INTO phim_dien_vien (id, phim_id, dien_vien_id) VALUES
(1,1,1),(2,1,2),(3,1,3),(4,3,5),(5,3,6),(6,11,11),(7,11,12),(8,11,13),(9,12,15),(10,12,18),(11,13,16),(12,13,17),(13,14,16),(14,14,17),
(15,15,18),(16,15,2),(17,18,20),(18,19,20),(19,20,20),(20,22,20),(21,16,5),(22,17,6),(23,21,18),(24,20,17),(25,1,18),(26,21,6),(27,21,5);
INSERT IGNORE INTO tap_phim (id, id_phim, so_tap, tieu_de, thoi_luong, trailer)
VALUES
(1,1,1,'Full',105,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(2,2,1,'Full',95,'https://www.youtube.com/embed/C4pG3GbhQZw?si=AxYaCIxzFuW1jkDm'),
(3,3,1,'Full',90,'https://www.youtube.com/embed/o6k1ChY8kDg?si=egpgKrR3uFIf507d'),
(4,8,10,'Tập 1',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(5,8,10,'Tập 2',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(6,8,10,'Tập 3',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(7,8,10,'Tập 4',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(8,4,10,'Tập 1',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(9,4,10,'Tập 2',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(10,4,10,'Tập 3',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(11,5,1,'Full',120,'https://www.youtube.com/embed/habnAmcXrvc?si=1e8JDy2lso2QmVJb'),
(12,6,1,'Full',100,'https://www.youtube.com/embed/wmiIUN-7qhE?si=FA-0dvv9Gh_trLgP'),
(13,7,1,'Full',90,'https://www.youtube.com/embed/86eaAc2Buvg?si=VMDo2i0ph20C8NNG'),
(14,11,1,'Full',100,'https://www.youtube.com/embed/_8qUFEmPQbc?si=k_Gd6II2SIy31W6D'),
(15,12,3,'Full',90,'https://www.youtube.com/embed/ITlQ0oU7tDA?si=y0u_KJ9aJJupq1hb'),
(16,13,12,'Tập 1',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(17,13,12,'Tập 2',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(18,13,12,'Tập 3',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(19,13,12,'Tập 4',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(20,13,12,'Tập 5',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(21,14,1,'Full',85,'https://www.youtube.com/embed/xWh0g4rKGjI?si=KFERjCjPMZ7oFmGW'),
(22,15,1,'Full',105,'https://www.youtube.com/embed/EX6clvId19s?si=sDjvodTLY9sb0ZdO'),
(23,16,1,'Full',95,'https://www.youtube.com/embed/_kslEYbMr1g?si=8HKaMm-t_7ctP7mY'),
(24,17,10,'Tập 2',50,'https://www.youtube.com/embed/1EHAxur2a2E?si=5M-iBzpYIdyO5ISA'),
(25,18,15,'Tập 3',60,'https://www.youtube.com/embed/km9F4c7hCjs?si=0JmyvbvWsnDc4ato'),
(26,19,12,'Tập 1',50,'https://www.youtube.com/embed/ygjm1DVpzjk?si=dKXLfwbhZp3wMC4w'),
(27,20,10,'Tập 1',50,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(28,20,10,'Tập 2',50,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(29,21,20,'Tập 1',50,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd'),
(30,21,20,'Tập 2',50,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd');

-- Lấy quốc gia phát hành phim 10
SELECT p.*, qg.ten_quoc_gia FROM phim p 
JOIN quoc_gia qg ON p.quoc_gia_id = qg.id
WHERE p.id = 10
-- Lấy Tên phim, tên đạo diễn, tên quốc gia
SELECT p.ten_phim, qg.ten_quoc_gia, nd.ho_ten as ten_dao_dien FROM phim p 
JOIN quoc_gia qg ON p.quoc_gia_id = qg.id
JOIN nguoi_dung nd ON p.dao_dien_id = nd.id
WHERE p.id = 10
-- Lấy Tên phim, tên đạo diễn, tên quốc gia, tên diễn viên
SELECT p.ten_phim, qg.ten_quoc_gia, nd.ho_ten as ten_dao_dien, dv.ho_ten as ten_dien_vien FROM phim p 
JOIN quoc_gia qg ON p.quoc_gia_id = qg.id
JOIN nguoi_dung nd ON p.dao_dien_id = nd.id
JOIN phim_dien_vien pdv ON p.id = pdv.phim_id
JOIN nguoi_dung dv ON pdv.dien_vien_id = dv.id
WHERE p.id = 10
-- Cập nhật dữ liệu
UPDATE `phim` SET `mo_ta`='abc' WHERE 10
-- Xóa dữ liệu
DELETE FROM `phim` WHERE id = 10