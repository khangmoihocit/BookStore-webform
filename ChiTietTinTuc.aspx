<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="btl_laptrinhweb.ChiTietTinTuc" %>
<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chi tiết tin tức</title>
    <!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="assets\css\chitiettintuc.css">
</head>
<body>
    <uc:Header runat="server" ID="header1" />
    <div class="container">
        <div class="khoi">
            <div class="khoi1">
                <h3>Bài Viết Liên Quan</h3>
                <div class="kengang">
                    <div class="kedam"></div>
                    <div class="nhat"></div>
                </div>
                <div class="dsbaiviet">


                    <ul>
                        <li>
                            <a id="link1" href="">
                                <div class="baivietlienquan">
                                    <div class="bvlq-img">
                                        <img id="anh1" src="image\t6.webp" alt="">
                                    </div>
                                    <div class="bvlq-text">
                                        <span id="text1">Quên người là chuyện của thời gian</span>
                                    </div>
                                </div>

                            </a>
                        </li>
                        <li>
                            <a id="link2" href="">
                                <div class="baivietlienquan">
                                    <div class="bvlq-img">
                                        <img id="anh2" src="image\t6.webp" alt="">
                                    </div>
                                    <div class="bvlq-text">
                                        <span id="text2">Quên người là chuyện của thời gian</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a id="link3" href="">
                                <div class="baivietlienquan">
                                    <div class="bvlq-img">
                                        <img id="anh3" src="image\t6.webp" alt="">
                                    </div>
                                    <div class="bvlq-text">
                                        <span id="text3">Quên người là chuyện của thời gian</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a id="link4" href="">
                                <div class="baivietlienquan">
                                    <div class="bvlq-img">
                                        <img id="anh4" src="image\t6.webp" alt="">
                                    </div>
                                    <div class="bvlq-text">
                                        <span id="text4">Quên người là chuyện của thời gian</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a id="link5" href="">
                                <div class="baivietlienquan">
                                    <div class="bvlq-img">
                                        <img id="anh5" src="image\t6.webp" alt="">
                                    </div>
                                    <div class="bvlq-text">
                                        <span id="text5">Quên người là chuyện của thời gian</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
            <div class="khoi2">
                <div class="noidungbaiviet">
                    <p id="ndbv"></p>
                </div>
                <div class="form-binhluan">
                    <form action="">
                        <h3>Viết bình luận của bạn</h3>
                        <label>Địa chỉ email của bạn sẽ được bảo mật , các trường bắt buộc được đánh dấu </label>
                        <span class="dausao">*</span><br>
                        <br>
                        <div class="hotenemail">
                            <div class="form-group">
                                <label class="dam" for="fullName">Họ tên <span class="dausao">*</span></label><br>
                                <input type="text" id="fullname" name="fullname" placeholder="Họ tên ">
                            </div>
                            <div class="form-group">
                                <label class="dam" for="email">Email <span class="dausao">*</span></label><br>
                                <input type="email" id="email" name="email" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="dam" for="noidung">Nội dung <span class="dausao">*</span></label><br>
                            <textarea name="noidung" id="noidung" placeholder="Nội dung"></textarea>
                        </div>
                        <button type="submit">GỬI BÌNH LUẬN </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <uc:Footer runat="server" ID="footer" />
    
</body>

    <script src="assets\js\TinTuc.js"></script>

<script>
    console.log(dsbaibao);
    const baibao = dsbaibao.find(s => s.id === <%= ids %>)
    console.log(baibao);
    bb = document.getElementById("ndbv")
    bb.innerHTML = baibao.noidung
    // Lọc ra danh sách bài viết còn lại
    const dsbbconlai = dsbaibao.filter(b => b.id !== <%= ids %>);

    // Cập nhật 5 bài liên quan
    for (let i = 0; i < 5; i++) {
        const bv = dsbbconlai[i];
        const link = document.getElementById(`link${i + 1}`);
        const img = document.getElementById(`anh${i + 1}`);
        const text = document.getElementById(`text${i + 1}`);
        console.log(bv.hinhanh)
        if (link) link.href = `ChiTietTinTuc.aspx?id=${bv.id}`;


        if (img) img.src = bv.hinhanh;

        if (text) text.innerHTML = bv.tieude;
    }



</script>
</html>
