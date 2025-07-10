<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="btl_laptrinhweb.Home" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css" />
    <link rel="stylesheet" href="/assets/css/base.css" />
    <link rel="stylesheet" href="/assets/css/trangchu.css" />
</head>

<body>
    <uc:Header runat="server" ID="header1" />

    <!-- Section One -->
    <div class="section-one">
        <div class="inner-wrap">
            <div class="inner-image">
                <a href="">
                    <img src="/assets/images/slider_1.webp" alt="backgroud-1">
                </a>
            </div>
        </div>
    </div>
    <!-- End Section One -->

    <!-- Section Two -->
    <div class="section-two">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-list-item">
                    <div class="item">
                        <div class="inner-image">
                            <img src="/assets/images/cate_1.webp" alt="ảnh">
                        </div>
                        <div class="inner-title">
                            Tâm lý kỹ năng
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-image">
                            <img src="/assets/images/cate_2.webp" alt="ảnh">
                        </div>
                        <div class="inner-title">
                            Văn học
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-image">
                            <img src="/assets/images/cate_3.webp" alt="ảnh">
                        </div>
                        <div class="inner-title">
                            Thiếu nhi
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-image">
                            <img src="/assets/images/cate_1.webp" alt="ảnh">
                        </div>
                        <div class="inner-title">
                            Sách học ngoại ngữ
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End Section Two -->

    <!-- Section Three -->
    <div class="section-three">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-title">
                    <img src="/assets/images/img_title.webp" alt="" />
                </div> 
                <div class="inner-main">
                    <div id="list-product-section-three" class="inner-list-product"></div>
                    <div class="inner-button-prev inner-button">
                        <i class="fa-solid fa-square-caret-left"></i>
                    </div>
                    <div class="inner-button-next inner-button">
                        <i class="fa-solid fa-square-caret-right"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Section Three -->

    <!-- Section Four -->
    <div class="section-four">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-sub-title">SẢN PHẨM NỔI BẬT</div>
                <img src="/assets/images/icon_after_title.webp" alt="ảnh" />
                <div id="list-product-section-four" class="inner-list-product"></div>
            </div>
        </div>
    </div>
    <!-- End Section Four -->

    <!-- Section Five -->
    <div class="section-five">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-sub-title">GỢI Ý CHO BẠN</div>
                <img src="/assets/images/icon_after_title.webp" alt="image" />
                <div class="inner-categories">
                    <div class="inner-category inner-category-active">Văn học</div>
                    <div class="inner-category">Kinh tế</div>
                    <div class="inner-category">Tiếng anh</div>
                    <div class="inner-category">Tâm lý kỹ năng</div>
                    <div class="inner-category">Thiếu nhi</div>
                </div>

                <!-- Đã xóa phần tìm kiếm ở đây -->
                <div id="list-product" class="inner-list-product"></div>
                <div class="inner-pagination">
                    <ul id="pagination" class="pagination"></ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Section Five -->

    <!-- Section Six -->
    <div class="section-six">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-service">
                    <h2 class="inner-title">DỊCH VỤ CỦA CHÚNG TÔI
                    </h2>
                    <div class="inner-content">
                        <div class="inner-group">
                            <img src="/assets/images/icon_service_1.svg" alt="icon-1">
                            <div class="inner-desc">
                                <h3>GIAO HÀNG FREE NỘI THÀNH</h3>
                                <p>Giao free trong nội thành HN và HCM</p>
                            </div>
                        </div>
                        <div class="inner-group">
                            <img src="/assets/images/icon_service_2.svg" alt="icon-2">
                            <div class="inner-desc">
                                <h3>TRẢ HÀNG TRONG VÒNG 24H</h3>
                                <p>Hỗ trợ trả hàng cho khách khi sản phẩm có lỗi</p>
                            </div>
                        </div>
                        <div class="inner-group">
                            <img src="/assets/images/icon_service_3.svg" alt="icon-3">
                            <div class="inner-desc">
                                <h3>KIỂM TRA HÀNG KHI NHẬN HÀNG</h3>
                                <p>Khách hàng kiểm tra hàng trước khi nhận</p>
                            </div>
                        </div>
                        <div class="inner-group">
                            <img src="/assets/images/icon_service_4.svg" alt="icon-4">
                            <div class="inner-desc">
                                <h3>THANH TOÁN COD</h3>
                                <p>Hỗ trợ khách hàng thanh toán cod</p>
                            </div>
                        </div>
                    </div>
                </div>
                <img src="/assets/images/img_people.webp" alt="" class="inner-image">
            </div>
        </div>
    </div>
    <!-- End Section Six -->

    <!-- Section Seven -->
    <div class="section-seven">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-title">Đăng ký email để nhận được ưu đãi mới nhất của chúng tôi</div>
                <div class="inner-sub-title">
                    Rất hân hạnh được phục vụ bạn. Chúc bạn có trải nghiệm tuyệt vời về
                    dịch vụ của Stationery
                </div>
                <form class="inner-form">
                    <input type="text" placeholder="Nhập email của bạn tại đây" />
                    <button type="button">ĐĂNG KÝ NGAY</button>
                </form>
            </div>
        </div>
    </div>
    <!-- End Section Seven -->

    <!-- Footer -->
    <uc:Footer runat="server" ID="footer" />
    <!-- End Footer -->

</body>

