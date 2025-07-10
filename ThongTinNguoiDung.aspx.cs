using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class ThongTinNguoiDung : System.Web.UI.Page
    {
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
                    txtQuyen.Text = user.Quyen;
                    txtNgayDangKy.Text = user.NgayDangKy.ToString("yyyy-MM-dd");
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

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("DangNhapDangKy.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            if(Session["User"] != null)
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
    }
}