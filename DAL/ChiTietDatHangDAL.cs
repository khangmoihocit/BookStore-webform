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

    }
}