<%@ Page Title="Quản lý Đơn hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDatHang.aspx.cs" Inherits="btl_laptrinhweb.Admin.QuanLyDatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Khu vực lọc và tìm kiếm --%>
    <div class="form-container form-row">
        <div class="form-group">
            <label for="<%=txtTenSach.ClientID%>">Tên sách</label>
            <asp:TextBox ID="txtTenSach" runat="server" CssClass="form-control" placeholder="Nhập tên sách..."></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="<%=txtTuNgay.ClientID%>">Từ ngày</label>
            <asp:TextBox ID="txtTuNgay" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="<%=txtDenNgay.ClientID%>">Đến ngày</label>
            <asp:TextBox ID="txtDenNgay" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-buttons">
            <asp:Button ID="btnLoc" runat="server" Text="Lọc / Tìm kiếm" CssClass="btn" OnClick="btnLoc_Click" />
            <asp:Button ID="btnHuyLoc" CssClass="btn" runat="server" Text="Hủy lọc" OnClick="btnHuyLoc_Click" />
        </div>
    </div>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" EnableViewState="false"></asp:Label>
    <div class="inner-table-result">

        <asp:GridView
            ID="gvDonHang"
            runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MaDatHang"
            SelectedRowStyle-CssClass="selected-row"
            OnRowDataBound="gvDonHang_RowDataBound"
            Width="100%">
            <Columns>
                <asp:BoundField DataField="MaDatHang" HeaderText="Mã ĐH" ItemStyle-Width="5%" />
                <asp:BoundField DataField="TenNguoiDung" HeaderText="Tên khách hàng" />
                <asp:BoundField DataField="TenSach" HeaderText="Tên sách" />
                <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="TongThanhTien" HeaderText="Thành tiền" DataFormatString="{0:N0}đ" />
                <asp:BoundField DataField="DiaChiNhanHang" HeaderText="Đại chỉ nhận hàng" />
                <asp:BoundField DataField="SDTNhanHang" HeaderText="Số điện thoại nhận hàng" />
                <asp:BoundField DataField="PhuongThucTT" HeaderText="Phương TTT" />
                <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />

                <%-- CỘT TRẠNG THÁI --%>
                <asp:TemplateField HeaderText="Trạng thái">
                    <ItemTemplate>
                        <asp:DropDownList 
                            ID="ddlTrangThai" 
                            runat="server" 
                            CssClass="ddl-status"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlTrangThai_SelectedIndexChanged">
                            <asp:ListItem Text="Đang xử lý" Value="Đang xử lý"></asp:ListItem>
                            <asp:ListItem Text="Đã giao" Value="Đã giao"></asp:ListItem>
                            <asp:ListItem Text="Đã hủy" Value="Đã hủy"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
