using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class NhaXuatBan
    {
        public int MaNhaXuatBan { get; set; }
        public string TenNhaXuatBan { get; set; }
        public string DiaChi { get; set; }
        public int SoDienThoai { get; set; }
        public NhaXuatBan() { }

    }
}