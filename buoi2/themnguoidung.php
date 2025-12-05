<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>php - Buổi 2</title>
    <style>
        h1{
            margin: 5px 0;
        }
        .container{
            border: 1px solid black;
            border-radius: 10px;
            width: 35%;
            padding: 20px 0;
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        form{
            width:80%;
        }
        input{
            width:100%;
            padding: 5px 0;

        }
        .box{
            margin: 10px 0;
        }
        .select{
            width: 100%;
            padding: 5px 0;
        }
        .warning{
            color: red;
            font-weight: bold;

        }        
    </style>
</head>
<body>
    <div class="container">
    <form action="index.php?page_layout=themnguoidung" method="post">   
        <h1>Thêm người dùng</h1>
        <div class="box">
            <p>Tên đăng nhập</p>
            <input type="text" name="ten-dang-nhap" placeholder="Tên đăng nhập">
        </div>
        <div class="box">
            <p>Mật khẩu</p>
            <input type="password" name="password" placeholder="Mật khẩu">
        </div>
        <div class="box">
            <p>Họ tên</p>
            <input type="text" name="ho-ten" placeholder="Họ tên">
        </div>
        <div class="box">
            <p>Email</p>
            <input type="email" name="email" placeholder="Email">
        </div>
        <div class="box">
            <p>Số điện thoại</p>
            <input type="text" name="so-dien-thoai" placeholder="Số điện thoại">
        </div>
        <div class="box">
            <p>Vai trò</p>
            <select name="vai-tro">
                <option value="1">Admin</option>
                <option value="2">Đạo diễn</option>
                <option value="3">Diễn viên</option>
                <option value="4">Người dùng</option>
            </select>
        </div>
        <div class="box">
            <p>Ngày sinh</p>
            <input type="date" name="ngay-sinh" placeholder="Ngày sinh">
        </div>
        <div class="box"><input type="submit" value="Thêm"></div>

    </form>
    </div>
        <?php
            include("connect.php");
            if(!empty($_POST["ten-dang-nhap"])&&
                !empty($_POST["password"])&&
                !empty($_POST["ho-ten"])&&
                !empty($_POST["email"])&&
                !empty($_POST["so-dien-thoai"])&&
                !empty($_POST["vai-tro"])&&
                !empty($_POST["ngay-sinh"])){

                    $tenDangNhap = $_POST["ten-dang-nhap"];
                    $password = $_POST["password"];
                    $hoTen = $_POST["ho-ten"];
                    $email = $_POST["email"];
                    $soDienThoai = $_POST["so-dien-thoai"];
                    $vaiTro = $_POST["vai-tro"];
                    $ngaySinh = $_POST["ngay-sinh"];

                    $sql = "INSERT INTO `nguoi_dung`(`ten_dang_nhap`, `mat_khau`, `ho_ten`, `email`, `sdt`, `vai_tro_id`, `ngay_sinh`) VALUES ('$tenDangNhap','$password','$hoTen','$email','$soDienThoai','$vaiTro','$ngaySinh')";
                    mysqli_query($conn,$sql);
                    mysqli_close($conn);
                    header('location: index.php?page_layout=nguoidung');
                }else{
                    echo '<p class="warning">Vui lòng nhập đầy đủ thông tin</p>';
                }
        ?>

</body>
</html>