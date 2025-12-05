        <?php
            include("connect.php");
            if(!empty($_POST["ten-phim"])&&
                !empty($_POST["dao-dien"])&&
                !empty($_POST["nam-phat-hanh"])&&
                !empty($_POST["poster"])&&
                !empty($_POST["quoc-gia"])&&
                !empty($_POST["so-tap"])&&
                !empty($_POST["trailer"])&&
                !empty($_POST["the-loai"])&&
                !empty($_POST["mo-ta"])){

                    $tenPhim = $_POST["ten-phim"];
                    $idDaoDien = $_POST["dao-dien"];
                    $namPhatHanh = $_POST["nam-phat-hanh"];
                    $poster = $_POST["poster"];
                    $quocGia = $_POST["quoc-gia"];
                    $soTap = $_POST["so-tap"];
                    $trailer = $_POST["trailer"];
                    $theLoai = $_POST["the-loai"];
                    $moTa = $_POST["mo-ta"];

                    $sql = "INSERT INTO `phim`(`ten_phim`, `dao_dien_id`, `nam_phat_hanh`, `poster`, `quoc_gia_id`, `so_tap`, `trailer`, `mo_ta`) VALUES ('$tenPhim','$idDaoDien','$namPhatHanh','$poster','$quocGia','$soTap','$trailer','$moTa')";
                    mysqli_query($conn,$sql);
                    $phim_id = mysqli_insert_id($conn);
                    foreach($theLoai as $tl){
                        $sql = "INSERT INTO phim_the_loai(phim_id, the_loai_id) VALUES ($phim_id, $tl)";
                        mysqli_query($conn, $sql);
                    }
                    mysqli_close($conn);
                    header('location: index.php?page_layout=phim');
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
    <div class="container">
    <form action="index.php?page_layout=themphim" method="post">   
        <h1>Thêm phim</h1>
        <div class="box">
            <p>Phim</p>
            <input type="text" name="ten-phim" placeholder="Tên phim">
        </div>
        <div class="box">
            <p>Đạo diễn</p>
            <select name="dao-dien">
                <?php 
                    include("connect.php");
                    $sql = "SELECT nd.* FROM nguoi_dung nd Where vai_tro_id = 2";
                    $result = mysqli_query($conn, $sql);
                    while($daoDien = mysqli_fetch_array($result)){
                ?> 
                    <option value="<?php echo $daoDien['id'] ?>"><?php echo $daoDien['ho_ten'] ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="box">
            <p>Năm phát hành</p>
            <input type="text" name="nam-phat-hanh" placeholder="Năm phát hành">
        </div>
        <div class="box">
            <p>Poster</p>
            <input type="text" name="poster" placeholder="Poster">
        </div>
        <div class="box">
            <p>Quốc gia</p>
            <select name="quoc-gia">
                <?php 
                    $sql = "SELECT * FROM quoc_gia";
                    $result = mysqli_query($conn, $sql);
                    while($quocGia = mysqli_fetch_array($result)){
                ?> 
                    <option value="<?php echo $quocGia['id'] ?>"><?php echo $quocGia['ten_quoc_gia'] ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="box">
            <p>Số tập</p>
            <input type="number" name="so-tap" placeholder="Số tập">
        </div>
        <div class="box">
            <p>Trailer</p>
            <input type="text" name="trailer" placeholder="Trailer">
        </div>
        <div class="box theloai">
            <p>Thể loại</p>
            <?php
                $sql = "SELECT * FROM the_loai";
                $result = mysqli_query($conn, $sql);
                while($theLoai = mysqli_fetch_array($result)){
            ?>
                <input style="width: fit-content;" type="checkbox" name="the-loai[]" value="<?php echo $theLoai['id']; ?>"><?php echo $theLoai['ten_the_loai']; ?><br>
            <?php } ?>
        </div>
        <div class="box">
            <p>Mô tả</p>
            <textarea name="mo-ta" placeholder="Mô tả"></textarea>
        </div>
        <div class="box"><input type="submit" value="Thêm"></div>

    </form>
    <div>
</body>
</html>