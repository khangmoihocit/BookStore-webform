 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="btl_laptrinhweb.ChiTietSanPham1" %>

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
    <div class="section-0">
        <div class="container">
            <ul class="inner-wrap">
                <li><a href="TrangChu.aspx">Trang chủ</a></li>
                <li>/</li>
                <li class="inner-text-active">Sản phẩm</li>
            </ul>
            <div class="inner-title">TẤT CẢ SẢN PHẨM</div>
        </div>
    </div>
    <form id="form1" runat="server">
        <!-- Section One -->
        <div class="section-one">
            <div class="container">
                <div class="inner-wrap">
                    <div class="product-info">
                        <div class="inner-row">
                            <img src="/assets/images/8935325011559.webp" alt="">
                            <div class="inner-info-detail">
                                <div class="inner-title">
                                    Vo viet ke ngang nhieu hinh sieu ngo
                                </div>
                                <div class="inner-price">
                                    <div class="inner-price-new">12000đ</div>
                                    <div class="inner-price-old">41000đ</div>
                                </div>
                                <div class="inner-text">
                                    Mã san pham: dang cap nhat
                                </div>
                                <div class="inner-text inner-author">
                                    tac gia: dang cap nhat
                                </div>
                                <span class="inner-text">tinh trang: con hang</span>
                                <div class="inner-text inner-quantity">so luong :
                                    <input type="text" />
                                </div>
                                <div class="button-row">
                                    <div class="button button-add-to-cart-1">Thêm vào giỏ hàng</div>
                                    <div class="button button-pay">Mua ngay</div>
                                </div>
                                <div class="inner-uu-dai">
                                    <div class="inner-desc-title">Ưu đãi liên quan:</div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc">Nhập mã <b><i></i>QRDAY”, Giảm ngay 30%, đơn hàng từ 59k
                                                thanh toán Vnpay</i></b></div>
                                    </div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc"><b><i></i>Hoàn 30%, tối đa 50k, thanh toán qua ví
                                                Moca</i></b></div>
                                    </div>
                                    <div class="inner-desc-item">
                                        <img class="inner-icon-1" src="/assets/images/icon-favorite.webp" />
                                        <div class="inner-desc">Nhập mã <b><i></i>AIRPAY024, giảm ngay 10%, đơn hàng từ
                                                0đ, thanh toán qua ví AirPay</i></b></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="inner-product-desc">
                            <div class="inner-title">THÔNG TIN CHI TIẾT</div>
                            <div class="inner-desc">
                                🌿🌿🌿 SỔ VỞ ĐÁNG YÊU - HỌC TẬP THÊM PHIÊUUUUU 💕💕💕

                                ✔Size: Khổ A5( 20,7cm * 14cm) gồm 120 trang giấy dày dặn
                                ✔ Chất liệu: giấy chống lóa mắt cao cấp, không gây mỏi mắt khi nhìn lâu
                                ✔Bìa của quyển sổ/vở là bìa giấy cứng cáp, chắc chắn. Đặc biệt được in hình thù siêu dễ
                                thương kết hợp màu sắc tươi sáng, trẻ trung

                                👉👉đảm bảo giúp chúng mình có hứng thú, động lực hơn cũng như giảm Stress khi học tập
                                và làm việc các

                                ❎❎ Mỗi phân loại sản phẩm có 4 hình, các cậu muốn chọn hình theo sở thích có thể inbox
                                báo shop mẫu nhaaaa😘

                                👉👉 Sổ/vở xinh giá lại siêu hạt dẻ... Các cậu nhanh tay rinh em ấy về nhà thui nàoooo😘
                            </div>
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
                        <div class="product">
                            <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                            <img class="inner-image" alt="ảnh" src="/assets/images/8935092825298.webp">
                            <div class="inner-title">Vở viết kẻ ngang nhiều hình siêu nghộ nghĩnh</div>
                            <div class="inner-price">
                                <div class="inner-price-new">12.000đ</div>
                                <div class="inner-price-old">41.000đ</div>
                            </div>
                            <div class="inner-add-to-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                                Thêm vào giỏ
                            </div>
                        </div>
                        <div class="product">
                            <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                            <img class="inner-image" alt="ảnh" src="/assets/images/8935092825298.webp">
                            <div class="inner-title">Vở viết kẻ ngang nhiều hình siêu nghộ nghĩnh</div>
                            <div class="inner-price">
                                <div class="inner-price-new">12.000đ</div>
                                <div class="inner-price-old">41.000đ</div>
                            </div>
                            <div class="inner-add-to-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                                Thêm vào giỏ
                            </div>
                        </div>
                        <div class="product">
                            <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                            <img class="inner-image" alt="ảnh" src="/assets/images/8935092825298.webp">
                            <div class="inner-title">Vở viết kẻ ngang nhiều hình siêu nghộ nghĩnh</div>
                            <div class="inner-price">
                                <div class="inner-price-new">12.000đ</div>
                                <div class="inner-price-old">41.000đ</div>
                            </div>
                            <div class="inner-add-to-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                                Thêm vào giỏ
                            </div>
                        </div>
                        <div class="product">
                            <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                            <img class="inner-image" alt="ảnh" src="/assets/images/8935092825298.webp">
                            <div class="inner-title">Vở viết kẻ ngang nhiều hình siêu nghộ nghĩnh</div>
                            <div class="inner-price">
                                <div class="inner-price-new">12.000đ</div>
                                <div class="inner-price-old">41.000đ</div>
                            </div>
                            <div class="inner-add-to-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                                Thêm vào giỏ
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Section Two -->
    </form>
</body>

</html>