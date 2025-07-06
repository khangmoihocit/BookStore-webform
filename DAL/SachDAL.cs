using System;
using System.Collections.Generic;
using System.Data;
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

        public Sach getByMaSach(int id)
        {
            string query = "select * from tblSach where PK_iSachID = " + id;
            Sach sach = command(query)[0];

            if (sach == null)
            {
                throw new AppException("Không tìm thấy sách với mã: " + id);
            }
            return sach;
        }

        public List<Sach> getByTheLoai(List<int> ids)
        {
            string query = "select * from tblSach " +
                "where FK_iTheloaiID in (" + string.Join(",", ids) + ")";
            return command(query);
        }

        public List<Sach> getByNhaXuatBan(List<int> ids)
        {
            string query = "select * from tblSach " +
                "where FK_iNhaxuatbanID in (" + string.Join(",", ids) + ")";
            return command(query);
        }

        //trả về số lượng sách nhất định theo trang, vd: 1 trang có 8 sản phẩm
        public List<Sach> filterSach(string theLoaiIDs, string nhaXuaBanIDs, string sortByPrice, int currentPage, int pageSize, out int tongSoBanGhi)
        {
            List<Sach> listSach = new List<Sach>();
            tongSoBanGhi = 0;
            string query = "spSach_GetByFilter";

            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@TheloaiIDs", !string.IsNullOrEmpty(theLoaiIDs) ? (object)theLoaiIDs : DBNull.Value);
                        sqlCommand.Parameters.AddWithValue("@NXB_IDs", !string.IsNullOrEmpty(nhaXuaBanIDs) ? (object)nhaXuaBanIDs : DBNull.Value);
                        sqlCommand.Parameters.AddWithValue("@SortByPrice", !string.IsNullOrEmpty(sortByPrice) ? (object)sortByPrice : DBNull.Value);
                        sqlCommand.Parameters.AddWithValue("@CurrentPage", currentPage);
                        sqlCommand.Parameters.AddWithValue("@PageSize", pageSize);
                        using (SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (tongSoBanGhi == 0)
                                {
                                    tongSoBanGhi = int.Parse(reader["tongsobanghi"].ToString());
                                }
                                Sach sach = new Sach();
                                sach.MaSach = reader["PK_iSachID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iSachID"]) : 0;
                                sach.TenSach = reader["sTensach"] != DBNull.Value ? reader["sTensach"].ToString() : string.Empty;
                                sach.URLAnh = reader["sURLanh"] != DBNull.Value ? reader["sURLanh"].ToString() : string.Empty;
                                sach.GiaBanMoi = reader["fGiabanmoi"] != DBNull.Value ? Convert.ToDouble(reader["fGiabanmoi"]) : 0.0;
                                sach.GiaBanCu = reader["fGiabancu"] != DBNull.Value ? Convert.ToDouble(reader["fGiabancu"]) : 0.0;
                                listSach.Add(sach);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                new AppException("lỗi lọc sách: " + ex.Message);
            }
            return listSach;
        }

    }
}