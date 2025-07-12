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

    <div class="section-0">
        <div class="container">
            <ul class="inner-wrap">
                <li><a href="TrangChu.aspx">Trang chủ</a></li>
                <li>/</li>
                <li class="inner-text-active">Thông tin cá nhân</li>
            </ul>
            <div class="inner-title">
                <asp:Label ID="lblTitle" runat="server" Text="Thông tin cá nhân"></asp:Label>
            </div>
        </div>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="inner-wrap-info">
                <div class="inner-info">
                    <div class="form-group">
                        <div class="inner-title">Họ và tên</div>
                        <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="inner-title">Email</div>
                        <asp:TextBox ID="txtEmail" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="inner-title">Số điện thoại</div>
                        <asp:TextBox ID="txtSoDienThoai" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
    <div class="inner-title">Địa chỉ</div>
    <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
</div>

                    <div class="form-group">
                        <div class="inner-title">Ngày đăng ký</div>
                        <asp:TextBox ID="txtNgayDangKy" runat="server" ReadOnly="true" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="inner-title">Quyền</div>
                        <asp:TextBox ID="txtQuyen" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="inner-button">
                        <asp:Button ID="btnLuuThongTin" CssClass="btn" runat="server" Text="Lưu thông tin" OnClick="btnLuuThongTin_Click" />
                        <asp:Button ID="btnDangXuat" CssClass="btn btn-active" runat="server" Text="Đăng xuất" OnClick="btnDangXuat_Click" />
                         <asp:Button ID="btnAdmin" Visible="false" Eneble="false" CssClass="btn btn-active" runat="server" Text="Trang quản trị" OnClick="btnAdmin_Click" />
                    </div>
                </div>

                <div class="inner-order" >
                    <asp:Literal ID="ltlLichSuMuaHang" runat="server"></asp:Literal> 
                </div>


            </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />
</body>

</html>
