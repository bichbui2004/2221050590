<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table{
            width: 100%;
        }
        .btn{
            padding: 5px;
            color: black;
            border: 1px solid black;
            border-radius: 5px;
        }
        .them{
            background-color: white;
            border: 1px solid black;
            padding: 10px 20px;
            color: black;
            border-radius: 5px;

        }
        td{
            padding: 10px;
        }
        .chucnang{
            display: flex;
            gap: 5px;
            justify-content: center;
        }
        .control{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .mota{
            width: 25%;
        }
    </style>
</head>
<body>
    <div class="control">
        <h1>Danh sách phim</h1>
        <div>
            <a class="them" href="index.php?page_layout=themphim">Thêm</a>
        </div>
    </div>
    <table border=1>
        <tr>
            <th>Phim</th>
            <th>Đạo diễn</th>
            <th>Năm phát hành</th>
            <th>Poster</th>
            <th>Quốc gia</th>
            <th>Số tập</th>
            <th>Trailer</th>
            <th>Thể loại</th>
            <th>Mô tả</th>
            <th>Chức năng</th>
        </tr>
        <?php 
            include("connect.php");
            $sql = "SELECT p.*, qg.ten_quoc_gia, nd.ho_ten as ten_dao_dien, GROUP_CONCAT(tl.ten_the_loai) AS the_loai FROM phim p JOIN quoc_gia qg ON p.quoc_gia_id = qg.id JOIN nguoi_dung nd ON p.dao_dien_id = nd.id JOIN phim_the_loai ptl ON p.id = ptl.phim_id JOIN the_loai tl ON tl.id = ptl.the_loai_id GROUP BY p.id";
            $result = mysqli_query($conn, $sql);
            while($row = mysqli_fetch_array($result)){
        ?> 
        <tr>
            <td><?php echo $row["ten_phim"] ?></td>
            <td><?php echo $row["ten_dao_dien"] ?></td>
            <td><?php echo $row["nam_phat_hanh"] ?></td>
            <td><?php echo $row["poster"] ?></td>
            <td><?php echo $row["ten_quoc_gia"] ?></td>
            <td><?php echo $row["so_tap"] ?></td>
            <td><?php echo $row["trailer"] ?></td>
            <td><?php echo $row["the_loai"] ?></td>
            <td class="mota"><?php echo $row["mo_ta"] ?></td>
            <td class="chucnang">
                <a class="btn" href="index.php?page_layout=capnhatphim&id=<?php echo $row["id"] ?>">Cập nhật</a>
                <a class="btn" href="xoaphim.php?id=<?php echo $row["id"] ?>">Xóa</a>
            </td>
        </tr>
        <?php }?>
    </table>
</body>
</html>