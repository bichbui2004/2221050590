<?php 
    //cookie
    #lưu ở phía người dùng
    #lưu các thông tin ko/ít quan trọng, tiện ích, ko liên quan bảo mật
    $cookieName = "user";
    $cookieValue = "NgocAnh";
    // 86400 = 1 ngay
    setcookie($cookieName, $cookieValue, time()+(86400),"/");
    if(isset($_COOKIE[$cookieName])){
        echo "cookie đã tồn tại";
    }else{
        echo "cookie chưa tồn tại";
    }
    
    //session
    #Thông tin đăng nhập, giỏ hàng...(quan trọng)
    session_start();
    $_SESSION["name"] = "Ngoc Anh 123";
    echo $_SESSION["name"];
?>