using System;
using System.Collections.Generic;
using System.Linq;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        public ChiTietSanPham()
        {
            sachDAL = new SachDAL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        private void loadData()
        {
            try
            {
                string maSach = Request.QueryString["MaSach"];
                if (maSach != null)
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(maSach));

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('lỗi: " + ex.Message + "');</script>");
            }
        }
    }
}
