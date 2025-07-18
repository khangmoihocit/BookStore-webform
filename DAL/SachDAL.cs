﻿using System;
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
                                sach.truong_moi = reader["truong_moi"] != DBNull.Value ? reader["truong_moi"].ToString() : string.Empty;

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



        public List<Sach> getByTheLoai(int idTheLoai)
        {
            string query = "select * from tblSach where FK_iTheLoaiID = " + idTheLoai;
            List<Sach> sach = command(query);
            return sach;
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

        public void add(Sach sach, string truong_moi)
        {
            string query = "insert into tblSach(sTensach, sMota, sURLanh, fGiabanmoi, fGiabancu, iSoluong, FK_iTheloaiID, FK_iTacgiaID, FK_iNhaxuatbanID, truong_moi) " +
                
                "values (@TenSach, @MoTa, @URLAnh, @GiaBanMoi, @GiaBanCu, @SoLuong, @MaTheLoai, @MaTacGia, @MaNhaXuatBan, @truong_moi)";
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.Text;
                        sqlCommand.Parameters.AddWithValue("@TenSach", sach.TenSach);
                        sqlCommand.Parameters.AddWithValue("@MoTa", sach.MoTa);
                        sqlCommand.Parameters.AddWithValue("@URLAnh", sach.URLAnh);
                        sqlCommand.Parameters.AddWithValue("@GiaBanMoi", sach.GiaBanMoi);
                        sqlCommand.Parameters.AddWithValue("@GiaBanCu", sach.GiaBanCu);
                        sqlCommand.Parameters.AddWithValue("@SoLuong", sach.SoLuong);
                        sqlCommand.Parameters.AddWithValue("@MaTheLoai", sach.MaTheLoai);
                        sqlCommand.Parameters.AddWithValue("@MaTacGia", sach.MaTacGia);
                        sqlCommand.Parameters.AddWithValue("@MaNhaXuatBan", sach.MaNhaXuatBan);
                        sqlCommand.Parameters.AddWithValue("@truong_moi", truong_moi);

                        int rowsAffected = sqlCommand.ExecuteNonQuery();
                        if (rowsAffected <= 0)
                        {
                            throw new AppException("Không thể thêm sách mới.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thêm sách: " + ex.Message);
            }
        }

        public bool CapNhatSach(Sach sach)
        {
            try
            {
                using (SqlConnection conn = Connection.GetSqlConnection())
                {
                    conn.Open();
                    string query = @"UPDATE tblSach SET 
                sTensach = @TenSach,
                sMota = @MoTa,
                sURLanh = @AnhBia,
                fGiabanmoi = @GiaMoi,
                fGiabancu = @GiaCu,
                iSoluong = @SoLuong,
                FK_iTheloaiID = @MaTheLoai,
                FK_iTacgiaID = @MaTacGia,
                FK_iNhaxuatbanID = @MaNXB,
truong_moi = @truong_moi
                WHERE PK_iSachID = @SachID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@TenSach", sach.TenSach);
                        cmd.Parameters.AddWithValue("@MoTa", sach.MoTa ?? "");
                        cmd.Parameters.AddWithValue("@AnhBia", sach.URLAnh ?? "");
                        cmd.Parameters.AddWithValue("@GiaMoi", sach.GiaBanMoi);
                        cmd.Parameters.AddWithValue("@GiaCu", sach.GiaBanCu);
                        cmd.Parameters.AddWithValue("@SoLuong", sach.SoLuong);
                        cmd.Parameters.AddWithValue("@MaTheLoai", sach.MaTheLoai);
                        cmd.Parameters.AddWithValue("@MaTacGia", sach.MaTacGia);
                        cmd.Parameters.AddWithValue("@MaNXB", sach.MaNhaXuatBan);
                        cmd.Parameters.AddWithValue("@SachID", sach.MaSach);
                        cmd.Parameters.AddWithValue("@truong_moi", sach.truong_moi);


                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi cập nhật sách: " + ex.Message);
            }
        }

        public bool XoaSach(int maSach)
        {
            try
            {
                using (SqlConnection conn = Connection.GetSqlConnection())
                {
                    conn.Open();
                    string query = "DELETE FROM tblSach WHERE PK_iSachID = @MaSach";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@MaSach", maSach);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi xóa sách: " + ex.Message);
            }
        }

        public List<Sach> findByName(string name)
        {
            string query = "select * from tblSach " +
                "where sTensach COLLATE Latin1_General_CI_AS LIKE N'%" + name + "%'";
            List<Sach> listSach = command(query);
            if(listSach == null || listSach.Count == 0)
            {
                throw new AppException("Không tìm thấy sách với tên: " + name);
            }
            return listSach;
        }

    }
}