using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb.Admin
{
    public partial class QuanLyTacGia : System.Web.UI.Page
    {
        private TacGiaDAL tacGiaDAL;

        public QuanLyTacGia()
        {
            tacGiaDAL = new TacGiaDAL();
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

                loadData();
            }
        }

        private void loadData()
        {
            List<TacGia> listTacGia = new List<TacGia>();
            try
            {
                listTacGia = tacGiaDAL.getAll();
                if (listTacGia.Count > 0)
                {
                    gvTacGia.DataSource = listTacGia;
                    gvTacGia.DataBind();
                }
                else
                {
                    gvTacGia.DataSource = null;
                    gvTacGia.DataBind();
                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi không xác định: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkInput()) { return; }
                TacGia tacGia = new TacGia();
                tacGia.TenTacGia = txtTenTacGia.Text.Trim();
                tacGia.NgaySinh = DateTime.Parse(txtNgaySinh.Text.Trim());
                Console.WriteLine(tacGia);
                tacGiaDAL.add(tacGia);
                lblMessage.Text = "Thêm tác giả thành công!";
                lblMessage.Visible = true;
                loadData();
                lamMoi();
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi thêm tác giả: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi không xác định: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        private void lamMoi()
        {
            txtMaTacGia.Text = string.Empty;
            txtTenTacGia.Text = string.Empty;
            txtNgaySinh.Text = string.Empty;
            lblMessage.Visible = false;
        }

        private bool checkInput()
        {
            if (string.IsNullOrEmpty(txtTenTacGia.Text.Trim()))
            {
                lblMessage.Text = "Tên tác giả không được để trống.";
                lblMessage.Visible = true;
                return false;
            }
            if (string.IsNullOrEmpty(txtNgaySinh.Text.Trim()))
            {
                lblMessage.Text = "Ngày sinh không được để trống.";
                lblMessage.Visible = true;
                return false;
            }
            DateTime ngaySinh;
            if (!DateTime.TryParse(txtNgaySinh.Text.Trim(), out ngaySinh))
            {
                lblMessage.Text = "Ngày sinh không hợp lệ.";
                lblMessage.Visible = true;
                return false;
            }
            return true;
        }

        protected void gvTacGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Visible = false;
                GridViewRow row = gvTacGia.SelectedRow;
                if (row != null)
                {
                    int id = int.Parse(row.Cells[1].Text);
                    TacGia tacGia = tacGiaDAL.getByMaTacGia(id);
                    txtMaTacGia.Text = tacGia.MaTacGia.ToString();
                    txtTenTacGia.Text = tacGia.TenTacGia;
                    txtNgaySinh.Text = tacGia.NgaySinh.ToString("yyyy-MM-dd");
                }
            }catch(AppException ex)
            {
                lblMessage.Text = "Lỗi khi lấy thông tin tác giả: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi không xác định: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Visible = false;
                if (!checkInput()) { return; }
                GridViewRow row = gvTacGia.SelectedRow;
                if (row != null)
                {
                    TacGia tacGia = new TacGia();
                    tacGia.MaTacGia = int.Parse(txtMaTacGia.Text);
                    tacGia.TenTacGia = txtTenTacGia.Text.Trim();
                    tacGia.NgaySinh = DateTime.Parse(txtNgaySinh.Text.Trim());
                    tacGiaDAL.update(tacGia);
                    lblMessage.Text = "Cập nhật tác giả thành công!";
                    lblMessage.Visible = true;
                    loadData();
                    lamMoi();
                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi cập nhật tác giả: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi không xác định: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Visible = false;
                GridViewRow row = gvTacGia.SelectedRow;
                if (row != null)
                {
                    int maTacGia = int.Parse(row.Cells[1].Text);
                    tacGiaDAL.delete(maTacGia);
                    lblMessage.Text = "Xóa tác giả thành công!";
                    lblMessage.Visible = true;
                    loadData();
                    lamMoi();
                }
            }
            catch (AppException ex)
            {
                lblMessage.Text = "Lỗi khi xóa tác giả: " + ex.Message;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi không xác định: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            lamMoi();
        }
    }
}