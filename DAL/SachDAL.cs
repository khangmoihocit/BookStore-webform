using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class SachDAL
    {
        public SachDAL()
        {
        }

        public List<Sach> command(string query)
        {
            List<Sach> listSach = new List<Sach>();
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
                                Sach sach = new Sach();
                                sach.TenSach = reader["sTensach"] != DBNull.Value ? reader["sTensach"].ToString() : string.Empty;
                                sach.MoTa = reader["sMota"] != DBNull.Value ? reader["sMota"].ToString() : string.Empty;
                                sach.URLAnh = reader["sURLanh"] != DBNull.Value ? reader["sURLanh"].ToString() : string.Empty;

                                sach.MaSach = reader["PK_iSachID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iSachID"]) : 0;
                                sach.SoLuong = reader["iSoluong"] != DBNull.Value ? Convert.ToInt32(reader["iSoluong"]) : 0;
                                sach.MaTheLoai = reader["FK_iTheloaiID"] != DBNull.Value ? Convert.ToInt32(reader["FK_iTheloaiID"]) : 0;
                                sach.MaTacGia = reader["FK_iTacgiaID"] != DBNull.Value ? Convert.ToInt32(reader["FK_iTacgiaID"]) : 0;
                                sach.MaNhaXuatBan = reader["FK_iNhaxuatbanID"] != DBNull.Value ? Convert.ToInt32(reader["FK_iNhaxuatbanID"]) : 0;

                                sach.GiaBanMoi = reader["fGiabanmoi"] != DBNull.Value ? Convert.ToDouble(reader["fGiabanmoi"]) : 0.0;
                                sach.GiaBanCu = reader["fGiabancu"] != DBNull.Value ? Convert.ToDouble(reader["fGiabancu"]) : 0.0;

                                listSach.Add(sach);
                            }
                        }//reader
                    }//sqlcommand
                }//sqlconnection
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn sách: " + ex.Message);
            }
            return listSach;
        }//command

        public List<Sach> getAll()
        {
            string query = "select * from tblSach";
            return command(query);
        }

    }
}