<script>
    // Biến lưu trữ dữ liệu sản phẩm
    let products = [];
    let currentPage = 1;
    let perPage = 8;
    let totalPage = 0;
    let perProduct = [];
    let selectedCategory = "Văn học";

    // Lấy dữ liệu sản phẩm từ server
    function loadProductsFromServer() {
        fetch('TrangChu.aspx/GetBooks', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            }
        })
            .then(response => response.json())
            .then(data => {
                products = JSON.parse(data.d);
                currentPage = 1;
                renderSectionThree();
                renderSectionFour();
                getProducts();
                renderPageNumber();
            })
            .catch(error => {
                console.error('Lỗi khi lấy dữ liệu sách:', error);
            });
    }



    // Section Three: Hiển thị 4 sản phẩm đầu tiên
    function renderSectionThree() {
        const element = document.getElementById("list-product-section-three");
        let html = "";
        products.slice(0, 4).forEach((item) => {
            html += `
            <div class="product">
                <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                <img class="inner-image" src="${item.image}" alt="ảnh sản phẩm">
                <div class="inner-title">${item.title}</div>
                <div class="inner-price">
                    <div class="inner-price-new">${Number(item.priceNew).toLocaleString()}đ</div>
                    <div class="inner-price-old">${Number(item.priceOld).toLocaleString()}đ</div>
                </div>
                <div class="inner-add-to-cart">
                    <i class="fa-solid fa-cart-shopping"></i>
                    Thêm giỏ hàng
                </div>
            </div>
        `;
        });
        element.innerHTML = html;
    }

    // Section Four: Hiển thị 3 sản phẩm nổi bật 
    function renderSectionFour() {
        const element = document.getElementById("list-product-section-four");
        let html = "";
        // Sắp xếp sản phẩm theo số lượng bán giảm dần
        const sorted = [...products].sort((a, b) => (b.sold || 0) - (a.sold || 0));
        // Lấy 3 sản phẩm bán chạy nhất
        sorted.slice(0, 3).forEach((item) => {
            html += `
    <div class="product">
        <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
        <img class="inner-image" alt="ảnh" src="${item.image}">
        <div class="inner-title">${item.title}</div>
        <div class="inner-price">
            <div class="inner-price-new">${Number(item.priceNew).toLocaleString()}đ</div>
            <div class="inner-price-old">${Number(item.priceOld).toLocaleString()}đ</div>
        </div>
        <div class="inner-add-to-cart">
            <i class="fa-solid fa-cart-shopping"></i>
            Thêm vào giỏ
        </div>
        <div class="inner-sold">Đã bán: ${item.sold || 0}</div>
    </div>
    `;
        });
        element.innerHTML = html;
    }


    // Section Five: Phân trang
    const elementListProduct = document.getElementById("list-product");

    const getProducts = () => {
        // Lọc sản phẩm theo thể loại
        const filtered = products.filter(item =>
            item.category && item.category.toLowerCase().includes(selectedCategory.toLowerCase())
        );
        totalPage = Math.ceil(filtered.length / perPage);
        const start = (currentPage - 1) * perPage;
        const end = start + perPage;
        perProduct = filtered.slice(start, end);
        renderProduct();
    }


    const renderProduct = () => {
        let html = "";
        // Lọc sản phẩm: chỉ cần category chứa selectedCategory (không phân biệt hoa thường)
        const filtered = products.filter(item =>
            item.category && item.category.toLowerCase().includes(selectedCategory.toLowerCase())
        );
        filtered.forEach((item) => {
            html += `
    <div class="product">
        <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
        <a href="ChiTietSanPham.aspx?MaSach=${item.id}"><img class="inner-image" alt="ảnh" src="${item.image}"></a>
        <div class="inner-title">${item.title}</div>
        <div class="inner-price">
            <div class="inner-price-new">${Number(item.priceNew).toLocaleString()}đ</div>
            <div class="inner-price-old">${Number(item.priceOld).toLocaleString()}đ</div>
        </div>
    </div>
    `;
        });
        elementListProduct.innerHTML = html;
    }


    const renderPageNumber = () => {
        totalPage = Math.ceil(products.length / perPage);
        const elementPagination = document.getElementById("pagination");
        elementPagination.innerHTML = "";
        let html = "";
        for (let i = 1; i <= totalPage; i++) {
            html += `
            <li 
                onclick="handlePageNumber(${i})"
                class="pagination-item ${i === currentPage ? 'pagination-item-active' : ''}">
                ${i}
            </li>
        `;
        }
        elementPagination.innerHTML = html;
    }

    const handlePageNumber = (num) => {
        currentPage = num;
        getProducts();
        renderPageNumber();
    }

    // Gọi hàm lấy dữ liệu khi trang load
    document.addEventListener("DOMContentLoaded", function () {
        loadProductsFromServer();
    });

    document.addEventListener("DOMContentLoaded", function () {
        loadProductsFromServer();

        // Bắt sự kiện click cho các thể loại
        document.querySelectorAll('.inner-category').forEach(el => {
            el.addEventListener('click', function () {
                // Bỏ class active ở tất cả thể loại
                document.querySelectorAll('.inner-category').forEach(c => c.classList.remove('inner-category-active'));
                // Thêm class active cho thể loại được chọn
                this.classList.add('inner-category-active');
                // Cập nhật thể loại đang chọn và render lại sản phẩm
                selectedCategory = this.textContent.trim();
                currentPage = 1;
                getProducts();
                renderPageNumber();
            });
        });
    });

</script>

</html>
