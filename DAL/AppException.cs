using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.DAL
{
    //dùng để ném ra lỗi trong quá trình xử lý
    public class AppException : Exception
    {
        public AppException(string message) : base(message){}
    }
}