using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;

namespace btl_laptrinhweb
{
    public partial class Category : System.Web.UI.Page
    {
        private BookDAL bookDAL;

        public Category()
        {
            bookDAL = new BookDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadDataBooks();
            }
        }

        private void loadDataBooks()
        {
            List<Book> books = bookDAL.getAll();
            rptBooks.DataSource = books;
            rptBooks.DataBind();
        }
    }
}