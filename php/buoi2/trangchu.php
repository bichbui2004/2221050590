<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
</head>
<body>
    <?php 
        session_start();
        if(!isset($_SESSION["username"])){
            header('location: login.php');
        }    
    ?>

    <h1>Trang chủ</h1>
    <?php 
        echo "xin chào " . $_SESSION["username"];
    ?>
</body>
</html>