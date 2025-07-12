using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.DAL
{
    public class ChiTietDatHangDAL
    {
        public ChiTietDatHangDAL()
        {
        }


        public bool UpdateTrangThai(int maChiTietDatHang, string trangThaiMoi)
        {
            string query = "UPDATE tblChitietdathang SET sTrangthai = @TrangThai WHERE PK_iChitietdathangID = @MaChiTietDatHang";
            try
            {
                using (SqlConnection con = Connection.GetSqlConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@TrangThai", trangThaiMoi);
                        cmd.Parameters.AddWithValue("@MaChiTietDatHang", maChiTietDatHang);
                        Console.WriteLine(cmd);
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi cập nhật trạng thái chi tiết đặt hàng: " + ex.Message);
            }
        }

        public List<ChiTietDatHang> command(string query)
        {
            List<ChiTietDatHang> list = new List<ChiTietDatHang>();
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
                                ChiTietDatHang ct = new ChiTietDatHang();
                                ct.MaChiTietDatHang = reader["PK_iChitietdathangID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iChitietdathangID"]) : 0;
                                ct.SoLuong = reader["iSoluong"] != DBNull.Value ? Convert.ToInt32(reader["iSoluong"]) : 0;
                                ct.GiaBan = reader["fGiaban"] != DBNull.Value ? Convert.ToDouble(reader["fGiaban"]) : 0.0;
                                ct.MaDatHang = reader["FK_iDathangID"] != DBNull.Value ? Convert.ToInt32(reader["FK_iDathangID"]) : 0;
                                ct.MaSach = reader["FK_iSachID"] != DBNull.Value ? Convert.ToInt32(reader["FK_iSachID"]) : 0;
                                ct.TrangThai = reader["sTrangthai"] != DBNull.Value ? reader["sTrangthai"].ToString() : string.Empty;
                                list.Add(ct);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn chi tiết đặt hàng: " + ex.Message);
            }
            return list;
        }

        public Dictionary<int, int> GetSoldCounts()
        {
            var soldDict = new Dictionary<int, int>();
            var allDetails = getAll();
            foreach (var ct in allDetails)
            {
                if (soldDict.ContainsKey(ct.MaSach))
                    soldDict[ct.MaSach] += ct.SoLuong;
                else
                    soldDict[ct.MaSach] = ct.SoLuong;
            }
            return soldDict;
        }


        public List<ChiTietDatHang> getAll()
        {
            string query = "select * from tblChitietdathang";
            return command(query);
        }

        public void Add(ChiTietDatHang ct, SqlConnection con, SqlTransaction tran)
        {
            string query = @"INSERT INTO tblChitietdathang (FK_iDathangID, FK_iSachID, iSoluong, fGiaban, sTrangthai) 
                     VALUES (@MaDatHang, @MaSach, @SoLuong, @GiaBan, @TrangThai)";

            try
            {
                using (SqlCommand cmd = new SqlCommand(query, con, tran))
                {
                    cmd.Parameters.AddWithValue("@MaDatHang", ct.MaDatHang);
                    cmd.Parameters.AddWithValue("@MaSach", ct.MaSach);
                    cmd.Parameters.AddWithValue("@SoLuong", ct.SoLuong);
                    cmd.Parameters.AddWithValue("@GiaBan", ct.GiaBan);
                    cmd.Parameters.AddWithValue("@TrangThai", ct.TrangThai);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm chi tiết đặt hàng: " + ex.Message);
            }
        }

    }
}