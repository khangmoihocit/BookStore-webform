using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class Sach
    {
        public int MaSach { get; set; }
        public string TenSach { get; set; }
        public string MoTa { get; set; }
        public string URLAnh { get; set; }
        public double GiaBanMoi { get; set; }
        public double GiaBanCu { get; set; }
        public int SoLuong { get; set; }
        public int MaTheLoai { get; set; }
        public int MaTacGia {get; set; }
        public int MaNhaXuatBan { get; set; }
        public Sach() { }
    }
}