using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.DAL
{
    public class NguoiDungDAL
    {
        public NguoiDungDAL()
        {
        }

        public List<NguoiDung> command(string query)
        {
            List<NguoiDung> listNguoiDung = new List<NguoiDung>();
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
                                NguoiDung nguoiDung = new NguoiDung();
                                nguoiDung.MaNguoiDung = reader["PK_iNguoidungID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iNguoidungID"]) : 0;
                                nguoiDung.TenNguoiDung = reader["sTennguoidung"] != DBNull.Value ? reader["sTennguoidung"].ToString() : string.Empty;
                                nguoiDung.MatKhau = reader["sMatkhau"] != DBNull.Value ? reader["sMatkhau"].ToString() : string.Empty;
                                nguoiDung.Email = reader["sEmail"] != DBNull.Value ? reader["sEmail"].ToString() : string.Empty;
                                nguoiDung.DiaChi = reader["sDiachi"] != DBNull.Value ? reader["sDiachi"].ToString() : string.Empty;
                                nguoiDung.SoDienThoai = reader["sSodienthoai"] != DBNull.Value ? reader["sSodienthoai"].ToString() : string.Empty;
                                nguoiDung.Quyen = reader["sQuyen"] != DBNull.Value ? reader["sQuyen"].ToString() : string.Empty;
                                nguoiDung.NgayDangKy = reader["dNgaydangky"] != DBNull.Value ? Convert.ToDateTime(reader["dNgaydangky"]) : DateTime.MinValue;
                                listNguoiDung.Add(nguoiDung);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn người dùng: " + ex.Message);
            }
            return listNguoiDung;
        }

        public List<NguoiDung> getAll()
        {
            string query = "SELECT * FROM tblNguoidung";
            return command(query);
        }

        public NguoiDung getById(int id)
        {
            string query = "SELECT * FROM tblNguoidung WHERE PK_iNguoidungID = @PK_iNguoidungID";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@PK_iNguoidungID", id);
                        using (SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                NguoiDung nguoiDung = new NguoiDung();
                                nguoiDung.MaNguoiDung = reader["PK_iNguoidungID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iNguoidungID"]) : 0;
                                nguoiDung.TenNguoiDung = reader["sTennguoidung"] != DBNull.Value ? reader["sTennguoidung"].ToString() : string.Empty;
                                nguoiDung.MatKhau = reader["sMatkhau"] != DBNull.Value ? reader["sMatkhau"].ToString() : string.Empty;
                                nguoiDung.Email = reader["sEmail"] != DBNull.Value ? reader["sEmail"].ToString() : string.Empty;
                                nguoiDung.DiaChi = reader["sDiachi"] != DBNull.Value ? reader["sDiachi"].ToString() : string.Empty;
                                nguoiDung.SoDienThoai = reader["sSodienthoai"] != DBNull.Value ? reader["sSodienthoai"].ToString() : string.Empty;
                                nguoiDung.Quyen = reader["sQuyen"] != DBNull.Value ? reader["sQuyen"].ToString() : string.Empty;
                                nguoiDung.NgayDangKy = reader["dNgaydangky"] != DBNull.Value ? Convert.ToDateTime(reader["dNgaydangky"]) : DateTime.MinValue;
                                return nguoiDung;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi lấy người dùng theo ID: " + ex.Message);
            }
            return null;
        }

        public void add(NguoiDung nguoiDung)
        {
            string query = "INSERT INTO tblNguoidung (sTennguoidung, sMatkhau, sEmail, sSodienthoai, sQuyen) " +
                           "VALUES (@sTendangnhap, @sMatkhau, @sEmail, @sSodienthoai, @sQuyen)";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@sTendangnhap", nguoiDung.TenNguoiDung);
                        sqlCommand.Parameters.AddWithValue("@sMatkhau", nguoiDung.MatKhau);
                        sqlCommand.Parameters.AddWithValue("@sEmail", nguoiDung.Email);
                        sqlCommand.Parameters.AddWithValue("@sSodienthoai", nguoiDung.SoDienThoai);
                        sqlCommand.Parameters.AddWithValue("@sQuyen", nguoiDung.Quyen);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm người dùng: " + ex.Message);
            }

        }

        public NguoiDung login(string username, string password)
        {
            string query = "SELECT * FROM tblNguoidung WHERE sEmail = '" + username + "'  AND sMatkhau = '" + password + "'";
            List<NguoiDung> nguoiDungs = command(query);
            if(nguoiDungs.Count < 1){
                throw new AppException("Tài khoản hoặc mật khẩu không đúng.");
            }

            return nguoiDungs[0];
        }
    }
}