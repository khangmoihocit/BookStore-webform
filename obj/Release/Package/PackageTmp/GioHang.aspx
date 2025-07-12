<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="btl_laptrinhweb.GioHang" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giỏ hàng</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/giohang.css">
</head>

<style>
    .btn-checkout {
        padding: 10px;
        color: #fff;
        border: 1px solid var(--color-primary);
        background-color: var(--color-primary);
        border-radius: 50px;
        margin-top: 20px;
    }

        .btn-checkout:hover {
            background-color: #fff;
            color: #000;
        }

    .inner-payment {
        width: 30%;
        display: flex;
        flex-direction: column;
        align-items: center;
        border: 1px solid var(--color-primary);
        margin-bottom: 30px;
    }

    .total-amount-value{
        font-size: 18px;
        color: red;
    }
</style>
<body>
    <uc:Header runat="server" ID="header1" />
    <div class="section-0">
        <div class="container">
            <ul class="inner-wrap">
                <li><a href="TrangChu.aspx">Trang chủ</a></li>
                <li>/</li>
                <li class="inner-text-active">Giỏ hàng</li>
            </ul>
            <div class="inner-title">
                <asp:Label ID="lblHeader" runat="server" Text="GIỎ HÀNG"></asp:Label>
            </div>
        </div>
    </div>
    <asp:Label ID="lblMessage" runat="server" CssClass="message-error" Visibel="false" Text=""></asp:Label>
    <form id="form1" runat="server">
        <div class="section">
            <div class="container">
                <div class="inner-wrap">
                    <div class="inner-wrap2">
                        <asp:Repeater ID="rptGioHang" runat="server" OnItemCommand="rptGioHang_ItemCommand">
                            <HeaderTemplate>
                                <div class="inner-item-header">
                                    <asp:CheckBox ID="chkSelectAll" runat="server" Text=" Chọn tất cả" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="inner-item">
                                    <asp:CheckBox ID="chkChonSanPham" runat="server" CssClass="chk-item" AutoPostBack="true" OnCheckedChanged="chkChonSanPham_CheckedChanged" />
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("URLAnh") %>' />
                                    <div class="inner-group">
                                        <asp:Label ID="lblTenSanPham" CssClass="inner-title" runat="server" Text='<%# Eval("TenSach") %>'></asp:Label>
                                        <div class="inner-price">
                                            <asp:Label ID="lblGiaBanMoi" CssClass="inner-price-new" runat="server" Text='<%# Eval("GiaBanMoi") %>'></asp:Label>
                                            <asp:Label ID="lblGiaBanCu" CssClass="inner-price-old" runat="server" Text='<%# Eval("GiaBanCu") %>'></asp:Label>
                                        </div>
                                        <div class="inner-quantity">
                                            <div>Số lượng: </div>
                                            <asp:TextBox ID="txtSoLuong" Text='<%# Eval("SoLuong") %>'
                                                TextMode="Number" min="1" AutoPostBack="true" OnTextChanged="txtSoLuong_TextChanged" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="inner-delete" CommandName="Xoa"
                                        CommandArgument='<%# Eval("MaSach") %>'>Xoá</asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- Khu vực thanh toán -->
                    <div class="inner-payment" id="divPayment" runat="server">
                        <h3>Thanh toán</h3>
                        <div class="total-summary">
                            <span>Tổng tiền hàng:</span>
                            <asp:Label ID="lblTotalAmount" runat="server" Text="0đ" CssClass="total-amount-value"></asp:Label>
                        </div>
                        <asp:Button ID="btnThanhToan" runat="server" Text="Tiến hành thanh toán"  Enable="true" OnClick="btnThanhToan_Click" CssClass="btn-checkout" />
                    </div>


                </div>
            </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />
</body>
</html>
