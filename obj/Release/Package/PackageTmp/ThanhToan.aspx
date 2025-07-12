<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="btl_laptrinhweb.ThanhToan" %>
<%@ Register Src="~/UserControls/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/reset.css" />
    <link rel="stylesheet" href="/assets/css/base.css" />
    <link rel="stylesheet" href="/assets/css/thanhtoan.css" />

    <title>Thanh Toán An Toàn</title>
    
</head>
<body>
    <uc:Header runat="server" ID="header1" />
    <form id="form1" runat="server">
        <div class="payment-page-container">
            
            <div class="customer-info-container">
                <h2>Thông Tin Nhận Hàng</h2>
                <div class="form-row">
                    <label for="txtName">Họ và tên</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Nhập họ và tên của bạn" />
                </div>
                <div class="form-row">
                    <label for="txtPhone">Số điện thoại</label>
                    <asp:TextBox ID="txtPhone" runat="server" placeholder="Nhập số điện thoại" />
                </div>
                <div class="form-row">
                    <label for="txtAddress">Địa chỉ giao hàng</label>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Nhập địa chỉ chi tiết" />
                </div>
                <div class="form-row">
                    <label for="ddlPayment">Phương thức thanh toán</label>
                    <asp:DropDownList ID="ddlPayment" runat="server">
                        <asp:ListItem Text="Thanh toán khi nhận hàng (COD)" Value="COD" />
                        <asp:ListItem Text="Chuyển khoản ngân hàng" Value="Bank" />
                    </asp:DropDownList>
                </div>
                <div class="form-row">
                    <asp:Button ID="btnSubmit" runat="server" Text="HOÀN TẤT ĐẶT HÀNG" CssClass="submit-btn" OnClick="btnSubmit_Click" />
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="error-message" />
            </div>

            <div class="order-summary-container">
                <h3>Chi Tiết Đơn Hàng</h3>
                <asp:Repeater ID="rptDonHang" runat="server">
                    <ItemTemplate>
                        <div class="order-item">
                            <div class="item-image">
                                <asp:Image ID="imgSanPham" runat="server" ImageUrl='<%# Eval("URLAnh") %>' alt='<%# Eval("TenSach") %>' />
                            </div>
                            <div class="item-details">
                                <span class="item-name"><%# Eval("TenSach") %></span>
                                <span class="item-quantity">Số lượng: <%# Eval("SoLuong") %></span>
                            </div>
                            <div class="item-price">
                                <span><%# string.Format("{0:N0}đ", Convert.ToDecimal(Eval("GiaBanMoi")) * Convert.ToInt32(Eval("SoLuong"))) %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="order-total">
                    <span>Tổng cộng:</span>
                    <asp:Label ID="lblTongTien" runat="server" Text="0đ"></asp:Label>
                </div>
            </div>

        </div>
    </form>
    <uc:Footer runat="server" ID="footer" />
</body>
</html>