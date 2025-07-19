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
    public partial class QuanLyDatHang : System.Web.UI.Page
    {
        private DatHangDAL datHangDAL = new DatHangDAL();
        private ChiTietDatHangDAL chiTietDatHangDAL = new ChiTietDatHangDAL();

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
                string tenSach = txtTenSach.Text.Trim();
                DateTime? tuNgay = null;
                if (!string.IsNullOrEmpty(txtTuNgay.Text))
                {
                    tuNgay = DateTime.Parse(txtTuNgay.Text);
                }

                DateTime? denNgay = null;
                if (!string.IsNullOrEmpty(txtDenNgay.Text))
                {
                    denNgay = DateTime.Parse(txtDenNgay.Text);
                }

               
                List<DonHangView> donHangs = datHangDAL.FilterDonHang(tenSach, tuNgay, denNgay);

                gvDonHang.DataSource = donHangs;
                gvDonHang.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi tải dữ liệu đơn hàng: " + ex.Message;
            }
        }

        protected void btnLoc_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnHuyLoc_Click(object sender, EventArgs e)
        {
            txtTenSach.Text = "";
            txtTuNgay.Text = "";
            txtDenNgay.Text = "";
            loadData();
        }

        //Xảy ra sau khi mỗi dòng được gán dữ liệu
        protected void gvDonHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Tìm DropDownList trong dòng
                DropDownList ddlTrangThai = (DropDownList)e.Row.FindControl("ddlTrangThai");
                if (ddlTrangThai != null)
                {
                    // Lấy trạng thái từ đối tượng dữ liệu và gán cho DropDownList
                    string trangThai = DataBinder.Eval(e.Row.DataItem, "TrangThai").ToString().Trim();
                    if (ddlTrangThai.Items.FindByValue(trangThai) != null)
                    {
                        ddlTrangThai.SelectedValue = trangThai;
                    }
                }
            }
        }

        // Khi thay đổi trạng thái trong DropDownList
        protected void ddlTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList ddl = (DropDownList)sender;
                GridViewRow row = (GridViewRow)ddl.NamingContainer; // Lấy dòng chứa DropDownList

                // Lấy MaChiTietDatHang từ DataKey của dòng
                int maChiTietDatHang = Convert.ToInt32(gvDonHang.DataKeys[row.RowIndex].Value);
                string trangThaiMoi = ddl.SelectedValue;

                // Gọi DAL để cập nhật trạng thái trong database
                bool success = chiTietDatHangDAL.UpdateTrangThai(maChiTietDatHang, trangThaiMoi);

                if (success)
                {
                    lblMessage.Text = "Cập nhật trạng thái thành công!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Cập nhật trạng thái thất bại.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi khi cập nhật trạng thái: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}
