using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class Home : System.Web.UI.Page
    {
        // Khai báo biến tĩnh cho SachDAL

        [WebMethod]
        public static string GetBooks()
        {
            SachDAL dal = new SachDAL();
            // Lấy toàn bộ sách từ database
            List<Sach> sachs = dal.getAll();

            TheLoaiDAL theLoaiDAL = new TheLoaiDAL();
            var theLoais = theLoaiDAL.getAll();
            var theLoaiDict = theLoais.ToDictionary(t => t.MaTheLoai, t => t.TenTheLoai);

            ChiTietDatHangDAL ctdhDAL = new ChiTietDatHangDAL();
            var soldDict = ctdhDAL.GetSoldCounts();

            // Chỉ lấy các trường cần thiết gửi về client
            var result = new List<object>();
            foreach (var sach in sachs)
            {
                string categoryName = theLoaiDict.ContainsKey(sach.MaTheLoai) ? theLoaiDict[sach.MaTheLoai] : "Khác";
                int sold = soldDict.ContainsKey(sach.MaSach) ? soldDict[sach.MaSach] : 0;

                result.Add(new
                {
                    id = sach.MaSach,
                    title = sach.TenSach,
                    description = sach.MoTa,
                    priceNew = sach.GiaBanMoi,
                    priceOld = sach.GiaBanCu,
                    image = sach.URLAnh,
                    category = categoryName,
                    sold = sold
                });
            }

            // Chuyển danh sách sang dạng JSON
            return new JavaScriptSerializer().Serialize(result);
        }
        private SachDAL sachDAL;

        public Home()
        {
            sachDAL = new SachDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

    }
}