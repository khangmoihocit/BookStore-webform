<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhapDangKy.aspx.cs" Inherits="btl_laptrinhweb.DangNhapDangKy" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>


<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/dangnhapdangky.css" />
</head>
<body>

    <uc:Header runat="server" ID="header1" />
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text="Label" CssClass="message-error" Visible="false"></asp:Label>
        <div class="container-1">
            <div class="login-container">
                <div class="tab">
                    <asp:LinkButton ID="btnSwitchLogin" runat="server" CssClass="tab-link active" OnClick="SwitchToLogin">Đăng nhập</asp:LinkButton>
                    <asp:LinkButton ID="btnSwitchRegister" runat="server" CssClass="tab-link" OnClick="SwitchToRegister">Đăng ký</asp:LinkButton>
                </div>


                <!-- Panel Đăng nhập -->
                <asp:Panel ID="pnlLogin" runat="server">
                    <div class="form-group">
                        <label>EMAIL <span class="required">*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email" Placeholder="Nhập Email" />
                    </div>

                    <div class="form-group">
                        <label>MẬT KHẨU <span class="required">*</span></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" Placeholder="Nhập Mật khẩu" />
                    </div>

                    <div class="forgot-password">
                        <asp:HyperLink runat="server" NavigateUrl="#">Quên mật khẩu?</asp:HyperLink>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="ĐĂNG NHẬP" CssClass="login-button" OnClick="btnLogin_Click" />

                    <p class="note">
                        Template Stationery cam kết bảo mật thông tin của bạn.
                    </p>
                </asp:Panel>

                <!-- Panel Đăng ký -->
                <asp:Panel ID="pnlRegister" runat="server" Visible="false">
                    <div class="form-group">
                        <label>HỌ <span class="required">*</span></label>
                        <asp:TextBox ID="txtLastName" runat="server" Placeholder="Nhập Họ" />
                    </div>

                    <div class="form-group">
                        <label>TÊN <span class="required">*</span></label>
                        <asp:TextBox ID="txtFirstName" runat="server" Placeholder="Nhập Tên" />
                    </div>

                    <div class="form-group">
                        <label>SỐ ĐIỆN THOẠI <span class="required">*</span></label>
                        <asp:TextBox ID="txtPhone" runat="server" Placeholder="Nhập SĐT" />
                    </div>

                    <div class="form-group">
                        <label>EMAIL <span class="required">*</span></label>
                        <asp:TextBox ID="txtEmailRegister" runat="server" TextMode="Email" Placeholder="Nhập Email" />
                    </div>

                    <div class="form-group">
                        <label>MẬT KHẨU <span class="required">*</span></label>
                        <asp:TextBox ID="txtPasswordRegister" runat="server" TextMode="Password" Placeholder="Nhập Mật khẩu" />
                    </div>

                    <asp:Button ID="btnRegister" runat="server" Text="TẠO TÀI KHOẢN" CssClass="login-button" OnClick="btnRegister_Click" />
                </asp:Panel>
            </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />

</body>
</html>
