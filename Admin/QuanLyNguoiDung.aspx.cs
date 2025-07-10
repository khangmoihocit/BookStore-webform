using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.Admin
{
    public partial class QuanLyNguoiDung : System.Web.UI.Page
    {
        private NguoiDungDAL nguoiDungDAL;

        public QuanLyNguoiDung()
        {
            nguoiDungDAL = new NguoiDungDAL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            try
            {
                lblMessage.Visible = false;
                List<NguoiDung> listNguoiDung = nguoiDungDAL.getAll();
                gvNguoiDung.DataSource = listNguoiDung;
                gvNguoiDung.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi tải dữ liệu: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void gvNguoiDung_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Visible = false;
                GridViewRow row = gvNguoiDung.SelectedRow;
                if (row != null)
                {
                    int maNguoiDung = int.Parse(row.Cells[1].Text);
                    NguoiDung nguoiDung = nguoiDungDAL.getById(maNguoiDung);
                    if (nguoiDung != null)
                    {
                        txtMaNguoiDung.Text = nguoiDung.MaNguoiDung.ToString();
                        txtTenNguoiDung.Text = Server.HtmlDecode(nguoiDung.TenNguoiDung);
                        txtEnail.Text = nguoiDung.Email;
                        txtMatKhau.Text = nguoiDung.MatKhau;
                        txtDiaChi.Text = Server.HtmlDecode(nguoiDung.DiaChi);
                        txtSoDienThoai.Text = nguoiDung.SoDienThoai;
                        txtNgayDangKy.Text = nguoiDung.NgayDangKy.ToString("yyyy-MM-dd");
                        ddlQuyen.SelectedValue = nguoiDung.Quyen;

                        btnCapNhat.Text = "Sửa";
                        IsEditMode = true;
                        btnThemMoi.Visible = false;


                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi chọn người dùng: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            if (!KiemTraHopLe())
            {

                return;
            }

            try
            {
                NguoiDung nguoiDung = new NguoiDung
                {
                    TenNguoiDung = txtTenNguoiDung.Text.Trim(),
                    Email = txtEnail.Text.Trim(),
                    MatKhau = txtMatKhau.Text.Trim(),
                    DiaChi = txtDiaChi.Text.Trim(),
                    SoDienThoai = txtSoDienThoai.Text.Trim(),
                    NgayDangKy = DateTime.Parse(txtNgayDangKy.Text),
                    Quyen = ddlQuyen.SelectedValue
                };
                nguoiDungDAL.Them(nguoiDung);
                LoadData();
                ClearForm();
                lblMessage.Text = "Thêm mới thành công!";
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi thêm mới: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
        private bool IsEditMode
        {
            get { return ViewState["IsEditMode"] != null && (bool)ViewState["IsEditMode"]; }
            set { ViewState["IsEditMode"] = value; }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (btnCapNhat.Text == "Sửa")
            {
                // Chuyển sang chế độ cập nhật
                if (string.IsNullOrWhiteSpace(txtMaNguoiDung.Text))
                {
                    lblMessage.Text = "Vui lòng chọn người dùng để sửa.";
                    lblMessage.Visible = true;
                    return;
                }
                btnCapNhat.Text = "Cập nhật";
                IsEditMode = true;
                return;
            }

            // Nếu đang ở chế độ cập nhật
            if (btnCapNhat.Text == "Cập nhật" && IsEditMode)
            {
                if (!KiemTraHopLe())
                {
                    return;
                }

                try
                {
                    NguoiDung nguoiDung = new NguoiDung
                    {
                        MaNguoiDung = int.Parse(txtMaNguoiDung.Text),
                        TenNguoiDung = txtTenNguoiDung.Text.Trim(),
                        Email = txtEnail.Text.Trim(),
                        MatKhau = txtMatKhau.Text.Trim(),
                        DiaChi = txtDiaChi.Text.Trim(),
                        SoDienThoai = txtSoDienThoai.Text.Trim(),
                        NgayDangKy = DateTime.Parse(txtNgayDangKy.Text),
                        Quyen = ddlQuyen.SelectedValue
                    };
                    nguoiDungDAL.CapNhat(nguoiDung);
                    LoadData();
                    ClearForm();
                    lblMessage.Text = "Cập nhật thành công!";
                    lblMessage.Visible = true;

                    // Đặt lại trạng thái về "Sửa"
                    btnCapNhat.Text = "Sửa";
                    IsEditMode = false;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Lỗi khi cập nhật: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }



        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                int maNguoiDung = int.Parse(txtMaNguoiDung.Text);
                nguoiDungDAL.Xoa(maNguoiDung);
                LoadData();
                ClearForm();
                lblMessage.Text = "Xóa thành công!";
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi xóa: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblMessage.Text = "";
            lblMessage.Visible = false;
        }

        private void ClearForm()
        {
            txtMaNguoiDung.Text = "";
            txtTenNguoiDung.Text = "";
            txtEnail.Text = "";
            txtMatKhau.Text = "";
            txtDiaChi.Text = "";
            txtSoDienThoai.Text = "";
            txtNgayDangKy.Text = "";
            ddlQuyen.SelectedValue = "";
            lblTenNguoiDungError.Text = "";
            lblEmailError.Text = "";
            lblMatKhauError.Text = "";
            lblSoDienThoaiError.Text = "";
            btnCapNhat.Text = "Sửa";
            IsEditMode = false;
            btnThemMoi.Visible = true;




        }
        private bool KiemTraHopLe()
        {
            // Xóa thông báo lỗi cũ
            lblTenNguoiDungError.Text = "";
            lblEmailError.Text = "";
            lblMatKhauError.Text = "";
            lblSoDienThoaiError.Text = "";

            // Kiểm tra không để trống
            if (string.IsNullOrWhiteSpace(txtTenNguoiDung.Text) ||
                string.IsNullOrWhiteSpace(txtEnail.Text) ||
                string.IsNullOrWhiteSpace(txtMatKhau.Text) ||
                string.IsNullOrWhiteSpace(txtDiaChi.Text) ||
                string.IsNullOrWhiteSpace(txtSoDienThoai.Text) ||
                string.IsNullOrWhiteSpace(txtNgayDangKy.Text))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin.";
                lblMessage.Visible = true;
                return false;
            }

            lblMessage.Text = "";
            lblMessage.Visible = false;
            bool isValid = true;

            // Kiểm tra số điện thoại
            string soDienThoai = txtSoDienThoai.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(soDienThoai, @"^0\d{9,10}$"))
            {
                lblSoDienThoaiError.Text = "Số điện thoại phải bắt đầu bằng số 0 và có 10 hoặc 11 số.";
                isValid = false;
            }

            // Kiểm tra email hợp lệ
            string email = txtEnail.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblEmailError.Text = "Email không hợp lệ.";
                isValid = false;
            }

            // Tên người dùng không được trùng với mật khẩu
            if (txtTenNguoiDung.Text.Trim() == txtMatKhau.Text.Trim())
            {
                lblMatKhauError.Text = "Tên người dùng không được trùng với mật khẩu.";
                isValid = false;
            }

            // Kiểm tra mật khẩu không được ghi dấu`
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtMatKhau.Text, @"^[\x20-\x7E]+$"))
            {
                lblMatKhauError.Text = "Mật khẩu không được chứa ký tự có dấu.";
                isValid = false;
            }

            return isValid;
        }


    }
}
