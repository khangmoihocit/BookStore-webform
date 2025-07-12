using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class DatHang
    {
        public int MaDatHang { get; set; }
        public int MaNguoiDung { get; set; }
        public string NguoiNhan { get; set; } 
        public string DiaChiNhanHang { get; set; }
        public string SDTNhanHang { get; set; } 
        public DateTime NgayDatHang { get; set; }
        public double TongThanhTien { get; set; } 
        public string PhuongThucTT { get; set; }

        public DatHang() { }
    }
}