using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class ThongTinNguoiDung : System.Web.UI.Page
    {
        private DatHangDAL datHangDAL;
        private ChiTietDatHangDAL chiTietDatHangDAL;
        private NguoiDungDAL nguoiDungDAL;
        public ThongTinNguoiDung()
        {
            datHangDAL = new DatHangDAL();
            chiTietDatHangDAL = new ChiTietDatHangDAL();
            nguoiDungDAL = new NguoiDungDAL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("DangNhapDangKy.aspx");
                }
                else
                {
                    NguoiDung user = (NguoiDung)Session["User"];
                    txtHoTen.Text = user.TenNguoiDung;
                    txtEmail.Text = user.Email;
                    txtSoDienThoai.Text = user.SoDienThoai;
                    txtDiaChi.Text = user.DiaChi;
                    txtQuyen.Text = user.Quyen;
                    txtNgayDangKy.Text = user.NgayDangKy.ToString("yyyy-MM-dd");
                    loadLichSuMuaHang(user.MaNguoiDung);
                    if (user.Quyen == "ADMIN")
                    {
                        btnAdmin.Visible = true;
                        btnAdmin.Enabled = true;
                    }
                    else
                    {
                        btnAdmin.Visible = false;
                        btnAdmin.Enabled = false;
                    }
                }
            }
        }

        private void loadLichSuMuaHang(int maNguoiDung)
        {
            if (maNguoiDung != null)
            {
                List<Dictionary<string, object>> lichSuMuaHang = nguoiDungDAL.getLichSuMuaHang(maNguoiDung);
                if(lichSuMuaHang.Count < 1)
                {
                    string html = "<h3 style='color: red;'>Chưa có lịch sử mua hàng</div>";
                    ltlLichSuMuaHang.Text = html;
                    return;
                }
                StringBuilder htmlBuilder = new StringBuilder();

                htmlBuilder.Append(@"
             <h2>Lịch sử mua hàng</h2>
             <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên sách</th>
                        <th>Số lượng</th>
                        <th>Giá bán</th>
                        <th>Ngày đặt hàng</th>
                        <th>Phương thức thanh toán</th>
                        <th>Địa chỉ nhận hàng</th>
                        <th>Số điện thoại nhận hàng</th>
                    </tr>
                </thead>
                <tbody>
                ");

                int stt = 1;
                foreach (var donHang in lichSuMuaHang)
                {
                    htmlBuilder.Append("<tr>");
                    htmlBuilder.AppendFormat("<td>{0}</td>", stt++);
                    htmlBuilder.AppendFormat("<td>{0}</td>", donHang["tenSach"]);
                    htmlBuilder.AppendFormat("<td>{0}</td>", donHang["soLuong"]);
                    htmlBuilder.AppendFormat("<td>{0:N0}đ</td>", donHang["giaBan"]);
                    htmlBuilder.AppendFormat("<td>{0:dd/MM/yyyy}</td>", donHang["ngayDatHang"]);
                    htmlBuilder.AppendFormat("<td>{0}</td>", donHang["phuongThucThanhToan"]);
                    htmlBuilder.AppendFormat("<td>{0}</td>", donHang["diaChiNhanHang"]);
                    htmlBuilder.AppendFormat("<td>{0}</td>", donHang["SDTNhanHang"]);
                    htmlBuilder.Append("</tr>");
                }

                htmlBuilder.Append(@"
                    </tbody>
                </table>
                ");

                ltlLichSuMuaHang.Text = htmlBuilder.ToString();
            }
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("DangNhapDangKy.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                NguoiDung user = (NguoiDung)Session["User"];
                if (user.Quyen == "ADMIN")
                {
                    Response.Redirect("/Admin/QuanLySach.aspx");
                }
                else
                {
                    lblTitle.Text = "Bạn không có quyền truy cập vào trang quản trị.";
                    lblTitle.ForeColor = System.Drawing.Color.Red;
                    lblTitle.Visible = true;
                }
            }
            else
            {
                Response.Redirect("DangNhapDangKy.aspx");
            }
        }

        protected void btnLuuThongTin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            if (!string.IsNullOrEmpty(email))
            {
                NguoiDung nguoiDung = nguoiDungDAL.getByEmail(email);
                nguoiDung.TenNguoiDung = txtHoTen.Text;
                nguoiDung.SoDienThoai = txtSoDienThoai.Text;
                nguoiDung.DiaChi = txtDiaChi.Text;
                nguoiDungDAL.CapNhat(nguoiDung);
                loadLichSuMuaHang(nguoiDung.MaNguoiDung);
            }
        }
    }
}