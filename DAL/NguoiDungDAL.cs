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

        public List<Dictionary<string, object>> getLichSuMuaHang(int maNguoiDung)
        {
            List<Dictionary<string, object>> lichSuMuaHangs = new List<Dictionary<string, object>>();
            string query = "spNguoidung_GetLichSuMuaHang";
            try
            {
                using(SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using(SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@maNguoiDung", maNguoiDung);
                        using(SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Dictionary<string, object> dic = new Dictionary<string, object>();

                                dic["tenSach"] = reader["sTensach"] != DBNull.Value ? reader["sTensach"].ToString() : string.Empty;
                                dic["soLuong"] = reader["iSoluong"] != DBNull.Value ? int.Parse(reader["iSoluong"].ToString()) : -1;
                                dic["giaBan"] = reader["fGiaban"] != DBNull.Value ? double.Parse(reader["fGiaban"].ToString()): -1;
                                dic["ngayDatHang"] = reader["dNgaydathang"] != DBNull.Value ? DateTime.Parse(reader["dNgaydathang"].ToString()) : DateTime.MinValue;
                                dic["phuongThucThanhToan"] = reader["sPhuongThucTT"] != DBNull.Value ? reader["sPhuongThucTT"].ToString(): string.Empty;
                                dic["diaChiNhanHang"] = reader["sDiachinhanhang"] != DBNull.Value ? reader["sDiachinhanhang"].ToString() : string.Empty;
                                dic["SDTNhanHang"] = reader["sSDTnhanhang"] != DBNull.Value ? reader["sSDTnhanhang"].ToString() : string.Empty ;

                                lichSuMuaHangs.Add(dic);
                            }
                        }
                    }
                }
            }catch (Exception ex)
            {
                new AppException("lỗi lịch sử mua hàng: " + ex.Message);
            }
            return lichSuMuaHangs;
        }

        public NguoiDung getByEmail(string email)
        {
            string query = "select * form tblNguoidung where sEmail = " + email;
            NguoiDung nguoiDung = command(query)[0];
            if (nguoiDung == null) throw new AppException("không tồn tại người dùng có email: " + email);
            return nguoiDung;
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
            string query = "SELECT * FROM tblNguoidung WHERE sEmail = '" + username + "'  AND sMatkhau = '" + password + "' ";
            List<NguoiDung> nguoiDungs = command(query);
            if(nguoiDungs.Count < 1){
                throw new AppException("Tài khoản hoặc mật khẩu không đúng.");
            }

            return nguoiDungs[0];
        }

        public void Them(NguoiDung nd)
        {
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    string query = @"INSERT INTO tblNguoidung 
                (sTennguoidung, sEmail, sMatkhau, sDiachi, sSodienthoai, dNgaydangky, sQuyen)
                VALUES (@TenNguoiDung, @Email, @MatKhau, @DiaChi, @SoDienThoai, @NgayDangKy, @Quyen)";
                    using (SqlCommand cmd = new SqlCommand(query, sqlConnection))
                    {
                        cmd.Parameters.AddWithValue("@TenNguoiDung", nd.TenNguoiDung);
                        cmd.Parameters.AddWithValue("@Email", nd.Email);
                        cmd.Parameters.AddWithValue("@MatKhau", nd.MatKhau);
                        cmd.Parameters.AddWithValue("@DiaChi", nd.DiaChi);
                        cmd.Parameters.AddWithValue("@SoDienThoai", nd.SoDienThoai);
                        cmd.Parameters.AddWithValue("@NgayDangKy", nd.NgayDangKy);
                        cmd.Parameters.AddWithValue("@Quyen", nd.Quyen);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm người dùng: " + ex.Message);
            }
        }

        public void CapNhat(NguoiDung nd)
        {
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    string query = @"UPDATE tblNguoidung SET 
                sTennguoidung = @TenNguoiDung,
                sEmail = @Email,
                sMatkhau = @MatKhau,
                sDiachi = @DiaChi,
                sSodienthoai = @SoDienThoai,
                dNgaydangky = @NgayDangKy,
                sQuyen = @Quyen
                WHERE PK_iNguoidungID = @MaNguoiDung";
                    using (SqlCommand cmd = new SqlCommand(query, sqlConnection))
                    {
                        cmd.Parameters.AddWithValue("@TenNguoiDung", nd.TenNguoiDung);
                        cmd.Parameters.AddWithValue("@Email", nd.Email);
                        cmd.Parameters.AddWithValue("@MatKhau", nd.MatKhau);
                        cmd.Parameters.AddWithValue("@DiaChi", nd.DiaChi);
                        cmd.Parameters.AddWithValue("@SoDienThoai", nd.SoDienThoai);
                        cmd.Parameters.AddWithValue("@NgayDangKy", nd.NgayDangKy);
                        cmd.Parameters.AddWithValue("@Quyen", nd.Quyen);
                        cmd.Parameters.AddWithValue("@MaNguoiDung", nd.MaNguoiDung);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi cập nhật người dùng: " + ex.Message);
            }
        }

        public void Xoa(int maNguoiDung)
        {
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    string query = "DELETE FROM tblNguoidung WHERE PK_iNguoidungID = @MaNguoiDung";
                    using (SqlCommand cmd = new SqlCommand(query, sqlConnection))
                    {
                        cmd.Parameters.AddWithValue("@MaNguoiDung", maNguoiDung);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi xóa người dùng: " + ex.Message);
            }
        }
    }
}