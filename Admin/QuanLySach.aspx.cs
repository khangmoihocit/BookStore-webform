using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.Admin
{
    public partial class QuanLySach : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        private TheLoaiDAL theLoaiDAL;
        private NhaXuatBanDAL nhaXuatBanDAL;
        private TacGiaDAL tacGiaDAL;
        public QuanLySach()
        {
            sachDAL = new SachDAL();
            theLoaiDAL = new TheLoaiDAL();
            nhaXuatBanDAL = new NhaXuatBanDAL();
            tacGiaDAL = new TacGiaDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra quyền truy cập của người dùng
            if (Session["User"] != null)
            {
                NguoiDung nguoiDung = Session["User"] as NguoiDung;
                if (nguoiDung.Quyen.Equals("ADMIN"))
                {

                }
                else
                {
                    Response.Redirect("~/DangNhapDangKy.aspx");
                }
            }
            else
            {
                Response.Redirect("~/DangNhapDangKy.aspx");

            }
            if (!IsPostBack)
            {
                
                loadData();
            }
        }

        private void loadData()
        {
            try
            {
                lblMessage.Visible = false;
                List<Sach> listSach = sachDAL.getAll();
                List<TheLoai> listTheLoai = theLoaiDAL.getAll();
                List<NhaXuatBan> listNhaXuatBan = nhaXuatBanDAL.getAll();
                List<TacGia> listTacGia = tacGiaDAL.getAll();

                ddlTheLoai.DataSource = listTheLoai;
                ddlTheLoai.DataTextField = "TenTheLoai";
                ddlTheLoai.DataValueField = "MaTheLoai";
                ddlTheLoai.DataBind();
                ddlTheLoai.Items.Insert(0, new ListItem("-- Chọn thể loại --", "0"));


                ddlNhaXuatBan.DataSource = listNhaXuatBan;
                ddlNhaXuatBan.DataTextField = "TenNhaXuatBan";
                ddlNhaXuatBan.DataValueField = "MaNhaXuatBan";
                ddlNhaXuatBan.DataBind();
                ddlNhaXuatBan.Items.Insert(0, new ListItem("-- Chọn nhà xuất bản --", "0"));


                ddlTacGia.DataSource = listTacGia;
                ddlTacGia.DataTextField = "TenTacGia";
                ddlTacGia.DataValueField = "MaTacGia";
                ddlTacGia.DataBind();
                ddlTacGia.Items.Insert(0, new ListItem("-- Chọn tác giả --", "0"));

                gvSach.DataSource = listSach;
                gvSach.DataBind();
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi tải dữ liệu: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void gvSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                resetMessageValid();
                lblMessage.Visible = false;
                GridViewRow row = gvSach.SelectedRow;
                if (row != null)
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(row.Cells[1].Text));
                    if (sach != null)
                    {
                        txtMaSach.Text = Server.HtmlDecode(sach.MaSach.ToString());
                        txtTenSach.Text = Server.HtmlDecode(sach.TenSach);
                        txtMoTa.Text = Server.HtmlDecode(sach.MoTa);
                        imgPreview.ImageUrl = Server.HtmlDecode(sach.URLAnh);
                        txtGiaBanMoi.Text = sach.GiaBanMoi.ToString();
                        txtGiaBanCu.Text = sach.GiaBanCu.ToString();
                        txtSoLuong.Text = sach.SoLuong.ToString();
                        ddlTheLoai.SelectedValue = sach.MaTheLoai.ToString();
                        ddlTacGia.SelectedValue = sach.MaTacGia.ToString();
                        ddlNhaXuatBan.SelectedValue = sach.MaNhaXuatBan.ToString();
                    }

                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi chọn sách: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch(FormatException ex)
            {
                lblMessage.Text = "lỗi khi chuyển đổi kiểu dữ liệu: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi chọn sách: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void ddlTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            
            if (!checkInput())
            {
                return;
            }

            string imageUrl = "";
            if (FileUpload1.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    //Tránh trùng tên tệp bằng cách thêm Guid
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName;
                    string filePath = Server.MapPath("~/assets/images/") + uniqueFileName;
                    //lưu ảnh vào trong project
                    FileUpload1.SaveAs(filePath);

                    imageUrl = "/assets/images/" + uniqueFileName;
                }
                catch(Exception ex)
                {
                    lblMessage.Text = "Lỗi khi tải lên hình ảnh: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }

            try
            {
                Sach sach = new Sach();
                sach.TenSach = txtTenSach.Text.Trim();
                sach.MoTa = txtMoTa.Text.Trim();
                sach.URLAnh = imageUrl != "" && imageUrl != null ? imageUrl : "/assets/images/mac_dinh.jpg";
                sach.GiaBanMoi = double.Parse(txtGiaBanMoi.Text.Trim());
                sach.GiaBanCu = double.Parse(txtGiaBanCu.Text.Trim());
                sach.SoLuong = int.Parse(txtSoLuong.Text.Trim());
                sach.MaTheLoai = int.Parse(ddlTheLoai.SelectedValue);
                sach.MaTacGia = int.Parse(ddlTacGia.SelectedValue);
                sach.MaNhaXuatBan = int.Parse(ddlNhaXuatBan.SelectedValue);
                sachDAL.add(sach);

                imgPreview.ImageUrl = sach.URLAnh;
                lblMessage.Text = "Thêm sách thành công!";
                lblMessage.Visible = true;
                loadData();
                lamMoi();
            }
            catch (AppException ex)
            {
                lblMessage.Text =  ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi thêm sách: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        private bool checkInput()
        {
            bool check = true;
            if (string.IsNullOrEmpty(txtTenSach.Text.Trim()))
            {
                lblTenSachError.Text = "Tên sách không được để trống.";
                lblTenSachError.Visible = true;
                check = false;
            }
            else
            {
                lblTenSachError.Text = "";
                lblTenSachError.Visible = false;
            }
            if (string.IsNullOrEmpty(txtGiaBanMoi.Text.Trim()) || !double.TryParse(txtGiaBanMoi.Text.Trim(), out _))
            {
                lblGiaBanMoiError.Text = "Giá bán mới không hợp lệ.";
                lblGiaBanMoiError.Visible = true;
                check = false;
            }
            else
            {
                lblGiaBanMoiError.Text = "";
                lblGiaBanMoiError.Visible = false;
            }
            if (string.IsNullOrEmpty(txtGiaBanCu.Text.Trim()) || !double.TryParse(txtGiaBanCu.Text.Trim(), out _))
            {
                lblGiaBanCuError.Text = "Giá bán cũ không hợp lệ.";
                lblGiaBanCuError.Visible = true;
                check = false;

            }
            else
            {
                lblGiaBanCuError.Text = "";
                lblGiaBanCuError.Visible = false;
            }
            if (string.IsNullOrEmpty(txtSoLuong.Text.Trim()) || !int.TryParse(txtSoLuong.Text.Trim(), out _))
            {
                lblSoLuongError.Text = "Số lượng không hợp lệ.";
                lblSoLuongError.Visible = true;
                check = false;
            }
            else
            {
                lblSoLuongError.Text = "";
                lblSoLuongError.Visible = false;
            }

            if(ddlTheLoai.SelectedIndex < 1)
            {
                lblTheLoaiError.Text = "Vui lòng chọn thể loại";
                lblTheLoaiError.Visible = true;
                check = false;
            }
            else
            {
                lblTheLoaiError.Text = "";
                lblTheLoaiError.Visible = false;
            }

            if (ddlNhaXuatBan.SelectedIndex < 1)
            {
                lblNhaXuatBanError.Text = "Vui lòng chọn nhà xuất bản";
                lblNhaXuatBanError.Visible = true;
                check = false;
            }
            else
            {
                lblNhaXuatBanError.Text = "";
                lblNhaXuatBanError.Visible = false;
            }
            if (ddlTacGia.SelectedIndex < 1)
            {
                lblTacGiaError.Text = "Vui lòng chọn tác giả";
                lblTacGiaError.Visible = true;
                check = false;
            }
            else
            {
                lblTacGiaError.Text = "";
                lblTacGiaError.Visible = false;
            }

            return check;
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            lamMoi();
        }
        
        private void lamMoi()
        {
            txtMaSach.Text = string.Empty;
            txtTenSach.Text = string.Empty;
            txtMoTa.Text = string.Empty;
            imgPreview.ImageUrl = string.Empty;
            txtGiaBanMoi.Text = string.Empty;
            txtGiaBanCu.Text = string.Empty;
            txtSoLuong.Text = string.Empty;
            ddlTheLoai.SelectedIndex = 0;
            ddlTacGia.SelectedIndex = 0;
            ddlNhaXuatBan.SelectedIndex = 0;

            lblMessage.Visible = false;
            gvSach.DataSource = sachDAL.getAll();
            gvSach.DataBind();
            txtTimKiem.Text = string.Empty;

            resetMessageValid();
            gvSach.SelectedIndex = -1; // Bỏ chọn dòng trong GridView

        }

        private void resetMessageValid()
        {
            lblTenSachError.Text = string.Empty;
            lblTenSachError.Visible = false;
            lblGiaBanMoiError.Text = string.Empty;
            lblGiaBanMoiError.Visible = false;
            lblGiaBanCuError.Text = string.Empty;
            lblGiaBanCuError.Visible = false;
            lblSoLuongError.Text = string.Empty;
            lblSoLuongError.Visible = false;
            lblTheLoaiError.Text = string.Empty;
            lblTheLoaiError.Visible = false;
            lblNhaXuatBanError.Text = string.Empty;
            lblNhaXuatBanError.Visible = false;
            lblTacGiaError.Text = string.Empty;
            lblTacGiaError.Visible = false;
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra đầu vào
                if (string.IsNullOrWhiteSpace(txtMaSach.Text))
                {
                    lblMessage.Text = " Vui lòng chọn sách cần cập nhật";
                    lblMessage.Visible = true;
                    return;
                }

                if (!checkInput())
                {
                    return;
                }

                // Xử lý ảnh
                string anhUrl = imgPreview.ImageUrl;
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string savePath = Server.MapPath("~/assets/images/") + fileName;
                    FileUpload1.SaveAs(savePath);
                    anhUrl = "/assets/images/" + fileName;
                    imgPreview.ImageUrl = anhUrl;
                }

                // Tạo đối tượng Sach
                Sach sach = new Sach
                {
                    MaSach = int.Parse(txtMaSach.Text),
                    TenSach = txtTenSach.Text,
                    MoTa = txtMoTa.Text,
                    URLAnh = anhUrl,
                    GiaBanMoi = float.TryParse(txtGiaBanMoi.Text, out float giaMoi) ? giaMoi : 0,
                    GiaBanCu = float.TryParse(txtGiaBanCu.Text, out float giaCu) ? giaCu : 0,
                    SoLuong = int.TryParse(txtSoLuong.Text, out int soLuong) ? soLuong : 0,
                    MaTheLoai = int.TryParse(ddlTheLoai.SelectedValue, out int maTL) ? maTL : 0,
                    MaTacGia = int.TryParse(ddlTacGia.SelectedValue, out int maTG) ? maTG : 0,
                    MaNhaXuatBan = int.TryParse(ddlNhaXuatBan.SelectedValue, out int maNXB) ? maNXB : 0
                };

                // Gọi hàm cập nhật DAL
                bool kq = sachDAL.CapNhatSach(sach);
                if (kq)
                {
                    loadData();
                    lamMoi();
                }
                else
                {
                    lblMessage.Text = "Không tìm thấy sách để cập nhật.";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi cập nhật: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {

            try
            {
                if (string.IsNullOrWhiteSpace(txtMaSach.Text))
                {
                    lblMessage.Text = "Vui lòng chọn sách để xóa.";
                    lblMessage.Visible = true;
                    return;
                }

                int maSach = int.Parse(txtMaSach.Text);
                bool kq = sachDAL.XoaSach(maSach);
                if (kq)
                {
                    lamMoi();
                    loadData(); // hoặc GVBind();
                }
                else
                {
                    lblMessage.Text = "Không tìm thấy sách để xóa.";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi xóa sách: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            try
            {
                List<Sach> listSach = sachDAL.findByName(txtTimKiem.Text);
                if (listSach.Count == 0)
                {
                    lblMessage.Text = "Không tìm thấy sách nào với tên '" + txtTimKiem.Text + "'";
                    lblMessage.Visible = true;
                }
                else
                {
                    gvSach.DataSource = listSach;
                    gvSach.DataBind();
                    lblMessage.Visible = false;
                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi tìm kiếm: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}