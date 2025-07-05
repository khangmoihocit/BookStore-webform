using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class NguoiDung
    {
        public int MaNguoiDung { get; set; }
        public string TenNguoiDung { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public DateTime NgayDangKy { get; set; }
        public string DiaChi { get; set; }
        public string Quyen { get; set; } 
        public NguoiDung() { }

    }
}