<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatHangThanhCong.aspx.cs" Inherits="btl_laptrinhweb.DatHangThanhCong" %>
<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đặt Hàng Thành Công</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
        :root {
            --success-color: #28a745;
            --light-gray-color: #f8f9fa;
            --white-color: #fff;
            --dark-color: #343a40;
            --box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .thank-you-body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: var(--light-gray-color);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .thank-you-container {
            max-width: 600px;
            width: 100%;
            background: var(--white-color);
            padding: 40px;
            border-radius: 12px;
/*            box-shadow: var(--box-shadow);*/
            text-align: center;
        }

        .success-icon {
            font-size: 60px;
            color: var(--success-color);
            margin-bottom: 20px;
        }

        .thank-you-container h1 {
            font-size: 2.2rem;
            color: var(--dark-color);
            margin-top: 0;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .thank-you-container p {
            font-size: 1.1rem;
            color: #555;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 6px;
            text-decoration: none;
            color: var(--white-color);
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            border: 1px solid transparent;
        }
        
        .btn-primary {
            background-color: var(--color-primary);
            border:1px solid var(--color-primary);
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #fff;
            color: #000;
        }
        
        .btn-secondary {
            background-color: transparent;
            color: var(--dark-color);
            border-color: #ccc;
        }
        .btn-secondary:hover {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <uc:Header runat="server" ID="Header1" />
    <div class="thank-you-body">
        <form id="form1" runat="server">
            <div class="thank-you-container">
                <i class="fas fa-check-circle success-icon"></i>
                <h1>Đặt Hàng Thành Công!</h1>
                <p>
                    Cảm ơn bạn đã tin tưởng và mua hàng. Đơn hàng của bạn đang được xử lý 
                    và sẽ sớm được giao đến bạn.
                </p>
                <div class="button-group">
                    <a href="TrangChu.aspx" class="btn btn-primary">Tiếp tục mua sắm</a>
                    <a href="ThongTinNguoiDung.aspx" class="btn btn-secondary">Xem lịch sử đơn hàng</a>
                </div>
            </div>
        </form>
    </div>
    <uc:Footer runat="server" ID="Footer1" />
</body>
</html>