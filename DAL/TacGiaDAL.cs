using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class TacGiaDAL
    {
        public TacGiaDAL()
        {
        }
        
        public List<TacGia> command(string query)
        {
            List<TacGia> listTacGia = new List<TacGia>();
            try
            {
                using(SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using(SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        using(SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TacGia tacGia = new TacGia();
                                tacGia.MaTacGia = reader["PK_iTacgiaID"] != DBNull.Value ? int.Parse(reader["PK_iTacgiaID"].ToString()) : 0;
                                tacGia.TenTacGia = reader["sTentacgia"] != DBNull.Value ? reader["sTentacgia"].ToString() : string.Empty;
                                tacGia.NgaySinh = reader["dNgaysinh"] != DBNull.Value ? DateTime.Parse(reader["dNgaysinh"].ToString()) : DateTime.MinValue;
                                
                                listTacGia.Add(tacGia);
                            }
                        }
                    }
                }
            }catch (Exception ex)
            {
                new AppException("Lỗi dưới database tac gia: " + ex.Message);
            }

            return listTacGia;
        }

        public TacGia getByMaTacGia(int id)
        {
            string query = "select * from tblTacGia where PK_iTacgiaID = " + id;
            List<TacGia> listTacGia = command(query);
            if (listTacGia.Count < 0) throw new AppException("Tác giả không tồn tại");
            return listTacGia[0];
        }

        public List<TacGia> getAll()
        {
            return command("select * from tblTacgia");
        }

        public void add(TacGia tacGia)
        {
            string query = "insert into tblTacGia (sTentacgia, dNgaysinh) values (@TenTacGia, @NgaySinh)";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@TenTacGia", tacGia.TenTacGia);
                        sqlCommand.Parameters.AddWithValue("@NgaySinh", tacGia.NgaySinh);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm tác giả: " + ex.Message);
            }
        }

        public void update(TacGia tacGia)
        {
            string query = "update tblTacGia set sTentacgia = @TenTacGia, dNgaysinh = @NgaySinh where PK_iTacgiaID = @MaTacGia";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@TenTacGia", tacGia.TenTacGia);
                        sqlCommand.Parameters.AddWithValue("@NgaySinh", tacGia.NgaySinh);
                        sqlCommand.Parameters.AddWithValue("@MaTacGia", tacGia.MaTacGia);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi cập nhật tác giả: " + ex.Message);
            }
        }

        public void delete(int id)
        {
            string query = "delete from tblTacGia where PK_iTacgiaID = @MaTacGia";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@MaTacGia", id);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi xóa tác giả: " + ex.Message);
            }
        }

    }
}