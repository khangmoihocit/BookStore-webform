<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KetQuaTimKiem.aspx.cs" Inherits="btl_laptrinhweb.KetQuaTimKiem" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kết quả tìm kiếm</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/danhsachsanpham.css" />
</head>

<body>
    <uc:Header runat="server" ID="header1" />
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="search-title">Kết quả tìm kiếm cho: <span id="search-keyword"></span></h2>
            <!-- Danh sách sản phẩm -->
            <div class="product-list-result">
                <asp:Repeater ID="rptSach" runat="server" OnItemCommand="rptSach_ItemCommand">
                    <ItemTemplate>
                        <div class="product">
                            <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                            <asp:HyperLink runat="server"
                                NavigateUrl='<%# String.Format("ChiTietSanPham.aspx?MaSach={0}", Eval("MaSach")) %>'>
                     <img class="inner-image" src='<%# Eval("URLAnh") %>' alt="ảnh sản phẩm">
                            </asp:HyperLink>
                            <div class="inner-title">
                                <%# Eval("TenSach") %>
                            </div>
                            <div class="inner-price">
                                <div class="inner-price-new">
                                    <%# Eval("GiaBanMoi") %>
                                </div>
                                <div class="inner-price-old">
                                    <%# Eval("GiaBanCu") %>
                                </div>
                            </div>
                            <asp:LinkButton ID="btnThemGioHang"
                                CommandName="ThemGioHang"
                                CommandArgument='<%# Eval("MaSach") %>'
                                runat="server"
                                CssClass="inner-add-to-cart">
                     <i class="fa-solid fa-cart-shopping"></i>
                     Thêm giỏ hàng
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />
</body>
</html>
