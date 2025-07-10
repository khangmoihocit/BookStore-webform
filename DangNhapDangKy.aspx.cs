using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class DangNhapDangKy : System.Web.UI.Page
    {
        private NguoiDungDAL nguoiDungDAL;

        public DangNhapDangKy()
        {
            nguoiDungDAL = new NguoiDungDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            try
            {
                NguoiDung user = nguoiDungDAL.login(email, password);
                if (user != null)
                {
                    if (user.Quyen == "ADMIN")
                    {
                        Session["User"] = user; // Lưu thông tin người dùng vào Session
                        Response.Redirect("Admin/QuanLySach.aspx");
                    }
                    else
                    {
                        Session["User"] = user; // Lưu thông tin người dùng vào Session
                        Response.Redirect("TrangChu.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Đăng nhập thất bại, kiểm tra lại thông tin.";
                    lblMessage.Visible = true;
                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.Visible = true;
                return;
            }
        }

        private bool isValid()
        {
            bool isValid = false;
            if (string.IsNullOrEmpty(txtEmailRegister.Text) || string.IsNullOrEmpty(txtPasswordRegister.Text))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin.";
                lblMessage.Visible = true;
            }
            else
            {
                isValid = true;
            }
            return isValid;

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string ho = txtLastName.Text;
            string ten = txtFirstName.Text;
            string sdt = txtPhone.Text;
            string email = txtEmailRegister.Text;
            string matkhau = txtPasswordRegister.Text;
            if (!isValid())
            {
                return;
            }
            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.TenNguoiDung = ho + " " + ten;
            nguoiDung.MatKhau = matkhau;
            nguoiDung.Email = email;
            nguoiDung.SoDienThoai = sdt;
            nguoiDung.Quyen = "USER";

            try
            {
                nguoiDungDAL.add(nguoiDung);
                lblMessage.Text = "Đăng ký thành công!";
                lblMessage.Visible = true;
                SwitchToLogin(sender, e);
            }
            catch (AppException ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void SwitchToLogin(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;
            pnlRegister.Visible = false;
            btnSwitchLogin.CssClass = "tab-link active";
            btnSwitchRegister.CssClass = "tab-link";
            lblTitle.Text = "Đăng Nhập";
        }

        protected void SwitchToRegister(object sender, EventArgs e)
        {
            pnlLogin.Visible = false;
            pnlRegister.Visible = true;
            btnSwitchLogin.CssClass = "tab-link";
            btnSwitchRegister.CssClass = "tab-link active";
            lblTitle.Text = "Đăng Ký";
        }
    }
}