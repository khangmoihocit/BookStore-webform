using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.DAL
{
    public class DatHangDAL
    {
        public DatHangDAL()
        {
        }

        //lọc đơn hàng
        public List<DonHangView> FilterDonHang(string tenSach, DateTime? tuNgay, DateTime? denNgay)
        {
            List<DonHangView> listResult = new List<DonHangView>();
            try
            {
                using (SqlConnection con = Connection.GetSqlConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("spDonhang_Filter", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@tensach", tenSach);
                        cmd.Parameters.AddWithValue("@tungay", tuNgay);
                        cmd.Parameters.AddWithValue("@denngay", denNgay);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                DonHangView vm = new DonHangView
                                {
                                    MaDatHang = reader["PK_iChitietdathangID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iChitietdathangID"]) : 0,
                                    NgayDatHang = reader["dNgaydathang"] != DBNull.Value ? Convert.ToDateTime(reader["dNgaydathang"]) : DateTime.Parse("1111-1-1"),
                                    TongThanhTien = reader["fTongthanhtien"] != DBNull.Value ? Convert.ToDouble(reader["fTongthanhtien"]) : 0.0,
                                    DiaChiNhanHang = reader["sDiachinhanhang"] != DBNull.Value ? reader["sDiachinhanhang"].ToString() : string.Empty,
                                    SDTNhanHang = reader["sSDTnhanhang"] != DBNull.Value ? reader["sSDTnhanhang"].ToString() : string.Empty,
                                    TrangThai = reader["sTrangThai"] != DBNull.Value ? reader["sTrangThai"].ToString() : string.Empty,
                                    NguoiNhan = reader["sNguoiNhan"] != DBNull.Value ? reader["sNguoiNhan"].ToString() : string.Empty,
                                    PhuongThucTT = reader["sPhuongThucTT"] != DBNull.Value ? reader["sPhuongThucTT"].ToString() : string.Empty,
                                    TenSach = reader["sTensach"] != DBNull.Value ? reader["sTensach"].ToString() : string.Empty,
                                    TenNguoiDung = reader["sTennguoidung"] != DBNull.Value ? reader["sTennguoidung"].ToString() : string.Empty,
                                    GiaBan = reader["fGiaban"] != DBNull.Value ? double.Parse(reader["fGiaban"].ToString()) : 0.0,
                                    SoLuong = reader["iSoluong"] != DBNull.Value ? int.Parse(reader["iSoluong"].ToString()) : 0
                                };
                                listResult.Add(vm);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi database: " + ex.Message);
            }
            return listResult;
        }


        public void ThemDatHang(DatHang datHang, List<ChiTietDatHang> danhSachChiTiet)
        {
            using (SqlConnection con = Connection.GetSqlConnection())
            {
                con.Open();
                using (SqlTransaction tran = con.BeginTransaction())
                {
                    try
                    {
                        string queryDH = @"INSERT INTO tblDathang 
                                         (FK_iNguoidungID, sNguoiNhan, sDiachinhanhang, sSDTnhanhang, dNgaydathang, fTongthanhtien, sPhuongThucTT)
                                         VALUES (@MaNguoiDung, @NguoiNhan, @DiaChi, @SDT, @NgayDat, @TongTien, @PhuongThuc);
                                         SELECT SCOPE_IDENTITY();"; // Lấy ID vừa được chèn

                        int maDatHangMoi;
                        using (SqlCommand cmdDH = new SqlCommand(queryDH, con, tran))
                        {
                            cmdDH.Parameters.AddWithValue("@MaNguoiDung", datHang.MaNguoiDung);
                            cmdDH.Parameters.AddWithValue("@NguoiNhan", datHang.NguoiNhan);
                            cmdDH.Parameters.AddWithValue("@DiaChi", datHang.DiaChiNhanHang);
                            cmdDH.Parameters.AddWithValue("@SDT", datHang.SDTNhanHang);
                            cmdDH.Parameters.AddWithValue("@NgayDat", datHang.NgayDatHang);
                            cmdDH.Parameters.AddWithValue("@TongTien", datHang.TongThanhTien);
                            cmdDH.Parameters.AddWithValue("@PhuongThuc", datHang.PhuongThucTT);

                            maDatHangMoi = Convert.ToInt32(cmdDH.ExecuteScalar());
                        }

                        ChiTietDatHangDAL chiTietDAL = new ChiTietDatHangDAL();
                        foreach (var chiTiet in danhSachChiTiet)
                        {
                            chiTiet.MaDatHang = maDatHangMoi;
                            chiTietDAL.Add(chiTiet, con, tran); // Gọi phương thức Add của ChiTietDatHangDAL
                        }

                        tran.Commit();
                    }
                    catch (Exception)
                    {
                        tran.Rollback();
                        throw;
                    }
                }
            }
        }
    }
}