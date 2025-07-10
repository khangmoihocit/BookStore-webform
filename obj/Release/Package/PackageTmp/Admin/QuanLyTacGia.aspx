<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyTacGia.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLyTacGia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="lblMaTheLoai" runat="server" Text="Mã tác giả"></asp:Label>
                <asp:TextBox ID="txtMaTacGia" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblTenNXB" runat="server" Text="Tên tác giả"></asp:Label>
                <asp:TextBox ID="txtTenTacGia" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Ngày sinh"></asp:Label>
                <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn" OnClick="btnThemMoi_Click" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn" OnClick="btnCapNhat_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn" OnClick="btnHuy_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="message-error"></asp:Label>
    </div>


    <div class="inner-table-result">
        <asp:GridView ID="gvTacGia" runat="server"
            AutoGenerateColumns="False"
            SelectedRowStyle-CssClass="selected-row"
            Width="100%" OnSelectedIndexChanged="gvTacGia_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="chọn"
                    ItemStyle-Width="30px" ControlStyle-CssClass="select-button" />

                <asp:BoundField DataField="MaTacGia" HeaderText="Mã tác giả" />
                <asp:BoundField DataField="TenTacGia" HeaderText="Tên tác giả" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />


            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
