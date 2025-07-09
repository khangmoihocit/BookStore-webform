using btl_laptrinhweb.DAL;
using btl_laptrinhweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_laptrinhweb
{
    public partial class KetQuaTimKiem : System.Web.UI.Page
    {
        private SachDAL sachDAL;
        private TheLoaiDAL theLoaiDAL;
        private NhaXuatBanDAL nhaXuatBanDAL;
        public KetQuaTimKiem()
        {
            sachDAL = new SachDAL();
            theLoaiDAL = new TheLoaiDAL();
            nhaXuatBanDAL = new NhaXuatBanDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string keyword = Request.QueryString["keyword"] ?? "";
                LoadKetQua(keyword);
                loadData();
            }
        }

        public static string RemoveDiacritics(string text)
        {
            if (string.IsNullOrEmpty(text)) return text;
            string[] vietnameseSigns = new string[]
            {
        "aAeEoOuUiIdDyY",
        "áàạảãâấầậẩẫăắằặẳẵ",
        "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
        "éèẹẻẽêếềệểễ",
        "ÉÈẸẺẼÊẾỀỆỂỄ",
        "óòọỏõôốồộổỗơớờợởỡ",
        "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
        "úùụủũưứừựửữ",
        "ÚÙỤỦŨƯỨỪỰỬỮ",
        "íìịỉĩ",
        "ÍÌỊỈĨ",
        "đ",
        "Đ",
        "ýỳỵỷỹ",
        "ÝỲỴỶỸ"
            };
            for (int i = 1; i < vietnameseSigns.Length; i++)
            {
                for (int j = 0; j < vietnameseSigns[i].Length; j++)
                    text = text.Replace(vietnameseSigns[i][j], vietnameseSigns[0][i - 1]);
            }
            return text;
        }


        private void LoadKetQua(string keyword)
        {
            var sachDal = new SachDAL();
            var allBooks = sachDal.getAll();

            string keywordNoSign = RemoveDiacritics(keyword).ToLower();

            var result = allBooks
                .Where(s => !string.IsNullOrEmpty(s.TenSach) &&
                            RemoveDiacritics(s.TenSach).ToLower().Contains(keywordNoSign))
                .ToList();

            rptSach.DataSource = result;
            rptSach.DataBind();
        }


        private void loadData()
        {

        }

        protected void rptSach_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ThemGioHang")
            {
                int maSach = int.Parse(e.CommandArgument.ToString());
                Sach sach = sachDAL.getByMaSach(maSach);
                if (sach != null)
                {
                    List<Sach> gioHang = Session["GioHang"] as List<Sach>;
                    if (gioHang == null)
                    {
                        gioHang = new List<Sach>();
                    }

                    Sach sachExisted = gioHang.Find(item => item.MaSach == sach.MaSach);
                    if (sachExisted != null)
                    {
                        sachExisted.SoLuong++;
                    }
                    else
                    {
                        sach.SoLuong = 1;
                        gioHang.Add(sach);
                    }
                    Session["GioHang"] = gioHang;
                }
            }
        }
    }
}