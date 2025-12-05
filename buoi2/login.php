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
        //Nối file
        include('connect.php');
        if(isset($_POST['username']) && isset($_POST['password'])){
        $tenDangNhap = $_POST['username'];  //method dùng gì thì ở dưới dùng cái đó
        $matKhau = $_POST['password'];
        //Nếu tên đăng nhập = admin
        //Mật khẩu 123 thì cho phép người dùng vào trang chủ
        //session_start();
        // $tenDangNhap = $_POST['username'];  //method dùng gì thì ở dưới dùng cái đó
        // $matKhau = $_POST['password'];
        // echo $tenDangNhap ."<br>";
        // echo $matKhau;   
        $sql = "select * from nguoi_dung where ten_dang_nhap = '$tenDangNhap' and mat_khau = '$matKhau'"; 
        //echo $sql;
        $result = mysqli_query($conn, $sql);
        if(mysqli_num_rows($result)>0){
            session_start();
            $_SESSION["username"] = $tenDangNhap;
            header('location: index.php');
        }
        else{
            echo "<p class='warning'>Sai thong tin dang nhap</p>";
        }
        // if(isset($_POST['username']) && isset($_POST['password'])){
        //     $tenDangNhap = $_POST['username'];  //method dùng gì thì ở dưới dùng cái đó
        //     $matKhau = $_POST['password'];
        //     //Nếu tên đăng nhập = admin
        //     //Mật khẩu 123 thì cho phép người dùng vào trang chủ
        //     if($tenDangNhap == 'admin' && $matKhau == '123'){
        //         $_SESSION["username"] = $tenDangNhap;
        //         header('location: trangchu.php');
        //     }else{
        //         echo "<p class='warning'>Sai thông tin</p>";
        //     }
        // }
    }
        
    ?>
</body>
</html>