<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyNhaXuatBan.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLyNhaXuatBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="lblMaNXB" runat="server" Text="Mã nhà xuất bản"></asp:Label>
                <asp:TextBox ID="txtMaNXB" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblTenNXB" runat="server" Text="Tên nhà xuất bản"></asp:Label>
                <asp:TextBox ID="txtTenNXB" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Địa chỉ"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Số điện thoại"></asp:Label>
                <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="form-control"></asp:TextBox>
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
        <asp:GridView ID="gvNhaXuaBan" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MaNhaXuatBan"
            SelectedRowStyle-CssClass="selected-row"
            Width="100%">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="chọn"
                    ItemStyle-Width="30px" ControlStyle-CssClass="select-button" />
                <asp:BoundField DataField="" HeaderText="" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
