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
                <asp:Label ID="lblTenNguoiDungError" runat="server" CssClass="text-danger" ForeColor="Red"></asp:Label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEnail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="lblEmailError" runat="server" CssClass="text-danger" ForeColor="Red"></asp:Label>

            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu"></asp:Label>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="lblMatKhauError" runat="server" CssClass="text-danger" ForeColor="Red"></asp:Label>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Địa chỉ"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Số điện thoại"></asp:Label>
                <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                <asp:Label ID="lblSoDienThoaiError" runat="server" CssClass="text-danger" ForeColor="Red"></asp:Label>

            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Ngày đăng ký"></asp:Label>
                <asp:TextBox ID="txtNgayDangKy" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblQuyen" runat="server" Text="Quyền"></asp:Label>
                <asp:DropDownList ID="ddlQuyen" runat="server" CssClass="form-control">
                    <asp:ListItem Text="USER" Value="USER" />
                    <asp:ListItem Text="ADMIN" Value="ADMIN" />
                </asp:DropDownList>
            </div>

        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn" OnClick="btnThemMoi_Click" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Sửa" CssClass="btn" OnClick="btnCapNhat_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn" OnClick="btnHuy_Click" />

        </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message-error" ClientIDMode="Static"></asp:Label>
    </div>


    <div class="inner-table-result">
        <asp:GridView ID="gvNguoiDung" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="MaNguoiDung"
    CssClass="table table-bordered table-hover"
    Width="100%"
    OnSelectedIndexChanged="gvNguoiDung_SelectedIndexChanged">
    <Columns>
         <asp:CommandField ShowSelectButton="True" SelectText="chọn"
     ItemStyle-Width="30px" ControlStyle-CssClass="select-button" />
        <asp:BoundField DataField="MaNguoiDung" HeaderText="Mã người dùng" ReadOnly="true" />
        <asp:BoundField DataField="TenNguoiDung" HeaderText="Tên người dùng" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" />
        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
        <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
        <asp:BoundField DataField="NgayDangKy" HeaderText="Ngày đăng ký" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="Quyen" HeaderText="Quyền" />
    </Columns>

</asp:GridView>

    </div>
    <script type="text/javascript">
    function hideMessageAfterDelay() {
        var lbl = document.getElementById('lblMessage');
        if (lbl && lbl.innerText.trim() !== "") {
            setTimeout(function () {
                lbl.style.display = 'none';
            }, 5000);
        }
    }
    window.onload = function () {
        hideMessageAfterDelay();
    };
    </script>

</asp:Content>
