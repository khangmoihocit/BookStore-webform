using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class NhaXuatBanDAL
    {
        public NhaXuatBanDAL()
        {
        }

        public List<NhaXuatBan> command(string query)
        {
            List<NhaXuatBan> listNhaXuatBan = new List<NhaXuatBan>();
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
                                NhaXuatBan nhaXuatBan = new NhaXuatBan();
                                nhaXuatBan.MaNhaXuatBan = reader["PK_iNhaxuatbanID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iNhaxuatbanID"]) : 0;
                                nhaXuatBan.TenNhaXuatBan = reader["sTennxb"] != DBNull.Value ? reader["sTennxb"].ToString() : string.Empty;
                                nhaXuatBan.DiaChi = reader["sDiachi"] != DBNull.Value ? reader["sDiachi"].ToString() : string.Empty;
                                nhaXuatBan.SoDienThoai = reader["sSodienthoai"] != DBNull.Value ? reader["sSodienthoai"].ToString() : string.Empty;
                                listNhaXuatBan.Add(nhaXuatBan);
                            }
                        }//reader
                    }//sqlcommand
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn nhà xuất bản: " + ex.Message);
            }
            return listNhaXuatBan;
        }

        public List<NhaXuatBan> getAll()
        {
            string query = "select * from tblNhaxuatban";
            return command(query);
        }

        
    }
}