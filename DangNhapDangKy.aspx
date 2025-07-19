<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhapDangKy.aspx.cs" Inherits="btl_laptrinhweb.DangNhapDangKy" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>


<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" xintegrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/dangnhapdangky.css" />
</head>
    <style>
        .login-button{
            margin-bottom: 100px;

                         
        }
        .message-error1{
            color: red;
            font-style: italic;
        }
    </style>
<body>

    <uc:Header runat="server" ID="header1" />
    <div class="section-0">
        <div class="container">
            <ul class="inner-wrap">
                <li><a href="TrangChu.aspx">Trang chủ</a></li>
                <li>/</li>
                <li class="inner-text-active">Đăng nhập-Đăng ký</li>
            </ul>
            <div class="inner-title">
                <asp:Label ID="lblTitle" runat="server" Text="Đăng nhập"></asp:Label>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">

        <div class="container-1">
            <div class="login-container">
                <div class="tab">
                    <asp:LinkButton ID="btnSwitchLogin" runat="server" CssClass="tab-link active" OnClick="SwitchToLogin">Đăng nhập</asp:LinkButton>
                    <asp:LinkButton ID="btnSwitchRegister" runat="server" CssClass="tab-link" OnClick="SwitchToRegister">Đăng ký</asp:LinkButton>
                </div>

                <!-- Panel Đăng nhập -->
                <asp:Panel ID="pnlLogin" runat="server">
                    <asp:Label ID="Label123" runat="server" Text="Label" CssClass="message-error" Visible="false"></asp:Label>
                    <div class="form-group">
                        <label>EMAIL <span class="required">*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email" Placeholder="Nhập Email" />
                        <asp:Label ID="lblMessage" runat="server" Text="Label" CssClass="message-error1" Visible="false"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>MẬT KHẨU <span class="required">*</span></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" Placeholder="Nhập Mật khẩu" />
                        <asp:Label ID="lblMessage2" runat="server" Text="Label" CssClass="message-error1" Visible="false"></asp:Label>
                    </div>

                    <div class="forgot-password">
                        <asp:HyperLink runat="server" NavigateUrl="#">Quên mật khẩu?</asp:HyperLink>
                    </div>
                    <asp:Label ID="mess3" runat="server" Text="Label" CssClass="message-error" Visible="false"></asp:Label>
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
                        <asp:Label ID="loiSDT" runat="server" CssClass="message-error1" Text="Label"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>EMAIL <span class="required">*</span></label>
                        <asp:TextBox ID="txtEmailRegister" runat="server" TextMode="Email" Placeholder="Nhập Email" />
                        <asp:Label ID="Loiemail" runat="server" CssClass="message-error1" Text="Label"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>MẬT KHẨU <span class="required">*</span></label>
                        <asp:TextBox ID="txtPasswordRegister" runat="server" TextMode="Password" Placeholder="Nhập Mật khẩu" />
                        <asp:Label ID="loimatkhau" runat="server" CssClass="message-error1" Text="Label"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>Quê quán<span class="required">*</span></label>
                        <asp:DropDownList ClientIDMode="Static" ID="ddlQueQuan" runat="server">
                            <asp:ListItem Selected="True" Value="">Vui lòng chọn quê quán</asp:ListItem>
                            <asp:ListItem Value="ha_noi">Hà Nội</asp:ListItem>
                            <asp:ListItem Value="hai_phong">Hải Phòng</asp:ListItem>
                            <asp:ListItem Value="bac_ninh">Bắc Ninh</asp:ListItem>
                        </asp:DropDownList>
                        <span  id="loiQueQuanSpan" class="message-error1" "></span>
                    </div>

                    <div class="form-group">
                        <label>CCCD<span class="required">*</span></label>
                        <asp:TextBox ClientIDMode="Static" ID="txtCCCD" runat="server" Placeholder="Nhập cccd" />
                        <span id="spanText" class="message-error1"></span>
                    </div>

                    <asp:Label ID="mess4" runat="server" Text="Label" CssClass="message-error" Visible="false"></asp:Label>
                    
                    <asp:Button ID="btnRegister" runat="server" Text="TẠO TÀI KHOẢN" CssClass="login-button" 
                        OnClick="btnRegister_Click" OnClientClick="return validateForm();" />
                </asp:Panel>
            </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />

</body>
    <script>
        function validateForm() {
            
            const ddlQueQuan = document.getElementById('ddlQueQuan');

            const queQuanError = document.getElementById('loiQueQuanSpan');

            const inputCCCD = document.getElementById('txtCCCD');
            const cccdError = document.getElementById('spanText');

            let isFormValid = true;

            if (ddlQueQuan.value === "") {
                queQuanError.innerHTML = "Vui lòng chọn quê quán.";
                isFormValid = false;
            } else {
                queQuanError.innerHTML = "";
            }

            const regexCCCD = /^[0-9]{8,10}$/;
            if (!regexCCCD.test(inputCCCD.value)) {
                cccdError.innerHTML = "CCCD sai định dạng.";
                isFormValid = false;
            } else {
                cccdError.innerHTML = "";
            }

            return isFormValid;
        }
    </script>
</html>
