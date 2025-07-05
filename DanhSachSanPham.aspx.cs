using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class DanhSachSanPham : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        private TheLoaiDAL theLoaiDAL;
        private NhaXuatBanDAL nhaXuatBanDAL;
        public DanhSachSanPham()
        {
            sachDAL = new SachDAL();
            theLoaiDAL = new TheLoaiDAL();
            nhaXuatBanDAL = new NhaXuatBanDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadData();
            }
        }

        private void loadData()
        {
            try
            {
                List<Sach> listSach = sachDAL.getAll();
                if(listSach.Count > 0)
                {
                    rptSach.DataSource = listSach;
                    rptSach.DataBind();
                }
                else
                {
                    Response.Write("Không có sản phẩm nào.");
                }
                // Load thể loại
                cblTheLoai.DataSource = theLoaiDAL.getAll();
                cblTheLoai.DataTextField = "TenTheLoai";
                cblTheLoai.DataValueField = "MaTheLoai";
                cblTheLoai.DataBind();

                // Load nhà xuất bản
                cblNhaXuatBan.DataSource = nhaXuatBanDAL.getAll();
                cblNhaXuatBan.DataTextField = "TenNhaXuatBan";
                cblNhaXuatBan.DataValueField = "MaNhaXuatBan";
                cblNhaXuatBan.DataBind();

            }
            catch (AppException ex)
            {
                Response.Write("Lỗi khi tải dữ liệu: " + ex.Message);
            }
        }
    }
}