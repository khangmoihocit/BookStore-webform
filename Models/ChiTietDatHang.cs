using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class ChiTietDatHang
    {
        public int MaChiTietDatHang { get; set; }
        public int MaDatHang { get; set; }
        public int MaSach { get; set; }
        public int SoLuong { get; set; }
        public double GiaBan { get; set; }
        public string TrangThai { get; set; }   
        public ChiTietDatHang() { }

    }
}