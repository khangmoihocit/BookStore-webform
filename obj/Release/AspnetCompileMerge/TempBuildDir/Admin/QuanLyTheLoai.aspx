<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyTheLoai.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLyTheLoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="lblMaTheLoai" runat="server" Text="Mã thể loại"></asp:Label>
                <asp:TextBox ID="txtMaTheLoai" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblTenNXB" runat="server" Text="Tên thể loại"></asp:Label>
                <asp:TextBox ID="txtTenTheLoai" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn" OnClick="btnThemMoi_Click" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn" OnClick="btnCapNhat_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn" />
        </div>
        <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="message-error"></asp:Label>
    </div>


    <div class="inner-table-result">
        <asp:GridView ID="gvTheLoai" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MaTheLoai"
            SelectedRowStyle-CssClass="selected-row"
            Width="100%" OnSelectedIndexChanged="gvTheLoai_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="chọn"
                    ItemStyle-Width="30px" ControlStyle-CssClass="select-button" />
                <asp:BoundField DataField="MaTheLoai" HeaderText="Mã thể loại" />
                <asp:BoundField DataField="TenTheLoai" HeaderText="Tên thể loại" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
