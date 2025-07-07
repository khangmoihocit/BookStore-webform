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
    public partial class QuanLySach : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        private TheLoaiDAL theLoaiDAL;
        private NhaXuatBanDAL nhaXuatBanDAL;
        private TacGiaDAL tacGiaDAL;
        public QuanLySach()
        {
            sachDAL = new SachDAL();
            theLoaiDAL = new TheLoaiDAL();
            nhaXuatBanDAL = new NhaXuatBanDAL();
            tacGiaDAL = new TacGiaDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }

        private void loadData()
        {
            try
            {
                lblMessage.Visible = false;
                List<Sach> listSach = sachDAL.getAll();
                List<TheLoai> listTheLoai = theLoaiDAL.getAll();
                List<NhaXuatBan> listNhaXuatBan = nhaXuatBanDAL.getAll();
                List<TacGia> listTacGia = tacGiaDAL.getAll();

                ddlTheLoai.DataSource = listTheLoai;
                ddlTheLoai.DataTextField = "TenTheLoai";
                ddlTheLoai.DataValueField = "MaTheLoai";
                ddlTheLoai.DataBind();

                ddlNhaXuatBan.DataSource = listNhaXuatBan;
                ddlNhaXuatBan.DataTextField = "TenNhaXuatBan";
                ddlNhaXuatBan.DataValueField = "MaNhaXuatBan";
                ddlNhaXuatBan.DataBind();


                ddlTacGia.DataSource = listTacGia;
                ddlTacGia.DataTextField = "TenTacGia";
                ddlTacGia.DataValueField = "MaTacGia";
                ddlTacGia.DataBind();

                gvSach.DataSource = listSach;
                gvSach.DataBind();
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi tải dữ liệu: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void gvSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Visible = false;
                GridViewRow row = gvSach.SelectedRow;
                if (row != null)
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(row.Cells[1].Text));
                    if (sach != null)
                    {
                        txtMaSach.Text = Server.HtmlDecode(sach.MaSach.ToString());
                        txtTenSach.Text = Server.HtmlDecode(sach.TenSach);
                        txtMoTa.Text = Server.HtmlDecode(sach.MoTa);
                        imgPreview.ImageUrl = Server.HtmlDecode(sach.URLAnh);
                        txtGiaBanMoi.Text = sach.GiaBanMoi.ToString();
                        txtGiaBanCu.Text = sach.GiaBanCu.ToString();
                        txtSoLuong.Text = sach.SoLuong.ToString();
                        ddlTheLoai.SelectedValue = sach.MaTheLoai.ToString();
                        ddlTacGia.SelectedValue = sach.MaTacGia.ToString();
                        ddlNhaXuatBan.SelectedValue = sach.MaNhaXuatBan.ToString();
                    }

                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi chọn sách: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch(FormatException ex)
            {
                lblMessage.Text = "lỗi khi chuyển đổi kiểu dữ liệu: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi chọn sách: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void ddlTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}