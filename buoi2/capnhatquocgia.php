        <?php
            include("connect.php"); 
            if(!empty($_POST["ten-quoc-gia"])){

                    $tenQuocGia = $_POST["ten-quoc-gia"];
                    $id = $_GET['id'];
                    $sql = "UPDATE `quoc_gia` SET `ten_quoc_gia`='$tenQuocGia' WHERE id = '$id'";
                    mysqli_query($conn,$sql);
                    mysqli_close($conn);
                    header('location: index.php?page_layout=quocgia');
                }else{
                    echo '<p class="warning">Vui lòng nhập đầy đủ thông tin</p>';
                }
        ?>

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
    <?php
        include("connect.php"); 
        $id = $_GET['id'];
        $sql = "SELECT * FROM quoc_gia WHERE id = '$id'";
        $result = mysqli_query($conn,$sql);
        $quocGia = mysqli_fetch_assoc($result);
    ?>
    <div class="container">
    <form action="index.php?page_layout=capnhatquocgia&id=<?php echo $id ?>" method="post">   
        <h1>Cập nhật quốc gia</h1>
        <div class="box">
            <p>Tên quốc gia</p>
            <input type="text" name="ten-quoc-gia" placeholder="Tên quốc gia" value="<?php echo $quocGia['ten_quoc_gia']?>">
        </div>
        
        <div class="box"><input type="submit" value="Cập nhật"></div>

    </form>
    </div>
</body>
</html>