using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.DAL
{
    public class Connection
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["host"].ConnectionString;

        public static SqlConnection GetSqlConnection()
        {
            return new SqlConnection(connectionString);
        }
    }
}