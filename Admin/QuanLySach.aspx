<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="QuanLySach.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLySach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-container">
        <div class="form-row">
            <div class="form-group">
                <label for="fileAnhBia">Ảnh bìa</label>
                <asp:FileUpload ID="fileAnhBia" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="image-preview" Visible="false" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="txtMaSach">Mã sách</label>
                <asp:TextBox ID="txtMaSach" runat="server" CssClass="form-control"></asp:TextBox>
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
                <label for="txtGiaMoi">Giá bán mới</label>
                <asp:TextBox ID="txtGiaMoi" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtGiaCu">Giá bán cũ (nếu có)</label>
                <asp:TextBox ID="txtGiaCu" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtSoLuong">Số lượng</label>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn btn-primary"  />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn btn-success" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-danger"  />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-secondary" />
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>

    <div class="inner-table-result">
        <asp:GridView ID="gvSach" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="PK_iSachID"
            CssClass="table table-bordered table-hover"
            Width="100%">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Chọn" />
                <asp:BoundField DataField="PK_iSachID" HeaderText="ID" />
                <asp:BoundField DataField="sTensach" HeaderText="Tên Sách" />
                <asp:ImageField DataImageUrlField="sURLanh" HeaderText="Ảnh" />
                <asp:BoundField DataField="fGiabanmoi" HeaderText="Giá mới" DataFormatString="{0:N0}đ" />
                <asp:BoundField DataField="fGiabancu" HeaderText="Giá cũ" DataFormatString="{0:N0}đ" />
                <asp:BoundField DataField="iSoluong" HeaderText="Số lượng" />
            </Columns>
        </asp:GridView>
    </div> 
</asp:Content>
