using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["GioHang"] == null)
                {
                    lblMessage.Text = "Không có sản phẩm nào trong giỏ hàng";
                    lblMessage.Visible = true;
                }
                else
                {
                    lblMessage.Visible = false;
                    List<Sach> gioHang = (List<Sach>)Session["GioHang"];
                    rptGioHang.DataSource = gioHang;
                    rptGioHang.DataBind();
                }
            }
        }

        protected void rptGioHang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}