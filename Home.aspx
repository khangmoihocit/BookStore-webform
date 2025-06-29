<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="btl_laptrinhweb.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Trang chủ</title>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/home.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-logo">
                    <img src="./assets/images/logo.webp" alt="">
                </div>

                <div class="inner-search">
                    <input type="text" placeholder="Tìm kiếm sản phẩm">
                    <button class="inner-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>

                <div class="inner-contact">
                    <div class="inner-icon">
                        <i class="fa-solid fa-headphones"></i>
                        <p>Hotline: 19006750</p>
                    </div>
                </div>

                <div class="inner-menu">
                    <div class="list-item">
                        <div class="item-1"><i class="fa-regular fa-heart"></i></div>
                        <div class="item-2"><i class="fa-solid fa-cart-shopping"></i></div>
                        <div class="item-3"><i class="fa-regular fa-circle-user"></i></div>
                    </div>
                </div>

            </div>
        </div>
    </header>
    <!-- End Header -->

</body>
</html>
