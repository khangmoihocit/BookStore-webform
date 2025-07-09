<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongTinNguoiDung.aspx.cs"
    Inherits="btl_laptrinhweb.ThongTinNguoiDung" %>

    <%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
        <%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <title>Thông tin cá nhân</title>
                <!-- icon -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
                    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" href="assets\css\reset.css">
                <link rel="stylesheet" href="assets\css\base.css">

                <link rel="stylesheet" href="assets\css\thongtinnguoidung.css">
            </head>

            <body>
                <uc:Header runat="server" ID="header1" />
                <form id="form1" runat="server">
                    <div class="container">
                        <div class="inner-wrap">
                            <div class="inner-info">
                                <div class="form-group">
                                    <div class="inner-title">Họ và tên</div>
                                    <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="inner-title">Email</div>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="inner-title">Số điện thoại</div>
                                    <asp:TextBox ID="txtSoDienThoai" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="inner-title">Ngày đăng ký</div>
                                    <asp:TextBox ID="txtNgayDangKy" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="inner-button">
                                    <button>Lưu thông tin</button>
                                </div>
                            </div>

                            <div class="inner-order">

                            </div>


                        </div>
                    </div>
                </form>
                <uc:Footer runat="server" ID="footer" />
            </body>

            </html>