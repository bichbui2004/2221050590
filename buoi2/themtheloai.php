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
            width:100%;
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
    <form action="index.php?page_layout=themtheloai" method="post">   
        <h1>Thêm thể loại</h1>
        <div class="box">
            <p>Tên thể loại</p>
            <input type="text" name="ten-the-loai" placeholder="Tên thể loại">
        </div>
        
        <div class="box"><input type="submit" value="Thêm"></div>

    </form>
    </div>
        <?php
            include("connect.php");
            if(!empty($_POST["ten-the-loai"])){

                    $tenTheLoai = $_POST["ten-the-loai"];

                    $sql = "INSERT INTO `the_loai`(`ten_the_loai`) VALUES ('$tenTheLoai')";
                    mysqli_query($conn,$sql);
                    mysqli_close($conn);
                    header('location: index.php?page_layout=theloai');
                }else{
                    echo '<p class="warning">Vui lòng nhập đầy đủ thông tin</p>';
                }
        ?>

</body>
</html>