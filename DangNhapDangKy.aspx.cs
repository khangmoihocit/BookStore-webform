using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
            loiSDT.Visible = false;
            Loiemail.Visible = false;
            loimatkhau.Visible = false;
        }
        protected bool kiemtradangnhap()
        {
            lblMessage.Visible = false;
            lblMessage2.Visible = false;
            mess3.Visible = false;

            bool isValid = true;
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"))
            {
                lblMessage.Text = "Email không đúng định dạng.";
                lblMessage.Visible = true;
                isValid = false;
            }
            if (!Regex.IsMatch(password, @"^\S{8,}$"))
            {
                lblMessage2.Text = "Mật khẩu phải có ít nhất 8 ký tự.";
                lblMessage2.Visible = true;
                isValid = false;
            }

            return isValid;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (kiemtradangnhap())
            {
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
                            if (Session["DonHang"] != null)
                            {
                                List<Sach> donHang = (List<Sach>)Session["DonHang"];
                                if (donHang.Count > 0)
                                {
                                    Response.Redirect("ThanhToan.aspx");
                                }
                            }
                            else
                            {
                                Response.Redirect("TrangChu.aspx");
                            }
                        }
                    }
                    else
                    {
                        mess3.Text = "Đăng nhập thất bại, kiểm tra lại thông tin.";
                        mess3.Visible = true;
                    }
                }
                catch (AppException ex)
                {
                    mess3.Text = ex.Message;
                    mess3.Visible = true;
                }
                catch (Exception ex)
                {
                    mess3.Text = "Lỗi: " + ex.Message;
                    mess3.Visible = true;
                    return;
                }
            }
        }

        private bool isValid()
        {
            loiSDT.Visible = false;
            Loiemail.Visible = false;
            loimatkhau.Visible = false;
            bool isValid = false;
            if (string.IsNullOrEmpty(txtEmailRegister.Text) || string.IsNullOrEmpty(txtPasswordRegister.Text) ||
                string.IsNullOrEmpty(txtFirstName.Text) || string.IsNullOrEmpty(txtLastName.Text)
                || string.IsNullOrEmpty(txtPhone.Text))
            {
                mess4.Text = "Vui lòng nhập đầy đủ thông tin.";
                mess4.Visible = true;
                isValid = true;
            }
            if (!Regex.IsMatch(txtEmailRegister.Text.Trim(), "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"))
            {
                Loiemail.Text = "Email không đúng định dạng ";
                Loiemail.Visible = true;
                isValid = true;

            }
            if (!Regex.IsMatch(txtPasswordRegister.Text.Trim(), @"^\S{8,}$"))
            {
                loimatkhau.Text = "Mật khẩu không được nhỏ hơn 8 kí tự và không có khoảng trắng ";
                loimatkhau.Visible = true;
                isValid = true;
            }
            if (!Regex.IsMatch(txtPhone.Text.Trim(), @"^0[0-9]{9}$"))
            {
                loiSDT.Text = "Số điện thoại không hợp lệ";
                loiSDT.Visible = true;
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
            if (isValid())
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
                Label123.Text = "Đăng ký thành công!";
                Label123.Visible = true;

                SwitchToLogin(sender, e);
            }
            catch (AppException ex)
            {
                mess4.Text = "Email đã tồn tại";
                mess4.Visible = true;
            }
            catch (Exception ex)
            {
                mess4.Text = ex.Message;
                mess4.Visible = true;
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