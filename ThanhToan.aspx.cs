using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDonHang();
                LoadThongTinNguoiDung();
            }
        }

        private void LoadDonHang()
        {
            List<Sach> donHang = Session["DonHang"] as List<Sach>;

            if (donHang == null || !donHang.Any())
            {
                Response.Redirect("GioHang.aspx");
                return;
            }

            rptDonHang.DataSource = donHang;
            rptDonHang.DataBind();

            decimal tongTien = donHang.Sum(s => (decimal)s.GiaBanMoi * s.SoLuong);
            lblTongTien.Text = tongTien.ToString("N0") + "đ";
        }

        private void LoadThongTinNguoiDung()
        {
            if (Session["User"] != null)
            {
                try
                {
                    NguoiDung currentUser = (NguoiDung)Session["User"];

                    // Kiểm tra từng thuộc tính trước khi gán để tránh lỗi
                    // và đảm bảo chỉ điền những thông tin thực sự có.
                    if (!string.IsNullOrEmpty(currentUser.TenNguoiDung))
                    {
                        txtName.Text = currentUser.TenNguoiDung;
                    }

                    if (!string.IsNullOrEmpty(currentUser.SoDienThoai))
                    {
                        txtPhone.Text = currentUser.SoDienThoai;
                    }

                    // Nếu DiaChi là null hoặc rỗng (do không được lưu khi đăng ký),
                    // ô địa chỉ sẽ vẫn để trống.
                    if (!string.IsNullOrEmpty(currentUser.DiaChi))
                    {
                        txtAddress.Text = currentUser.DiaChi;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi khi tải thông tin người dùng: " + ex.Message);
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // 1. Kiểm tra điều kiện
            if (Session["User"] == null)
            {
                lblMessage.Text = "Vui lòng đăng nhập để đặt hàng.";
                lblMessage.Visible = true;
                return;
            }
            List<Sach> gioHang = Session["DonHang"] as List<Sach>;
            if (gioHang == null || !gioHang.Any())
            {
                lblMessage.Text = "Không có sản phẩm nào để đặt hàng.";
                lblMessage.Visible = true;
                return;
            }

            try
            {
                // 2. Thu thập thông tin từ Form và Session
                NguoiDung currentUser = (NguoiDung)Session["User"];

                DatHang donHangMoi = new DatHang();
                donHangMoi.MaNguoiDung = currentUser.MaNguoiDung;
                donHangMoi.NguoiNhan = txtName.Text; // Lấy từ form
                donHangMoi.DiaChiNhanHang = txtAddress.Text; // Lấy từ form
                donHangMoi.SDTNhanHang = txtPhone.Text; // Lấy từ form
                donHangMoi.NgayDatHang = DateTime.Now;
                donHangMoi.PhuongThucTT = ddlPayment.SelectedValue;

                double tongTien = gioHang.Sum(s => (double)s.GiaBanMoi * s.SoLuong);
                donHangMoi.TongThanhTien = tongTien;

                // 3. Tạo danh sách chi tiết đơn hàng
                List<ChiTietDatHang> chiTietList = new List<ChiTietDatHang>();
                foreach (var sanPham in gioHang)
                {
                    chiTietList.Add(new ChiTietDatHang
                    {
                        MaSach = sanPham.MaSach,
                        SoLuong = sanPham.SoLuong,
                        GiaBan = (double)sanPham.GiaBanMoi,
                        TrangThai = "Chờ xử lý" // Mặc định trạng thái là "Chờ xử lý"
                    });
                }

                // 4. Gọi DAL để lưu vào database
                DatHangDAL datHangDAL = new DatHangDAL();
                datHangDAL.ThemDatHang(donHangMoi, chiTietList);

                // 5. Xử lý sau khi thành công
                Session.Remove("DonHang");
                Session.Remove("GioHang");

                // Chuyển đến trang thông báo thành công
                Response.Redirect("DatHangThanhCong.aspx");

            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Đã xảy ra lỗi không mong muốn. Vui lòng thử lại. " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}