<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLyNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="lblMaTheLoai" runat="server" Text="Mã người dùng"></asp:Label>
                <asp:TextBox ID="txtMaNguoiDung" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblTenNXB" runat="server" Text="Tên người dùng"></asp:Label>
                <asp:TextBox ID="txtTenNguoiDung" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEnail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu"></asp:Label>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Địa chỉ"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Số điện thoại"></asp:Label>
                <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Ngày đăng ký"></asp:Label>
                <asp:TextBox ID="txtNgayDangKy" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn" />
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="message-error"></asp:Label>
    </div>


    <div class="inner-table-result">
        <asp:GridView ID="gvNguoiDung" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="PK_iNguoidungID"
            CssClass="table table-bordered table-hover"
            Width="100%">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Chọn" />

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
