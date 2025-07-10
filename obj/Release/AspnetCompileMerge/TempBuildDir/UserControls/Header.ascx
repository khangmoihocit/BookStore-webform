<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="btl_laptrinhweb.Header" %>

<!-- Header -->
<header class="header">
    <div class="header-1">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-logo">
                    <a href="TrangChu.aspx">
                        <picture>
                            <source media="(min-width: 1200px)"
                                srcset="//bizweb.dktcdn.net/100/434/558/themes/894884/assets/logo.png?1676278234490">
                            <source media="(max-width: 390px)"
                                srcset="//bizweb.dktcdn.net/100/434/558/themes/894884/assets/logo_mb.png?1676278234490">
                            <img src="/assets/images/logo.webp" alt="">
                        </picture>
                    </a>
                </div>

                <div class="inner-search" style="position: relative;">
                    <input type="text" placeholder="Tìm kiếm sản phẩm" autocomplete="off" />
                    <button class="inner-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                    <ul id="suggestion-list" style="position: absolute; top: 100%; left: 0; width: 100%; background: #fff; z-index: 1000; list-style: none; margin: 0; padding: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.15); display: none;"></ul>
                </div>

                <div class="inner-contact">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-headphones"></i>
                        </div>
                        <p><b>Hotline:</b> 19006750</p>
                    </div>
                </div>

                <div class="inner-list-item">
                    <div class="item"><i class="fa-regular fa-heart"></i></div>
                    <div class="item">
                        <a href="../GioHang.aspx"><i class="fa-solid fa-cart-shopping"></i></a>
                    </div>
                    <div class="item">
                        <a href="../ThongTinNguoiDung.aspx"><i class="fa-regular fa-circle-user"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="header-2">
        <div class="container">
            <div class="inner-wrap">
                <a class="inner-menu" href="../DanhSachSanPham.aspx">
                    <div class="inner-icon">
                        <i class="fa-solid fa-list"></i>
                    </div>
                    <div class="inner-desc">Danh mục sản phẩm</div>
                </a>

                <div class="inner-content">
                    <div class="inner-desc">Stationery lựa chọn số 1 cho bạn</div>
                </div>

                <div class="inner-list-item">
                    <div class="item">
                        <a href="#">
                            <div class="inner-icon">
                                <i class="fa-solid fa-fire"></i>
                            </div>
                            <div class="inner-text">Khuyến mãi</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <div class="inner-icon">
                                <i class="fa-solid fa-shield-halved"></i>
                            </div>
                            <div class="inner-text">Dịch vụ</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="../TinTuc.aspx">
                            <div class="inner-icon">
                                <i class="fa-solid fa-bullhorn"></i>
                            </div>
                            <div class="inner-text">Tin tức</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="../LienHe.aspx">
                            <div class="inner-icon">
                                <i class="fa-solid fa-phone"></i>
                            </div>
                            <div class="inner-text">Liên hệ</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const searchInput = document.querySelector('.inner-search input');
            const searchButton = document.querySelector('.inner-search button');
            const suggestionList = document.getElementById('suggestion-list');
            let allBooks = [];

            // Lấy danh sách sách một lần khi trang load
            fetch('/TrangChu.aspx/GetBooks', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' }
            })
                .then(res => res.json())
                .then(data => {
                    allBooks = JSON.parse(data.d);
                });

            // Hàm loại bỏ dấu tiếng Việt
            function removeDiacritics(str) {
                return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }

            // Xử lý gợi ý khi nhập
            searchInput.addEventListener('input', function () {
                const keyword = removeDiacritics(this.value.trim().toLowerCase());
                if (!keyword) {
                    suggestionList.style.display = 'none';
                    suggestionList.innerHTML = '';
                    return;
                }
                // Lọc sách theo tên (không dấu, không phân biệt hoa thường)
                const suggestions = allBooks.filter(item =>
                    removeDiacritics(item.title.toLowerCase()).includes(keyword)
                ).slice(0, 8); // lấy tối đa 8 gợi ý

                if (suggestions.length === 0) {
                    suggestionList.style.display = 'none';
                    suggestionList.innerHTML = '';
                    return;
                }

                suggestionList.innerHTML = suggestions.map(item =>
                    `<li style="display:flex;align-items:center;padding:8px;cursor:pointer;border-bottom:1px solid #eee;" data-title="${item.title.replace(/"/g, '&quot;')}">
                        <img src="${item.image}" alt="${item.title}" style="width:32px;height:32px;object-fit:cover;margin-right:8px;border-radius:4px;">
                        <span>${item.title}</span>
                    </li>`
                ).join('');

                suggestionList.style.display = 'block';
            });

            // Khi click vào gợi ý
            suggestionList.addEventListener('click', function (e) {
                if (e.target.tagName === 'LI') {
                    searchInput.value = e.target.getAttribute('data-title');
                    suggestionList.style.display = 'none';
                    // Tự động chuyển trang kết quả tìm kiếm
                    window.location.href = 'KetQuaTimKiem.aspx?keyword=' + encodeURIComponent(searchInput.value.trim());
                }
            });

            // Ẩn gợi ý khi blur khỏi input
            searchInput.addEventListener('blur', function () {
                setTimeout(() => { suggestionList.style.display = 'none'; }, 150);
            });

            // Hiện lại gợi ý khi focus nếu có giá trị
            searchInput.addEventListener('focus', function () {
                if (suggestionList.innerHTML) suggestionList.style.display = 'block';
            });

            // Khi nhấn nút tìm kiếm
            searchButton.addEventListener('click', function () {
                const keyword = searchInput.value.trim();
                if (keyword) {
                    window.location.href = 'KetQuaTimKiem.aspx?keyword=' + encodeURIComponent(keyword);
                }
            });

            // Khi nhấn Enter trong ô input
            searchInput.addEventListener('keydown', function (e) {
                if (e.key === 'Enter') {
                    const keyword = searchInput.value.trim();
                    if (keyword) {
                        window.location.href = 'KetQuaTimKiem.aspx?keyword=' + encodeURIComponent(keyword);
                    }
                }
            });
        });
    </script>
    <style>
        #suggestion-list {
            border: 1px solid #ddd;
            max-height: 250px;
            overflow-y: auto;
            background: #fff;
        }

            #suggestion-list li:hover {
                background: #f5f5f5;
            }
    </style>
</header>
<!-- End Header -->
