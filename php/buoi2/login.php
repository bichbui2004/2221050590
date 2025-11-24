<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>php - Buổi 2</title>
</head>
<body>
    <form action="" method="post">  <!--action: thực hiện trên trang nào, method=get: thông tin bị lộ trên Url, method=post thông tin gửi đi ko bị lưu vết lại trên url-->
<!--Gửi thông tin: get, lấy thông tin: post-->    
    <h1>Đăng nhập</h1>
        <div>
            <input type="text" name="username" placeholder="Tên đăng nhập">
        </div>
        <div>
            <input type="password" name="password" placeholder="Mật khẩu">
        </div>
        <div><input type="submit" value="Đăng nhập"></div>

    </form>
    <?php 
        session_start();
        // $tenDangNhap = $_POST['username'];  //method dùng gì thì ở dưới dùng cái đó
        // $matKhau = $_POST['password'];
        // echo $tenDangNhap ."<br>";
        // echo $matKhau;    
        if(isset($_POST['username']) && isset($_POST['password'])){
            $tenDangNhap = $_POST['username'];  //method dùng gì thì ở dưới dùng cái đó
            $matKhau = $_POST['password'];
            //Nếu tên đăng nhập = admin
            //Mật khẩu 123 thì cho phép người dùng vào trang chủ
            if($tenDangNhap == 'admin' && $matKhau == '123'){
                $_SESSION["username"] = $tenDangNhap;
                header('location: trangchu.php');
            }else{
                echo "<p class='warning'>Sai thông tin</p>";
            }
        }
        
    ?>
</body>
</html>