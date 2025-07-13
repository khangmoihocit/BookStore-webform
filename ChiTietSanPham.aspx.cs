using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class ChiTietSanPham1 : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        private TacGiaDAL tacGiaDAL;
        public ChiTietSanPham1()
        {
            sachDAL = new SachDAL();
            tacGiaDAL = new TacGiaDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }

        public void loadData()
        {
            lblMessage.Visible = false;
            lbltext.Visible = false;
            string maSach = Request.QueryString["MaSach"];
            if (maSach != null && maSach != "")
            {
                try
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(maSach));
                    lblHeader.Text = sach.TenSach;
                    lblTenSanPham.Text = sach.TenSach;
                    lblGiaBanMoi.Text = sach.GiaBanMoi.ToString() + "đ";
                    lblGiaBanCu.Text = sach.GiaBanCu.ToString() + "đ";
                    lblTenTacGia.Text = tacGiaDAL.getByMaTacGia(sach.MaTacGia).TenTacGia;
                    lblThongTinChiTiet.Text = sach.MoTa;
                    img.ImageUrl = sach.URLAnh;
                    if (sach.SoLuong > 1)
                    {
                        lblTinhTrang.Text = "Còn hàng";
                    }
                    else
                    {
                        lblTinhTrang.Text = "Hết hàng";
                        lblTinhTrang.ForeColor = Color.Red;
                    }

                    //loại bỏ sách đang hiện
                    List<Sach> listSach = sachDAL.getByTheLoai(sach.MaTheLoai);
                    var dataSach = listSach.Where(item => item.MaSach != sach.MaSach).ToList();
                    if (dataSach.Count < 1)
                    {
                        lbltext.Text = "Không có sách liên quan";
                        lbltext.ForeColor = Color.Red;
                        lbltext.Visible = true;
                    }
                    else
                    {
                        rptSach.DataSource = dataSach;
                        rptSach.DataBind();
                    }
                }
                catch (AppException ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Lỗi mã sách không tìm thấy";
                lblMessage.Visible = true;
            }
        }

        protected void btnThemGioHang2_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            string maSach = Request.QueryString["MaSach"];
            if (!string.IsNullOrEmpty(maSach))
            {
                List<Sach> gioHang = Session["GioHang"] as List<Sach>;
                if (gioHang == null)
                {
                    gioHang = new List<Sach>();
                }
                try
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(maSach));
                    Sach sachExits = gioHang.Find(item => item.MaSach == sach.MaSach);
                    if ((sachExits != null))
                    {
                        sachExits.SoLuong += int.Parse(txtSoLuong.Text);
                    }
                    else
                    {
                        sach.SoLuong = int.Parse(txtSoLuong.Text);
                        gioHang.Add(sach);
                    }
                    Session["GioHang"] = gioHang;
                }
                catch (AppException ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnMuaNgay_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            Session["DonHang"] = null; // Xóa giỏ hàng cũ nếu có
            string maSach = Request.QueryString["MaSach"];
            if (maSach != null)
            {
                try
                {
                    Sach sach = sachDAL.getByMaSach(int.Parse(maSach));
                    if(sach.SoLuong < int.Parse(txtSoLuong.Text))
                    {
                        lblMessage.Text = "Số lượng đặt hàng vượt quá số lượng có sẵn";
                        lblMessage.Visible = true;
                        return;
                    }
                    sach.SoLuong = int.Parse(txtSoLuong.Text);
                    List<Sach> donHang = new List<Sach>();
                    donHang.Add(sach);
                    Session["DonHang"] = donHang;
                    if (Session["User"] == null)
                    {
                        Response.Redirect("DangNhapDangKy.aspx");
                    }
                    else
                    {
                        Response.Redirect("ThanhToan.aspx");
                    }
                }
                catch (AppException ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Lỗi mã sách không tìm thấy";
                lblMessage.Visible = true;
            }
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