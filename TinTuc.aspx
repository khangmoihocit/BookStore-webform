<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="btl_laptrinhweb.TinTuc" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tin Tức </title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css" />
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="assets/css/TinTuc.css">
</head>
<body>
    <uc:Header runat="server" ID="header1" />

    <div class="container-1">
        <div class="tin">
            <div class="hangngang">
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=3">
                        <img src="assets\images\t3.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>Hướng dẫn chọn bút kí hợp phong thủy</h3>
                    </a>
                    <p>Biết cách chọn bút ký hợp phong thủy là một trong những kỹ năng cần thiết của giới mộ điệu bút ký. Sở hữu một cây bút hợp phong thủy giúp...</p>
                </div>
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=4">
                        <img src="assets\images\t4.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>Bí quyết  hạnh phúc của người dân Bắc Âu khiến cả thế giới ngưỡng mộ </h3>
                    </a>
                    <p>Bắc Âu là phần lãnh thổ bao gồm 14 quốc gia và vùng lãnh thổ, trong đó có những cái tên nổi tiếng như Đan Mạch, Thụy Điển, Na Uy, Phần La...</p>
                </div>
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=5">
                        <img src="assets\images\t5.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>Khí Chất Bao Nhiêu Hạnh Phúc Bấy Nhiêu</h3>
                    </a>
                    <p>Hãy sống như một trái dứa: Đầu đội vương miện, dáng đứng hiên ngang – Bên ngoài gai góc, bên trong ngọt ngào.” Cũng giống như trái dứa, k...</p>
                </div>
            </div>
            <div class="hangngang">
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=6">
                        <img src="assets\images\t6.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>Quên Một Người Là Chuyện Của Thời Gian</h3>
                    </a>
                    <p>Thanh xuân như một tách cà phê phin, từng phút lại có một giọt rơi xuống ly, nhưng cuối cùng ta lại được một ly cà phê thơm ngon. Cũng nh...</p>
                </div>
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=2">
                        <img src="assets\images\t2.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>9 điều giúp bạn thiết lập "Văn phòng làm việc"tại nhà cho riêng mình hoàn hảo nhất </h3>
                    </a>
                    <p>Đáp ứng đủ 9 yếu tố dưới đây, phòng làm việc của bạn sẽ thật thoải mái và mang lại hiệu quả cao để bạn có động lực phấn đấu làm việc suốt...</p>
                </div>
                <div class="group-tintuc">
                    <a href="ChiTietTinTuc.aspx?id=1">
                        <img src="assets\images\t1.webp" alt="">
                        <div class="ngay">
                            <b>18
                            <br>
                                7/2025</b>
                        </div>
                        <h3>Review sách Xa ngoài kia nơi loài tôm hát của Delia Owens</h3>
                    </a>
                    <p>Cuốn sách Xa ngoài kia nơi loài tôm hát (Tên gốc: Where the Crawdads Sing) tiểu thuyết đầu tay của nhà văn Delia Owens được xuất bản lần ...</p>
                </div>
            </div>
        </div>
    </div>
    <uc:Footer runat="server" ID="footer" />
</body>
</html>
