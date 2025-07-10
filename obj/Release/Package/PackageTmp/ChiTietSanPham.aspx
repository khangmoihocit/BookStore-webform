<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="btl_laptrinhweb.ChiTietSanPham1" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Chi tiết sản phẩm</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/chitietsanpham.css">
</head>

<body>
    <uc:Header runat="server" ID="header1" />
    <div class="section-0">
        <div class="container">
            <ul class="inner-wrap">
                <li><a href="TrangChu.aspx">Trang chủ</a></li>
                <li>/</li>
                <li><a href="DanhSachSanPham.aspx">Tất cả sản phẩm</a></li>
                <li>/</li>
                <li class="inner-text-active"><a href="DanhSachSanPham.aspx" class="inner-text-active">Sản phẩm</a></li>
            </ul>
            <div class="inner-title">
                <asp:Label ID="lblHeader" runat="server" Text="Tên sản phẩm"></asp:Label>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" CssClass="message-error"></asp:Label>
        <!-- Section One -->
        <div class="section-one">
            <div class="container">
                <div class="inner-wrap">
                    <div class="product-info">
                        <div class="inner-row">
                            <asp:Image ID="img" runat="server" />
                            <div class="inner-info-detail">
                                <asp:Label ID="lblTenSanPham" runat="server" Text="Label" CssClass="inner-title"></asp:Label>
                                <div class="inner-price">
                                    <asp:Label ID="lblGiaBanMoi" runat="server" Text="Label" CssClass="inner-price-new"></asp:Label>
                                    <asp:Label ID="lblGiaBanCu" runat="server" Text="Label" CssClass="inner-price-old"></asp:Label>
                                </div>
                                <div class="inner-text">
                                    Mã sản phẩm: Đang cập nhật
                                </div>
                                <div class="inner-text inner-author">
                                    Tác giả:
                                    <asp:Label ID="lblTenTacGia" runat="server" Text="Label"></asp:Label>
                                </div>
                                <span class="inner-text">Tình trạng:
                                    <asp:Label ID="lblTinhTrang" runat="server" Text="Label"></asp:Label></span>
                                <div class="inner-text inner-quantity">
                                    <div>Số lượng: </div>
                                    <asp:TextBox ID="txtSoLuong" runat="server" TextMode="Number" min="1" Text="1"></asp:TextBox>
                                </div>
                                <div class="button-row">
                                    <asp:Button ID="btnThemGioHang2" runat="server" Text="Thêm vào giỏ hàng" CssClass="button button-add-to-cart" OnClick="btnThemGioHang2_Click" />
                                    <asp:Button ID="btnMuaNgay" runat="server" Text="Mua ngay" CssClass="button button-pay" />
                                </div>
                                <div class="inner-uu-dai">
                                    <div class="inner-desc-title">Ưu đãi liên quan:</div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc">
                                            Nhập mã <b><i>QRDAY”, Giảm ngay 30%, đơn hàng từ 59k
                                                thanh toán Vnpay</i></b>
                                        </div>
                                    </div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc">
                                            <b><i>Hoàn 30%, tối đa 50k, thanh toán qua ví
                                                Moca</i></b>
                                        </div>
                                    </div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc">
                                            Nhập mã <b><i>AIRPAY024, giảm ngay 10%, đơn hàng từ
                                                0đ, thanh toán qua ví AirPay</i></b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="inner-product-desc">
                            <div class="inner-title">MÔ TẢ SẢN PHẨM</div>
                            <p class="inner-desc"><asp:Label ID="lblThongTinChiTiet" runat="server" Text="..." ></asp:Label></p>
                        </div>
                    </div>
                    <div class="inner-content-right">
                        <div class="inner-service">
                            <div class="inner-group">
                                <img src="/assets/images/icon_service_1.svg" alt="icon-1">
                                <div class="inner-desc">
                                    <h5>GIAO HÀNG FREE NỘI THÀNH</h5>
                                    <p>Giao free trong nội thành HN và HCM</p>
                                </div>
                            </div>
                            <div class="inner-group">
                                <img src="/assets/images/icon_service_2.svg" alt="icon-2">
                                <div class="inner-desc">
                                    <h5>TRẢ HÀNG TRONG VÒNG 24H</h5>
                                    <p>Hỗ trợ trả hàng cho khách khi sản phẩm có lỗi</p>
                                </div>
                            </div>
                            <div class="inner-group">
                                <img src="/assets/images/icon_service_3.svg" alt="icon-3">
                                <div class="inner-desc">
                                    <h5>KIỂM TRA HÀNG KHI NHẬN HÀNG</h5>
                                    <p>Khách hàng kiểm tra hàng trước khi nhận</p>
                                </div>
                            </div>
                            <div class="inner-group">
                                <img src="/assets/images/icon_service_4.svg" alt="icon-4">
                                <div class="inner-desc">
                                    <h5>THANH TOÁN COD</h5>
                                    <p>Hỗ trợ khách hàng thanh toán cod</p>
                                </div>
                            </div>
                        </div>
                        <div class="inner-product-hot">
                            <div class="inner-title">
                                DANH SÁCH NỔI BẬT
                            </div>
                            <div class="list-product">
                                <div class="inner-product">
                                    <img src="/assets/images/8935325011559.webp" alt="">
                                    <div class="inner-info">
                                        <div class="inner-name">
                                            Vo viet ke nag
                                        </div>
                                        <div class="inner-price">
                                            12000
                                        </div>
                                    </div>
                                </div>
                                <div class="inner-product">
                                    <img src="/assets/images/8935325011559.webp" alt="">
                                    <div class="inner-info">
                                        <div class="inner-name">
                                            Vo viet ke nag
                                        </div>
                                        <div class="inner-price">
                                            12000
                                        </div>
                                    </div>
                                </div>
                                <div class="inner-product">
                                    <img src="/assets/images/8935325011559.webp" alt="">
                                    <div class="inner-info">
                                        <div class="inner-name">
                                            Vo viet ke nag
                                        </div>
                                        <div class="inner-price">
                                            12000
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Section One -->

        <!-- Section Two -->
        <div class="section-two">
            <div class="container">
                <div class="inner-wrap">
                    <div class="inner-title-1">SẢN PHẨM LIÊN QUAN</div>
                    <div class="list-product">
                        <asp:Label ID="lbltext" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Repeater ID="rptSach" runat="server">
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
                                    <asp:LinkButton ID="btnThemGioHang" runat="server"
                                        CssClass="inner-add-to-cart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        Thêm giỏ hàng
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Section Two -->
    </form>
    <uc:Footer runat="server" ID="footer" />
</body>

</html>
