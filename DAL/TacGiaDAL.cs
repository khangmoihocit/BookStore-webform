using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class TacGiaDAL
    {
        public TacGiaDAL()
        {
        }
        
        public List<TacGia> command(string query)
        {
            List<TacGia> listTacGia = new List<TacGia>();
            try
            {
                using(SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using(SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        using(SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TacGia tacGia = new TacGia();
                                tacGia.MaTacGia = reader["PK_iTacgiaID"] != DBNull.Value ? int.Parse(reader["PK_iTacgiaID"].ToString()) : 0;
                                tacGia.TenTacGia = reader["sTentacgia"] != DBNull.Value ? reader["sTentacgia"].ToString() : string.Empty;
                                tacGia.NgaySinh = reader["dNgaysinh"] != DBNull.Value ? DateTime.Parse(reader["dNgaysinh"].ToString()) : DateTime.MinValue;
                                
                                listTacGia.Add(tacGia);
                            }
                        }
                    }
                }
            }catch (Exception ex)
            {
                new AppException("Lỗi dưới database tac gia: " + ex.Message);
            }

            return listTacGia;
        }

        public TacGia getByMaTacGia(int id)
        {
            string query = "select * from tblTacGia where PK_iTacgiaID = " + id;
            List<TacGia> listTacGia = command(query);
            if (listTacGia.Count < 0) throw new AppException("Tác giả không tồn tại");
            return listTacGia[0];
        }

        public List<TacGia> getAll()
        {
            return command("select * from tblTacgia");
        }
    }
}