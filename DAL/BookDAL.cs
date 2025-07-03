using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Query.Dynamic;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb.DAL
{
    public class BookDAL
    {
        public BookDAL() { }
        public List<Book> command(string query)
        {
            List<Book> books = new List<Book>();
            try
            {
                using (SqlConnection sqlConnection = Connection.GetSqlConnection())
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.Text;
                        using(SqlDataReader dataReader = sqlCommand.ExecuteReader())
                        {
                            while (dataReader.Read())
                            {
                                Book book = new Book();
                                book.Id = int.Parse(dataReader["id"].ToString());
                                book.Title = dataReader["title"].ToString();
                                book.Description = dataReader["description"].ToString();
                                book.Quantity = int.Parse(dataReader["quantity"].ToString());
                                book.PriceNew = double.Parse(dataReader["price_new"].ToString());
                                book.PriceOld = double.Parse(dataReader["price_old"].ToString());
                                book.Image = dataReader["image"] != DBNull.Value ? dataReader["image"].ToString() : string.Empty;
                                book.AuthorId = int.Parse(dataReader["author_id"].ToString());
                                book.CategoryId = int.Parse(dataReader["category_id"].ToString());
                                book.PublisherId = int.Parse(dataReader["publisher_id"].ToString());

                                books.Add(book);
                            }
                        }
                    }
                    sqlConnection.Close();
                }
            }catch (Exception ex)
            {
                throw new AppException("Lỗi truy vấn sách: " + ex.Message);
            }
            return books;
        }

        public List<Book> getAll()
        {
            string query = "select * from Books";
            return command(query);
        }


    }
}