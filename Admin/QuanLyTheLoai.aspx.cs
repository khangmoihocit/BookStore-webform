using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.Admin
{
    public partial class QuanLyTheLoai : System.Web.UI.Page
    {
        private TheLoaiDAL theLoaiDAL;

        public QuanLyTheLoai()
        {
            theLoaiDAL = new TheLoaiDAL();
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
            List<TheLoai> theLoai = theLoaiDAL.getAll();
            if (theLoai != null && theLoai.Count > 0)
            {
                gvTheLoai.DataSource = theLoai;
                gvTheLoai.DataBind();
            }
            else
            {
                gvTheLoai.DataSource = null;
                gvTheLoai.DataBind();
            }
        }

        protected void gvTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = gvTheLoai.SelectedRow;
            if (gvr != null)
            {
                txtMaTheLoai.Text = gvr.Cells[1].Text;
                txtTenTheLoai.Text = gvr.Cells[2].Text;
            }
        }
    }
}