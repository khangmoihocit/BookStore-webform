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
                }
            }
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Session.Remove("User");
            }
            Response.Redirect("DangNhapDangKy.aspx");
        }
    }
}