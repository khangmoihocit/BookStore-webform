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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // TODO: Xác thực tài khoản
            if (email == "admin@gmail.com" && password == "admin")
            {
                Response.Redirect("Admin/QuanLySach.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string ho = txtLastName.Text;
            string ten = txtFirstName.Text;
            string sdt = txtPhone.Text;
            string email = txtEmailRegister.Text;
            string matkhau = txtPasswordRegister.Text;

            // TODO: Lưu thông tin vào CSDL
            Response.Write("<script>alert('Tạo tài khoản thành công!');</script>");
        }

        protected void SwitchToLogin(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;
            pnlRegister.Visible = false;
            btnSwitchLogin.CssClass = "tab-link active";
            btnSwitchRegister.CssClass = "tab-link";
        }

        protected void SwitchToRegister(object sender, EventArgs e)
        {
            pnlLogin.Visible = false;
            pnlRegister.Visible = true;
            btnSwitchLogin.CssClass = "tab-link";
            btnSwitchRegister.CssClass = "tab-link active";
        }
    }
}