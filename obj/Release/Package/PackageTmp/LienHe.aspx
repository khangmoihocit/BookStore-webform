<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="btl_laptrinhweb.LienHe" %>
<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Liên hệ</title>
    <!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets\css\reset.css">
    <link rel="stylesheet" href="assets\css\base.css"> 
   
    <link rel="stylesheet" href="assets\css\LienHe.css">
</head>
<body>
    <uc:Header runat="server" ID="header1" />
     <div class="section-0">
     <div class="container">
         <ul class="inner-wrap">
             <li><a href="TrangChu.aspx">Trang chủ</a></li>
             <li>/</li>
             
             <li class="inner-text-active">Liên hệ</li>
         </ul>
         <div class="inner-title">
             <asp:Label ID="lblTitle" runat="server" Text="Liên hệ"></asp:Label>
         </div>
     </div>
 </div>
    <div class="container-1">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.1846224875453!2d105.8374676638765!3d20.98523521321817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac5d6ec1b8cf%3A0x982365cd4337fdc8!2zS2hvYSBDw7RuZyBOZ2jhu4cgVGjDtG5nIFRpbiwg
           VHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBN4bufIEjDoCBO4buZaQ!5e0!3m2!1svi!2s!4v1751264802931!5m2!1svi!2s"></iframe>
        </div>

        <div class="khoiinput">
            <h2>LIÊN HỆ CHÚNG TÔI</h2>
            <p>Để liên hệ và nhận các thông tin khuyến mãi sớm nhất, Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất</p>

            <form action="#" method="POST">
                <div class="form-group">
                    <label for="fullName">
                        Họ và tên
                        <span class="dau">*</span><br>
                    </label>
                    <input type="text" id="fullName" name="fullName" placeholder="Nhập họ và tên" required>
                </div>

                <div class="form-group">
                    <label for="email">
                        Email
                        <span class="dau">*</span>
                    </label>
                    <br>
                    <input type="email" id="email" name="email" placeholder="Nhập địa chỉ Email" required>
                </div>

                <div class="form-group">
                    <label for="phone">
                        Điện thoại
                        <span class="dau">*</span>
                    </label>
                    <br>
                    <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                </div>

                <div class="form-group">
                    <label for="message">
                        Nội dung
                        <span class="dau">*</span>
                    </label>
                    <br>
                    <textarea id="message" name="message" placeholder="Nội dung liên hệ" required></textarea>
                </div>

                <button type="submit" class="submit-button">GỬI LIÊN HỆ NGAY</button>
            </form>
        </div>
    </div>
    <uc:Footer runat="server" ID="footer" />
</body>
</html>
