let danhSachPhim = [
    {
        id: 1,
        tenPhim: "Mưa đỏ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: 2,
        quocGia: "Việt Nam",
        poster: "../fpt/img/mua-do2-1122.jpeg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 2,
        tenPhim: "Thám tử lừng danh Conan",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: 1.5,
        quocGia: "Nhật Bản",
        poster: "../fpt/img/phim/conan.jpg",
        theLoai: "Phim hoạt hình"        
    },
    {
        id: 3,
        tenPhim: "Người đẹp và quái vật",
        namPhatHanh: 2025,
        tuoi: 10,
        thoiLuong: 2,
        quocGia: "Mỹ",
        poster: "../fpt/img/phim/beautyandthebeaets.jpg",
        theLoai: "Phim chiếu rạp"        
    }
];

let phimHienTai = danhSachPhim[0];
let banner = document.getElementsByClassName('banner')[0];
function chonPhim(idPhim){
    for(let i = 0; i <danhSachPhim.length; i++){
        if(danhSachPhim[i].id == idPhim){
            banner.querySelector('img').src = danhSachPhim[i].poster;
        }
    }
}
//thêm nút trailer