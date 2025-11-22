<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buổi 1 php</title>
</head>
<body>
    <?php
    // Dùng // hoặc # để chú thích
    //1. In ra màn hình
    echo "Hello world! <br>";
    echo "Hi <br>";
    // có thể chèn html, js vào php

    //2. Biến
    //Cú pháp: $ + tên biến = giá trị của biến
    $ten = "Bui Ngoc Bich";
    $tuoi = 21;
    echo $ten . "<br>";
    //Nối chuỗi dùng dấu .
    echo $ten . " " . $tuoi . " tuổi <br>";
    
    //3. Hằng
    //Cú pháp: define("tên hằng","giá trị của hằng")
    define("soPi","3.14");
    echo soPi . "<br>";

    //4. Phân biệt ' ' và " "
    echo '$ten' . "<br>";   //$ten là 1 chuỗi bình thường, ghi ra chuỗi $ten
    echo "$ten" . "<br>";    //ghi ra giá trị của biến

    //5. Chuỗi
    #5.1 Kiểm tra độ dài của chuỗi
    echo strlen($ten) . "<br>";
    #5.2 Đếm số từ
    echo str_word_count($ten) . "<br>";
    #5.3 Tìm kiếm ký tự trong chuỗi
    echo strpos($ten, "i") . "<br>";  //tìm kiếm ví trị đầu tiên xuất hiện trong chuỗi
    #5.4 Thay thế kí tự trong chuỗi: str_replace(cũ, mới, biến)
    echo str_replace("Bich","Anh", $ten) . "<br>";

    //6. Toán tử
    $soThuNhat = 10;
    $soThuHai = 5;
    #phép cộng
    echo $soThuNhat + $soThuHai . "<br>";
    #trừ
    echo $soThuNhat - $soThuHai . "<br>";
    #nhân
    echo $soThuNhat * $soThuHai . "<br>";
    #chia
    echo $soThuNhat / $soThuHai . "<br>";
    #gán: += -= *= /= %=
    echo $soThuNhat %= $soThuHai ;
    #so sánh == != > < >= <= ===
    echo $soThuNhat == $soThuHai ;

    //7. Câu điều kiện
    // if("điều kiện){
    //     logic
    // }
    // elseif("Điều kiện"){
    //     logic
    // }
    //VD: Kiểm tra tổng của số thứ nhất và số thứ 2 nếu bằng 15 thì in ra tổng =15 
    // còn lại in ra lớn hơn 15
    $tong = $soThuNhat + $soThuHai;
    if("$tong==15"){
        echo 'Tổng = 15';
    } elseif("$tong>15"){
        echo 'Tong > 15';
    }else{
        echo 'Tổng < 15';
    }
    echo "<br>";
    
    //8. switch case
    $color = "red";
    switch ($color){
        case "red":
            echo "is red";
            break;
        case "blue":
            echo "is blue";
            break;
        default:
            echo "no color";
            break;
    }

    //9. for
    // for ($i=0; $i <100; $i++){
    //     echo $i . "<br>";
    // }
    echo "<br>";
    //10. Mảng
    $mang = ["Anh", "Nhat Anh", "Vu Anh"];

    // đếm phần tử
    echo count($mang) . "<br>";
    echo $mang[1] . "<br>";
    //in cả mảng
    print_r($mang);
    echo "<br>";
    //đổi phần tử trong mảng
    $mang[0] = "Hai Anh";
    $mang[] = "Tam";
    print_r($mang);
    //xóa phần tử của mảng
    echo "<br>";
    unset($mang[3]);
    print_r($mang);
    ?>
</body>
</html>