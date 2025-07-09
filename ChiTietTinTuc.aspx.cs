using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        protected string ids;
        protected void Page_Load(object sender, EventArgs e)
        {
            ids = Request.QueryString["id"];
        }
    }
}