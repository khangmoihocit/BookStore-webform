using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class TacGia
    {
        public int MaTacGia { get; set; }
        public string TenTacGia { get; set; }
        public DateTime NgaySinh { get; set; }
        public TacGia() { }
    }
}