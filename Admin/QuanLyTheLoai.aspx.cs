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
            // Kiểm tra quyền truy cập của người dùng
            if (Session["User"] != null)
            {
                NguoiDung nguoiDung = Session["User"] as NguoiDung;
                if (nguoiDung.Quyen.Equals("ADMIN"))
                {

                }
                else
                {
                    Response.Redirect("~/DangNhapDangKy.aspx");
                }
            }
            else
            {
                Response.Redirect("~/DangNhapDangKy.aspx");

            }
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
            lblMessage.Visible = false;
            GridViewRow gvr = gvTheLoai.SelectedRow;
            if (gvr != null)
            {
                txtMaTheLoai.Text = gvr.Cells[1].Text;
                txtTenTheLoai.Text =  Server.HtmlDecode(gvr.Cells[2].Text);
            }
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            TheLoai newTheLoai = new TheLoai();
            if (string.IsNullOrEmpty(txtTenTheLoai.Text))
            {
                lblMessage.Text = "Tên thể loại không được để trống.";
                lblMessage.Visible = true;
                return;
            }
            newTheLoai.TenTheLoai = txtTenTheLoai.Text.Trim();
            theLoaiDAL.add(newTheLoai);
            LoadData();
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtTenTheLoai.Text))
                {
                    lblMessage.Text = "Tên thể loại không được để trống.";
                    lblMessage.Visible = true;
                    return;
                }

                TheLoai updatedTheLoai = new TheLoai();
                updatedTheLoai.MaTheLoai = Convert.ToInt32(txtMaTheLoai.Text.Trim());
                updatedTheLoai.TenTheLoai = txtTenTheLoai.Text.Trim();

                theLoaiDAL.update(updatedTheLoai);
                lblMessage.Text = "Cập nhật thể loại thành công.";
                lblMessage.Visible = true;
                clearInput();
                LoadData();
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

        private void clearInput()
        {
            txtMaTheLoai.Text = string.Empty;
            txtTenTheLoai.Text = string.Empty;
            lblMessage.Visible = false;
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {

            try
            {
                if (string.IsNullOrEmpty(txtMaTheLoai.Text))
                {
                    lblMessage.Text = "Vui lòng chọn thể loại muốn xóa.";
                    lblMessage.Visible = true;
                    return;
                }

                theLoaiDAL.deleteById(Convert.ToInt32(txtMaTheLoai.Text));
                LoadData();
                clearInput();
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
}