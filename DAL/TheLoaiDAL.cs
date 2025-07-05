using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class TheLoaiDAL
    {
        public TheLoaiDAL()
        {
        }

        public List<TheLoai> command(string query)
        {
            List<TheLoai> listTheLoai = new List<TheLoai>();
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
                                TheLoai theLoai = new TheLoai();
                                theLoai.MaTheLoai = reader["PK_iTheloaiID"] != DBNull.Value ? Convert.ToInt32(reader["PK_iTheloaiID"]) : 0;
                                theLoai.TenTheLoai = reader["sTentheloai"] != DBNull.Value ? reader["sTentheloai"].ToString() : string.Empty;
                                listTheLoai.Add(theLoai);
                            }
                        }//reader
                    }//sqlcommand
                }//sqlconnection
            }
            catch (Exception ex)
            {
                throw new AppException("Lỗi khi thực hiện truy vấn thể loại sách: " + ex.Message);
            }
            return listTheLoai;
        }

        public List<TheLoai> getAll()
        {
            string query = "select * from tblTheloai";
            return command(query);
        }


    }
}