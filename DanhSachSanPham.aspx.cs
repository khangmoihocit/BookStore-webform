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

                    //tích lại bộ lọc
                    if (Session["listTheLoaiID"] != null)
                    {
                        List<int> listTheLoaiID = (List<int>)Session["listTheLoaiID"];
                        foreach (ListItem item in cblTheLoai.Items)
                        {
                            if (listTheLoaiID.Contains(int.Parse(item.Value)))
                            {
                                item.Selected = true;
                            }
                        }
                    }

                    if (Session["listNhaXuatBanID"] != null)
                    {
                        List<int> listNhaXuatBanID = (List<int>)Session["listNhaXuatBanID"];
                        foreach (ListItem item in cblNhaXuatBan.Items)
                        {
                            if (listNhaXuatBanID.Contains(int.Parse(item.Value)))
                            {
                                item.Selected = true;
                            }
                        }
                    }

                    if (Session["sortID"] != null)
                    {
                        string sortID = Session["sortID"].ToString();
                        foreach (ListItem item in rblSapXep.Items)
                        {
                            if (sortID == item.Value)
                            {
                                item.Selected = true;
                            }
                        }
                    }

                    loadData();
                }
                catch (AppException ex)
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
            try
            {
                string stringTheLoaiIDs = null;
                string stringNhaXuatBanIDs = null;
                string sorts = null;
                if (Session["listTheLoaiID"] != null)
                {
                    List<int> listTheLoaiID = (List<int>)Session["listTheLoaiID"];
                    if (listTheLoaiID.Count > 0)
                        stringTheLoaiIDs = string.Join(",", listTheLoaiID);
                }

                if (Session["listNhaXuatBanID"] != null)
                {
                    List<int> listNhaXuatBanID = (List<int>)Session["listNhaXuatBanID"];
                    if (listNhaXuatBanID.Count > 0)

                        stringNhaXuatBanIDs = string.Join(",", listNhaXuatBanID);
                }

                if (Session["sortID"] != null)
                {
                    string sortID = Session["sortID"].ToString();
                    sorts = sortID;
                }

                int currentPage = 1;
             
                // Nếu có hidden field và giá trị là "true", reset currentPage về 1
                if (HiddenField1.Value == "true")
                {
                    currentPage = 1;
                    HiddenField1.Value = "false";
                }
                else
                {
                    if (Request.QueryString["page"] != null)
                    {
                        currentPage = int.Parse(Request.QueryString["page"]);
                        if (currentPage < 1) currentPage = 1;
                    }
                }

                int tongsobanghi;
                List<Sach> listSach = sachDAL.filterSach(stringTheLoaiIDs, stringNhaXuatBanIDs, sorts, currentPage, pageSize, out tongsobanghi);
                Console.WriteLine(listSach);
                if (listSach.Count > 0)
                {
                    rptSach.DataSource = listSach;
                    rptSach.DataBind();
                    renderPageNumber(tongsobanghi, currentPage);
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Không có sản phẩm nào phù hợp với thông tin tìm kiếm của bạn.";
                    rptSach.DataSource = null;
                    rptSach.DataBind();
                    rptPage.DataSource = null;
                    rptPage.DataBind();
                }
            }
            catch (AppException ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Lỗi khi tải dữ liệu: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Lỗi loaddata: " + ex.Message;
            }
        }

        private void renderPageNumber(int tongsobanghi, int currentPage)
        {
            double totalPage = Math.Ceiling((double)tongsobanghi / pageSize);
            List<Object> pageLinks = new List<Object>();
            // Thêm các link số trang
            for (int i = 1; i <= totalPage; i++)
            {
                pageLinks.Add(new
                {
                    Text = i.ToString(),
                    Value = i,
                    CssClass = (i == currentPage) ? "pagination-item-active" : ""
                });
            }
            rptPage.DataSource = pageLinks;
            rptPage.DataBind();
        }

        protected void cblTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = "true";
            //lấy id thể loại đang được chọn
            List<int> listTheLoaiID = new List<int>();

            foreach (ListItem item in cblTheLoai.Items)
            {
                if (item.Selected)
                {
                    listTheLoaiID.Add(int.Parse(item.Value));
                }
            }
            Session["listTheLoaiID"] = listTheLoaiID;
            loadData();
        }

        protected void cblNhaXuatBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = "true";
            //lấy id nhà xuất bản đang được chọn
            List<int> listNhaXuaBanIDs = new List<int>();
            foreach (ListItem item in cblNhaXuatBan.Items)
            {
                if (item.Selected)
                {
                    listNhaXuaBanIDs.Add(int.Parse(item.Value));
                }
            }

            Session["listNhaXuatBanID"] = listNhaXuaBanIDs;

            loadData();
        }

        protected void rblSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = "true";
            //lấy value sắp xếp đang được chọn (value = ASC hoặc DESC)
            if (rblSapXep.SelectedIndex != -1)
            {
                Session["sortID"] = rblSapXep.SelectedValue;
            }
            loadData();
        }

        protected void rptSach_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMessage.Visible = false;
            if (e.CommandName == "ThemGioHang")
            {
                int maSach = int.Parse(e.CommandArgument.ToString());
                Sach sach = sachDAL.getByMaSach(maSach);
                if (sach != null)
                {
                    List<Sach> gioHang = Session["GioHang"] as List<Sach>;
                    if (gioHang == null)
                    {
                        gioHang = new List<Sach>();
                    }

                    Sach sachExisted = gioHang.Find(item => item.MaSach == sach.MaSach);
                    if (sachExisted != null)
                    {
                        sachExisted.SoLuong++;
                    }
                    else
                    {
                        sach.SoLuong = 1;
                        gioHang.Add(sach);
                    }
                    Session["GioHang"] = gioHang;
                }
                else
                {
                    lblMessage.Text = "Sản phẩm không tồn tại.";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}