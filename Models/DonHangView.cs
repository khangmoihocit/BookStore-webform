using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class DonHangView
    {
        public int MaDatHang { get; set; }
        public DateTime NgayDatHang { get; set; }
        public double TongThanhTien { get; set; }
        public string DiaChiNhanHang { get; set; }
        public string SDTNhanHang { get; set; }
        public string TrangThai { get; set; }
        public string NguoiNhan { get; set; }
        public string PhuongThucTT { get; set; }
        public string TenSach { get; set; }
        public string TenNguoiDung { get; set; }
        public double GiaBan { get; set; }
        public int SoLuong { get; set; }

        public DonHangView() { }
    }
}