<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="QuanLySach.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLySach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-container">
        <div class="form-inner-wrap">
            <div>
                <div class="form-row">
                    <div class="form-group form-inner-image">
                        <p>Ảnh bìa</p>
                        <asp:Image ID="imgPreview" runat="server" CssClass="image-preview" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-wrap-control">
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtMaSach">Mã sách</label>
                        <asp:TextBox ID="txtMaSach" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTenSach">Tên sách</label>
                        <asp:TextBox ID="txtTenSach" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="ddlTheLoai">Thể loại</label>
                        <asp:DropDownList ID="ddlTheLoai" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlTheLoai_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlTacGia">Tác giả</label>
                        <asp:DropDownList ID="ddlTacGia" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlNhaXuatBan">Nhà xuất bản</label>
                        <asp:DropDownList ID="ddlNhaXuatBan" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="txtGiaBanMoi">Giá bán mới</label>
                        <asp:TextBox ID="txtGiaBanMoi" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtGiaBanCu">Giá bán cũ (nếu có)</label>
                        <asp:TextBox ID="txtGiaBanCu" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtSoLuong">Số lượng</label>
                        <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn btn-primary" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn btn-success" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-danger" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-secondary" />
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>

    <div class="inner-table-result">
        <asp:GridView ID="gvSach" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MaSach"
            SelectedRowStyle-CssClass="selected-row"
            Width="100%" OnSelectedIndexChanged="gvSach_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="chọn"
                    ItemStyle-Width="30px" ControlStyle-CssClass="select-button" />
                <asp:BoundField DataField="MaSach" HeaderText="ID" />
                <asp:BoundField DataField="TenSach" HeaderText="Tên Sách" />
                <asp:BoundField DataField="URLAnh" HeaderText="Ảnh" />
                <asp:BoundField DataField="GiaBanMoi" HeaderText="Giá mới" />
                <asp:BoundField DataField="GiaBanCu" HeaderText="Giá cũ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
