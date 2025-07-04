<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachSanPham.aspx.cs" Inherits="btl_laptrinhweb.DanhSachSanPham" %>

<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/danhsachsanpham.css" />
    <title></title>
</head>
<body>

    <uc:Header runat="server" ID="header1" />
    <form id="form1" runat="server">
        <div class="container-1">
            <!-- Sidebar bộ lọc -->
            <div class="sidebar-filter">
                <!-- THỂ LOẠI -->
                <div class="collapsible open">
                    <div class="collapsible-header">
                        THỂ LOẠI SÁCH
      <span class="arrow">&#9662;</span>
                    </div>
                    <div class="collapsible-content">
                        <ul>
                            <li>
                                <input type="radio" name="category" value="but-xoa" />
                                Bút xóa</li>
                            <li>
                                <input type="radio" name="category" value="tui-dung" />
                                Túi đựng</li>
                            <li>
                                <input type="radio" name="category" value="Sach-Ky-Nang-Song" />
                                Sách kỹ năng sống</li>
                        </ul>
                    </div>
                </div>

                <!-- NHÀ XUẤT BẢN -->
                <div class="collapsible open">
                    <div class="collapsible-header">
                        NHÀ XUẤT BẢN
      <span class="arrow">&#9662;</span>
                    </div>
                    <div class="collapsible-content">
                        <ul>
                            <li>
                                <input type="radio" name="publisher" value="nha-nam" />
                                Nhã Nam</li>
                            <li>
                                <input type="radio" name="publisher" value="NXB-tre" />
                                NXB Trẻ</li>
                        </ul>
                    </div>
                </div>

                <!-- SẮP XẾP -->
                <div class="collapsible open">
                    <div class="collapsible-header">
                        SẮP XẾP THEO GIÁ
      <span class="arrow">&#9662;</span>
                    </div>
                    <div class="collapsible-content">
                        <ul>
                            <li>
                                <input type="radio" name="sort" value="asc" />
                                Giá thấp đến cao</li>
                            <li>
                                <input type="radio" name="sort" value="desc" />
                                Giá cao xuống thấp</li>
                        </ul>
                    </div>
                </div>

                <!-- Ảnh -->
                <div class="sidebar-image">
                    <img src="as/banner1.jpg" alt="banner1" />
                </div>
            </div>





            <!-- Danh sách sản phẩm -->
            <div class="product-list">
                <!-- Các sản phẩm -->
                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="nha-nam" data-price="59000">
                    <div class="inner-icon-favourite"><i class="fa-regular fa-heart"></i></div>
                    <a href="ChiTietSanPham.aspx?id=SP01">
                        <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                        <h4>Bìa kẹp tài liệu</h4>
                        <div class="price-box">
                            <span class="price-new">59.000₫</span>
                            <span class="price-old">69.000₫</span>
                        </div>
                    </a>

                    <button class="select-btn">Thêm vào giỏ hàng</button>

                </div>
                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="148500">
                    <a href="ChiTietSanPham.aspx?id=SP02">
                        <img src="as/SachKyNangSong2.1.svg" alt="Sách Tư Duy Ngược" />
                        <h4>Bìa kẹp tài liệu</h4>
                        <div class="price-box">
                            <span class="price-new">148.500₫</span>
                            <span class="price-old">175.000₫</span>
                        </div>
                    </a>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>

                <div class="product" data-category="Sach-Ky-Nang-Song" data-publisher="NXB-tre" data-price="59000">
                    <img src="/assets/images/8935086857328_2.webp" alt="Sách Tư Duy Ngược" />
                    <h4>Bìa kẹp tài liệu</h4>
                    <div class="price-box">
                        <span class="price-new">59.000₫</span>
                        <span class="price-old">69.000₫</span>
                    </div>
                    <button class="select-btn">Thêm vào giỏ hàng</button>
                </div>
                <!--  -->
                <div id="pagination" class="pagination"></div>
            </div>

        </div>

    </form>
    <script>
        const radios = document.querySelectorAll('input[type="radio"]');
        const products = Array.from(document.querySelectorAll('.product'));
        const productList = document.querySelector('.product-list');
        const pagination = document.getElementById('pagination');

        const PRODUCTS_PER_PAGE = 8;
        let currentPage = 1;
        let filtered = products.slice();

        function applyFilters() {
            const category = document.querySelector('input[name="category"]:checked')?.value;
            const publisher = document.querySelector('input[name="publisher"]:checked')?.value;
            const sort = document.querySelector('input[name="sort"]:checked')?.value;

            filtered = products.slice();
            if (category) filtered = filtered.filter(p => p.dataset.category === category);
            if (publisher) filtered = filtered.filter(p => p.dataset.publisher === publisher);
            if (sort) {
                filtered.sort((a, b) => {
                    const priceA = Number(a.dataset.price);
                    const priceB = Number(b.dataset.price);
                    return sort === "asc" ? priceA - priceB : priceB - priceA;
                });
            }

            currentPage = 1;
            renderProducts();
            renderPagination();
        }

        function renderProducts() {
            products.forEach(p => p.style.display = 'none');
            const start = (currentPage - 1) * PRODUCTS_PER_PAGE;
            const end = start + PRODUCTS_PER_PAGE;
            filtered.slice(start, end).forEach(p => {
                p.style.display = ' block';
            });
            setupHeartIcons();
        }




        function renderPagination() {
            pagination.innerHTML = '';
            const totalPages = Math.ceil(filtered.length / PRODUCTS_PER_PAGE);
            for (let i = 1; i <= totalPages; i++) {
                const btn = document.createElement('button');
                btn.textContent = i;
                btn.className = (i === currentPage) ? 'active' : '';
                btn.addEventListener('click', () => {
                    currentPage = i;
                    renderProducts();
                    renderPagination();
                });
                pagination.appendChild(btn);
            }
        }

        radios.forEach(r => r.addEventListener('change', applyFilters));
        applyFilters();

        document.querySelectorAll('.favorite-icon').forEach(icon => {
            icon.addEventListener('click', function (e) {
                e.stopPropagation();
                this.classList.toggle('active');
                const i = this.querySelector('i');
                i.classList.toggle('fa-solid');
                i.classList.toggle('fa-regular');
            });
        });

        function setupHeartIcons() {
            document.querySelectorAll('.inner-icon-favourite').forEach(icon => {
                icon.addEventListener('click', function (e) {
                    e.stopPropagation(); // không ảnh hưởng thẻ a cha
                    const i = this.querySelector('i');
                    i.classList.toggle('fa-regular');
                    i.classList.toggle('fa-solid');
                    this.classList.toggle('active');
                });
            });
        }


        // Gọi sau khi render (nếu bạn có filter/pagination)
        setupHeartIcons();

        //eff side bar
        document.querySelectorAll('.collapsible').forEach(section => {
            const header = section.querySelector('.collapsible-header');
            const content = section.querySelector('.collapsible-content');

            header.addEventListener('click', () => {
                section.classList.toggle('open');

                if (section.classList.contains('open')) {
                    content.style.maxHeight = content.scrollHeight + "px";
                    content.style.padding = "10px";
                } else {
                    content.style.maxHeight = "0px";
                    content.style.padding = "0 10px";
                }
            });
        });

        setupHeartIcons();
    </script>
</body>
</html>
