<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="btl_laptrinhweb.Category" %>
<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/category.css">
</head>

<body>
   <uc:Header runat="server" ID="header1"/>

    <!-- Section -->
    <form runat="server" id="form1">
        <div class="section">
            <div class="container">
                <div class="inner-wrap" runat="server">
                    <div class="inner-filter">
                        <div class="inner-category-book">
                            <div class="inner-title">THỂ LOẠI SÁCH</div>
                            <div class="inner-content">
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="inner-list-box">
                                    <asp:ListItem Value="1" CssClass="inner-box">Văn học</asp:ListItem>
                                    <asp:ListItem Value="2" CssClass="inner-box">Trinh thám</asp:ListItem>
                                    <asp:ListItem Value="3" CssClass="inner-box">Tâm lý</asp:ListItem>
                                    <asp:ListItem Value="4" CssClass="inner-box">Kinh doanh</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="inner-manufacturer">
                            <div class="inner-title">NHÀ SẢN XUẤT</div>
                            <div class="inner-content">
                                <asp:CheckBoxList ID="CheckBoxList2" runat="server" CssClass="inner-list-box">
                                    <asp:ListItem Value="1" CssClass="inner-box">Văn học</asp:ListItem>
                                    <asp:ListItem Value="2" CssClass="inner-box">Trinh thám</asp:ListItem>
                                    <asp:ListItem Value="3" CssClass="inner-box">Tâm lý</asp:ListItem>
                                    <asp:ListItem Value="4" CssClass="inner-box">Kinh doanh</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="inner-sort-by-price">
                            <div class="inner-title">SẮP XẾP THEO GIÁ</div>
                            <div class="inner-content">
                                <asp:CheckBoxList ID="CheckBoxList3" runat="server" CssClass="inner-list-box">
                                    <asp:ListItem Value="1" CssClass="inner-box">Văn học</asp:ListItem>
                                    <asp:ListItem Value="2" CssClass="inner-box">Trinh thám</asp:ListItem>
                                    <asp:ListItem Value="3" CssClass="inner-box">Tâm lý</asp:ListItem>
                                    <asp:ListItem Value="4" CssClass="inner-box">Kinh doanh</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
                    <div class="inner-list-product">

                        <asp:Repeater ID="rptBooks" runat="server">
                            <ItemTemplate>
                                <div class="product">
                                    <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                                    <img class="inner-image" src='<%# Eval("Image") %>' alt="ảnh sản phẩm">
                                    <div class="inner-title"><%# Eval("Title")%></div>
                                    <div class="inner-price">
                                        <div class="inner-price-new"><%# Eval("PriceNew") %></div>
                                        <div class="inner-price-old"><%# Eval("PriceOld") %></div>
                                    </div>
                                    <div class="inner-add-to-cart">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                        Thêm giỏ hàng
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- End Section -->


</body>

</html>
