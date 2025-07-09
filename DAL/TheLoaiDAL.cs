using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class TheLoaiDAL
    {
        public TheLoaiDAL()
        {
        }

        public List<TheLoai> command(string query)
        {
            List<TheLoai> listTheLoai = new List<TheLoai>();
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        using (SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TheLoai theLoai = new TheLoai();
                                theLoai.MaTheLoai = reader["PK_iTheloaiID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iTheloaiID"]) : 0;
                                theLoai.TenTheLoai = reader["sTentheloai"] != DBNull.Value ? reader["sTentheloai"].ToString() : string.Empty;
                                listTheLoai.Add(theLoai);
                            }
                        }//reader
                    }//sqlcommand
                }//sqlconnection
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn thể loại sách: " + ex.Message);
            }
            return listTheLoai;
        }

        public List<TheLoai> getAll()
        {
            string query = "select * from tblTheloai";
            return command(query);
        }

        public void add(TheLoai theLoai)
        {
            string query = "INSERT INTO tblTheloai (sTentheloai) VALUES (@sTentheloai)";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@sTentheloai", theLoai.TenTheLoai);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm thể loại sách: " + ex.Message);
            }
        }

        public void deleteById(int id)
        {
            string query = "delete tblTheloai where PK_iTheloaiID = " + id;
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi xóa thể loại sách: " + ex.Message);
            }
        }

        public void update(TheLoai theLoai)
        {
            string query = "UPDATE tblTheloai SET sTentheloai = @sTentheloai WHERE PK_iTheloaiID = @PK_iTheloaiID";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@sTentheloai", theLoai.TenTheLoai);
                        sqlCommand.Parameters.AddWithValue("@PK_iTheloaiID", theLoai.MaTheLoai);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi cập nhật thể loại sách: " + ex.Message);
            }
        }

        public TheLoai getById(int id)
        {
            string query = "SELECT * FROM tblTheloai WHERE PK_iTheloaiID = @PK_iTheloaiID";
            TheLoai theLoai = null;
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@PK_iTheloaiID", id);
                        using (SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                theLoai = new TheLoai
                                {
                                    MaTheLoai = reader["PK_iTheloaiID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iTheloaiID"]) : 0,
                                    TenTheLoai = reader["sTentheloai"] != DBNull.Value ? reader["sTentheloai"].ToString() : string.Empty
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi lấy thể loại sách theo ID: " + ex.Message);
            }
            return theLoai;
        }
    }
}