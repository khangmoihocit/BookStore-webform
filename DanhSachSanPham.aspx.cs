using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Text;
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
        private int pageSize = 9;
        public DanhSachSanPham()
        {
            sachDAL = new SachDAL();
            theLoaiDAL = new TheLoaiDAL();
            nhaXuatBanDAL = new NhaXuatBanDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
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

                    loadData();
                }
                catch(AppException ex)
                {
                    Response.Write("Lỗi khi tải dữ liệu: " + ex.Message);
                }
                catch (Exception ex)
                {
                    Response.Write("Lỗi: " + ex.Message);
                }
            }
        }

        private void loadData()
        {
            //lấy id thể loại đang được chọn
            List<int> listTheLoaiID = new List<int>();
            string stringTheLoaiID = null;

            foreach (ListItem item in cblTheLoai.Items)
            {
                if (item.Selected)
                {
                    listTheLoaiID.Add(int.Parse(item.Value));
                }
            }
            if(listTheLoaiID.Count > 0)
            {
                stringTheLoaiID = string.Join(",", listTheLoaiID);
            }

            //lấy id nhà xuất bản đang được chọn
            List<int> listNhaXuaBanIDs = new List<int>();
            string stringNhaXuaBanIDs = null;
            foreach (ListItem item in cblNhaXuatBan.Items)
            {
                if (item.Selected)
                {
                    listNhaXuaBanIDs.Add(int.Parse(item.Value));
                }
            }
            if(listNhaXuaBanIDs.Count > 0)
            {
                stringNhaXuaBanIDs = string.Join(",", listNhaXuaBanIDs);
            }

            //lấy value sắp xếp đang được chọn (value = ASC hoặc DESC)
            string sort = null;
            if(rblSapXep.SelectedIndex != -1)
            {
                sort = rblSapXep.SelectedValue;
            }

            try
            {
                int currentPage = 1;
                if (Request.QueryString["page"] != null)
                {
                    currentPage = int.Parse(Request.QueryString["page"]);
                    if (currentPage < 1) currentPage = 1;
                }

                int tongsobanghi;
                List<Sach> listSach = sachDAL.filterSach(stringTheLoaiID, stringNhaXuaBanIDs, sort, currentPage, pageSize, out tongsobanghi);
                Console.WriteLine(listSach);
                if (listSach.Count > 0)
                {
                    rptSach.DataSource = listSach;
                    rptSach.DataBind();
                    renderPageNumber(tongsobanghi, currentPage);
                }
                else
                {
                    Response.Write( "Không có sản phẩm nào.");
                }


            }
            catch (AppException ex)
            {
                Response.Write("Lỗi khi tải dữ liệu: " + ex.Message);
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi loaddata: " + ex.Message);
            }
        }

        private void renderPageNumber(int tongsobanghi, int currentPage)
        {
            double totalPage = Math.Ceiling((double)tongsobanghi / pageSize);
            List<Object> pageLinks = new List<Object>();
            // Thêm các link số trang
            for (int i = 1; i <= totalPage; i++)
            {
                pageLinks.Add(new { 
                    Text = i.ToString(), 
                    Value = i ,
                    CssClass = (i == currentPage) ? "pagination-item-active" : ""
                });
            }
            rptPage.DataSource = pageLinks;
            rptPage.DataBind();
        }

        protected void cblTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadData();
        }

        protected void cblNhaXuatBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadData();
        }

        protected void rblSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadData();
        }
    }
}