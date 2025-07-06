<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="btl_laptrinhweb.ChiTietSanPham" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/chitietsanpham-1.css" />
    <link rel="stylesheet" href="/assets/css/base.css">

    <title>Chi tiết sản phẩm</title>
</head>
<body>

    <uc:Header runat="server" ID="header1" />
    <form id="form1" runat="server">
        <div class="container-1">
            <div class="product-gallery">
                <div class="image-slider">
                    <span class="arrow left" onclick="prevImage()">&#10094;</span>
                    <asp:Image ID="imgMain" runat="server" CssClass="main-image" />
                    <span class="arrow right" onclick="nextImage()">&#10095;</span>
                </div>

                <div class="thumbnails">
                    <asp:Repeater ID="rptThumbnails" runat="server">
                        <ItemTemplate>
                            <img src='<%# Eval("ImageUrl") %>' alt="" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="product-info">
                <h1>
                    <asp:Label ID="lblProductName" runat="server" /></h1>
                <div class="price">
                    <span class="new-price">
                        <asp:Label ID="lblNewPrice" runat="server" /></span>
                    <span class="old-price">
                        <asp:Label ID="lblOldPrice" runat="server" /></span>
                </div>
                <p>
                    Mã sản phẩm: <span class="id">
                        <asp:Label ID="lblProductId" runat="server" /></span>
                </p>
                <p>
                    Tác giả: <span class="artis">
                        <asp:Label ID="lblAuthor" runat="server" /></span>
                </p>
                <p>
                    Tình trạng: <span class="status">
                        <asp:Label ID="lblStatus" runat="server" /></span>
                </p>

                <div class="quantity-wrapper">
                    <label for="quantity">Số lượng:</label>
                    <div class="quantity-box">
                        <button type="button" class="qty-btn" onclick="changeQty(-1)">−</button>
                        <input type="number" id="quantity" value="1" min="1" oninput="validateQty(this)" />
                        <button type="button" class="qty-btn" onclick="changeQty(1)">+</button>
                    </div>

                </div>

                <div class="buttons">
                    <button class="add-cart">Thêm vào giỏ hàng</button>
                    <button class="buy-now">Mua ngay</button>
                </div>

                <div class="offers">
                    <p><strong>Ưu đãi luên quan:</strong></p>
                    <ul>
                        <li>Nhập mã <b>QRPAY</b>, giảm ngay 30%</li>
                        <li>Hoàn 30%, tối đa 50k, thanh toán ví <b>Moca</b></li>
                        <li>Giảm 10%, đơn từ 0đ khi thanh toán <b>Airpay</b></li>
                    </ul>
                </div>
            </div>
            <div class="sidebar">
                <div class="support-box">
                    <div class="support-item">
                        <img src="as/delivery-truck-truck-svgrepo-com.svg" alt="" />
                        <div>
                            <strong>GIAO HÀNG FREE NỘI THÀNH</strong><br />
                            <span>Giao free trong nội thành HN và HCM</span>
                        </div>
                    </div>

                    <div class="support-item">
                        <img src="as/hours_service_day_express_shipment_icon_187250.svg" alt="" />
                        <div>
                            <strong>TRẢ HÀNG TRONG VÒNG 24H</strong><br />
                            <span>Hỗ trợ trả hàng cho khách khi sản phẩm có lỗi</span>
                        </div>
                    </div>

                    <div class="support-item">
                        <img src="as/package_box_container_parcel_shipping_icon_187264.svg" alt="" />
                        <div>
                            <strong>KIỂM TRA HÀNG KHI NHẬN HÀNG</strong><br />
                            <span>Khách hàng kiểm tra hàng trước khi nhận</span>
                        </div>
                    </div>

                    <div class="support-item">
                        <img src="as/delivery_courier_man_people_avatar_shipping_icon_225197.svg" alt="" />
                        <div>
                            <strong>THANH TOÁN COD</strong><br />
                            <span>Hỗ trợ khách hàng thanh toán cod</span>
                        </div>
                    </div>

                </div>
                <div class="hot-products">
                    <h3>DANH SÁCH NỔI BẬT</h3>
                    <asp:Repeater ID="rptHotProducts" runat="server">
                        <ItemTemplate>
                            <li class="hot-product-item">
                                <a href='ChiTietSanPham.aspx?id=<%# Eval("Id") %>'>
                                    <img class="hot-product-img" src='<%# Eval("MainImage") %>' alt="" />
                                    <div class="hot-product-info">
                                        <div class="title"><%# Eval("Name") %></div>
                                        <div class="price">
                                            <%# Eval("NewPrice") %>
                                            <span class="old"><%# Eval("OldPrice") %></span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ItemTemplate>

                    </asp:Repeater>
                </div>

            </div>
        </div>


        <div class="details">
            <h2>THÔNG TIN CHI TIẾT</h2>
            <ul>
                <li>Loại:
                    <asp:Label ID="lblCategory" runat="server" /></li>
                <li>Kích thước bao bì:
                    <asp:Label ID="lblSize" runat="server" /></li>
                <li>Số trang:
                    <asp:Label ID="lblPages" runat="server" /></li>
                <li>Hình thức:
                    <asp:Label ID="lblFormat" runat="server" /></li>
            </ul>
        </div>


        <div class="related-products">
            <h2>SẢN PHẨM LIÊN QUAN</h2>
            <div class="product-list">
                <asp:Repeater ID="rptRelatedProducts" runat="server">
                    <ItemTemplate>
                        <div class="product-card">
                            <a href='ChiTietSanPham.aspx?id=<%# Eval("Id") %>'>
                                <img src='<%# Eval("MainImage") %>' alt="" />
                                <div class="product-title"><%# Eval("Name") %></div>
                                <div class="price"><strong><%# Eval("NewPrice") %></strong><span class="old-price"><%# Eval("OldPrice") %></span></div>
                            </a>
                            <button class="button">Thêm vào giỏ hàng</button>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>


    </form>
    <!--pop up-->
    <div class="lightbox" id="lightbox">
        <span class="close" onclick="closeLightbox()">&times;</span>
        <img class="lightbox-img" id="lightboxImg" />
        <span class="prev" onclick="prevImage()">&#10094;</span>
        <span class="next" onclick="nextImage()">&#10095;</span>
    </div>
    <script>
        /* tang giam so luong*/
        function changeQty(delta) {
            const qtyInput = document.getElementById('quantity');
            let current = parseInt(qtyInput.value) || 1;
            current += delta;
            if (current < 1) current = 1;
            qtyInput.value = current;
        }

        // Đảm bảo không cho nhập số nhỏ hơn 1
        function validateQty(input) {
            if (input.value === "" || parseInt(input.value) < 1) {
                input.value = 1;
            }
        }

        /* pop up*/
        const images = Array.from(document.querySelectorAll('.thumbnails img'));
        let mainImg = document.querySelector('.main-image');
        const lightbox = document.getElementById('lightbox');
        const lightboxImg = document.getElementById('lightboxImg');

        let currentIndex = 0;

        // Mở ảnh chính khi click
        mainImg.addEventListener('click', () => {
            lightbox.style.display = 'block';
            lightboxImg.src = images[currentIndex].src;
        });



        function closeLightbox() {
            lightbox.style.display = 'none';
        }

        function slideToImage(newIndex, direction) {
            if (newIndex === currentIndex) return;

            const oldImg = mainImg;
            const newImg = oldImg.cloneNode();
            newImg.src = images[newIndex].src;
            newImg.classList.remove('slide-left', 'slide-right', 'slide-in-left', 'slide-in-right', 'active');
            newImg.style.zIndex = 2;

            // Đặt class cho hiệu ứng vào
            if (direction === 'left') {
                oldImg.classList.add('slide-left');
                newImg.classList.add('slide-in-right');
            } else {
                oldImg.classList.add('slide-right');
                newImg.classList.add('slide-in-left');
            }

            // Thêm ảnh mới vào DOM
            oldImg.parentNode.appendChild(newImg);

            // Kích hoạt hiệu ứng trượt vào
            setTimeout(function () {
                newImg.classList.add('active');
                newImg.classList.remove('slide-in-left', 'slide-in-right');
            }, 10);

            // Sau khi hiệu ứng xong, xóa ảnh cũ, cập nhật biến mainImg
            setTimeout(function () {
                oldImg.parentNode.removeChild(oldImg);
                mainImg = newImg;
                currentIndex = newIndex;
                updateActiveThumbnail();
            }, 500);
        }

        function prevImage() {
            let newIndex = (currentIndex - 1 + images.length) % images.length;
            slideToImage(newIndex, 'right');
            lightboxImg.src = images[newIndex].src;
        }

        function nextImage() {
            let newIndex = (currentIndex + 1) % images.length;
            slideToImage(newIndex, 'left');
            lightboxImg.src = images[newIndex].src;
        }

        // Đóng khi ấn ngoài ảnh
        lightbox.addEventListener('click', (e) => {
            if (e.target === lightbox) closeLightbox();
        });

        // xu ly active 
        images.forEach((img, index) => {
            img.addEventListener('click', () => {
                if (index === currentIndex) return;
                // Xác định hướng trượt
                let direction = (index > currentIndex) ? 'left' : 'right';
                slideToImage(index, direction);
                lightboxImg.src = images[index].src;
            });
        });

        images[0].classList.add('active');
        function updateActiveThumbnail() {
            images.forEach(i => i.classList.remove('active'));
            images[currentIndex].classList.add('active');
        }

    </script>
</body>
</html>
