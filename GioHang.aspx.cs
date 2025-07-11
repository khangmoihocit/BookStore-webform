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
                LoadGioHang();
            }
        }

        private void LoadGioHang()
        {
            List<Sach> gioHang = Session["GioHang"] as List<Sach>;
            if (gioHang != null && gioHang.Count > 0)
            {
                lblMessage.Visible = false;
                divPayment.Visible = true;
                rptGioHang.DataSource = gioHang;
                rptGioHang.DataBind();
            }
            else
            {
                lblMessage.Text = "Không có sản phẩm nào trong giỏ hàng";
                lblMessage.Visible = true;
                divPayment.Visible = false; // Ẩn khu vực thanh toán
                rptGioHang.DataSource = null;
                rptGioHang.DataBind();
            }
            // Sau khi tải giỏ hàng, tính lại tổng tiền
            CalculateTotal();
        }


        // Hàm trung tâm để cập nhật số lượng và tính tổng tiền
        private void CalculateTotal()
        {
            List<Sach> gioHang = Session["GioHang"] as List<Sach>;
            if (gioHang == null) return;

            decimal tongTienDaChon = 0;

            foreach (RepeaterItem item in rptGioHang.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chkChon = (CheckBox)item.FindControl("chkChonSanPham");
                    TextBox txtSoLuong = (TextBox)item.FindControl("txtSoLuong");
                    int maSach = int.Parse(((LinkButton)item.FindControl("LinkButton1")).CommandArgument);

                    int soLuong;
                    if (!int.TryParse(txtSoLuong.Text, out soLuong) || soLuong < 1)
                    {
                        soLuong = 1;
                        txtSoLuong.Text = "1";
                    }

                    // Cập nhật số lượng trong Session
                    Sach sanPhamTrongSession = gioHang.FirstOrDefault(s => s.MaSach == maSach);
                    if (sanPhamTrongSession != null)
                    {
                        sanPhamTrongSession.SoLuong = soLuong;
                    }

                    // Nếu được chọn thì cộng vào tổng tiền
                    if (chkChon != null && chkChon.Checked)
                    {
                        if (sanPhamTrongSession != null)
                        {
                            tongTienDaChon += (decimal)sanPhamTrongSession.GiaBanMoi * soLuong;
                        }
                    }
                }
            }

            Session["GioHang"] = gioHang; // Lưu lại giỏ hàng đã cập nhật số lượng

            lblTotalAmount.Text = tongTienDaChon.ToString("N0") + "đ";
            btnThanhToan.Enabled = tongTienDaChon > 0;
        }

        protected void rptGioHang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Xoa")
                {
                    List<Sach> gioHang = (List<Sach>)Session["GioHang"];
                    int maSach = int.Parse(e.CommandArgument.ToString());
                    Console.WriteLine(gioHang.Count);
                    for(int i = 0; i<gioHang.Count; i++)
                    {
                        if (gioHang[i].MaSach == maSach)
                        {
                            gioHang.RemoveAt(i);
                            Session["GioHang"] = gioHang;
                            LoadGioHang();
                            return;
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)rptGioHang.Controls[0].FindControl("chkSelectAll");
            foreach (RepeaterItem item in rptGioHang.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chkChonSanPham");
                    chk.Checked = chkAll.Checked;
                }
            }
            CalculateTotal();
        }

        protected void chkChonSanPham_CheckedChanged(object sender, EventArgs e)
        {
            CalculateTotal();
        }

        protected void txtSoLuong_TextChanged(object sender, EventArgs e)
        {
            CalculateTotal();
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            List<Sach> gioHang = Session["GioHang"] as List<Sach>;
            List<Sach> sanPhamDaChon = new List<Sach>();

            foreach (RepeaterItem item in rptGioHang.Items)
            {
                CheckBox chkChon = (CheckBox)item.FindControl("chkChonSanPham");
                if (chkChon != null && chkChon.Checked)
                {
                    int maSach = int.Parse(((LinkButton)item.FindControl("LinkButton1")).CommandArgument);
                    Sach sp = gioHang.FirstOrDefault(s => s.MaSach == maSach);
                    if (sp != null)
                    {
                        sanPhamDaChon.Add(sp);
                    }
                }
            }

            if (sanPhamDaChon.Any())
            {
                Session["DonHang"] = sanPhamDaChon; // Lưu các sản phẩm được chọn vào Session mới
                Response.Redirect("ThanhToan.aspx");
            }
            else
            {
                lblMessage.Text = "Bạn chưa chọn sản phẩm nào để thanh toán.";
                lblMessage.Visible = true;
            }
        }

    }
}