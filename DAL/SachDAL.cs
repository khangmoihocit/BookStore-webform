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
                                sach.MaSach = int.Parse(reader["PK_iSachID"].ToString());
                                sach.MoTa = reader["sMota"].ToString();
                                sach.TenSach = reader["sTensach"].ToString();
                                sach.URLAnh = reader["sURLanh"].ToString();
                                sach.GiaBanMoi = double.Parse(reader["fGiabanmoi"].ToString());
                                sach.GiaBanCu = double.Parse(reader["fGiabancu"].ToString());
                                sach.SoLuong = int.Parse(reader["iSoluong"].ToString());
                                sach.MaTheLoai = int.Parse(reader["FK_iTheloaiID"].ToString());
                                sach.MaTacGia = int.Parse(reader["FK_iTacgiaID"].ToString());
                                sach.MaNhaXuatBan = int.Parse(reader["FK_iNhaxuatbanID"].ToString());

                                listSach.Add(sach);
                            }
                        }//reader
                    }//sqlcommand
                }//sqlconnection
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn: " + ex.Message);
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