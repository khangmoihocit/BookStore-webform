using btl_laptrinhweb.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb.Admin
{
    public partial class QuanLyNhaXuatBan : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
        }
        private void loadData()
        {
            using (SqlConnection conn = Connection.GetSqlConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblNhaxuatban", conn))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        gvNhaXuatBan.DataSource = dt;
                        gvNhaXuatBan.DataBind();
                    }
                }
            }
        }
        protected void gvNhaXuatBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvNhaXuatBan.SelectedRow;
            if (row != null) { }
            txtMaNXB.Text = row.Cells[1].Text;
            txtTenNXB.Text = HttpUtility.HtmlDecode(row.Cells[2].Text);
            txtDiaChi.Text = HttpUtility.UrlDecode(row.Cells[3].Text.Trim());
            txtSoDienThoai.Text = HttpUtility.UrlDecode(row.Cells[4].Text);
        }
        protected void btnThemOnClick(object sender, EventArgs e)
        {
            using (SqlConnection conn = Connection.GetSqlConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO tblNhaxuatban  " +
                        "VALUES (@sTennxb, @sDiachi, @sSodienthoai)";
                    cmd.Parameters.AddWithValue("@sTennxb", txtTenNXB.Text);
                    cmd.Parameters.AddWithValue("@sDiachi", txtDiaChi.Text);
                    cmd.Parameters.AddWithValue("@sSodienthoai", txtSoDienThoai.Text);
                    cmd.ExecuteNonQuery();
                    loadData();

                }
            }
        }
        protected void btnXoaClick(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = Connection.GetSqlConnection())
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = "Delete tblNhaxuatban where PK_iNhaxuatbanID = @id";
                        cmd.Parameters.AddWithValue("@id", txtMaNXB.Text.Trim());
                        cmd.ExecuteNonQuery();
                        loadData();
                        txtMaNXB.Text = txtDiaChi.Text = txtTenNXB.Text = txtSoDienThoai.Text = "";

                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.Visible = true;
            }
            }
        protected void btnCapNhatClick(object sender, EventArgs e)
        {
            using (SqlConnection conn = Connection.GetSqlConnection())
            {
                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = "update tblNhaxuatban set sTennxb = @sTennxb , sDiachi =@sDiachi , sSodienthoai =@sSodienthoai where PK_iNhaxuatbanID =@id";
                    cmd.Parameters.AddWithValue("@sTennxb", txtTenNXB.Text);
                    cmd.Parameters.AddWithValue("@sDiachi", txtDiaChi.Text);
                    cmd.Parameters.AddWithValue("@sSodienthoai", txtSoDienThoai.Text);
                    cmd.Parameters.AddWithValue("@id", txtMaNXB.Text.Trim());
                    cmd.ExecuteNonQuery();
                    loadData();


                }
            }
        }

    }
}