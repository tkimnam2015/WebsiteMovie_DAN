using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class LuotThichController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: LuotThich

        //Danh sách lượt yêu thích phim bộ
        public ActionResult YeuThichPhimBo(string tendn)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotThich).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            var yeuthich = data.LuotThichPhimBos.Where(m => m.TenDN.Equals(tendn)).ToList();
            return View(yeuthich);
        }

        //Thêm yêu thích phim bộ
        public ActionResult ThemYeuThichPhimBo(string tendn, int idphim, int id)
        {
            var quocgia = data.QuocGias.ToList();
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;

            LuotThichPhimBo yeuthich = new LuotThichPhimBo();
            var dsphim = data.LuotThichPhimBos.Where(m => m.TenDN == tendn).ToList();
            DSPhimBo a = data.DSPhimBos.SingleOrDefault(n => n.ID == id);
            foreach (var item in dsphim)
            {
                if (item.IDPhim == idphim)
                {
                    a.LuotThich += 1;
                    UpdateModel(a);

                    data.SubmitChanges();
                    return RedirectToAction("ChiTietPhim", "ChiTietPhim", new { id = a.ID });
                }


            }
            yeuthich.TenDN = tendn;
            yeuthich.IDPhim = idphim;
            data.LuotThichPhimBos.InsertOnSubmit(yeuthich);
            data.SubmitChanges();

            a.LuotThich += 1;
            UpdateModel(a);

            data.SubmitChanges();
            return RedirectToAction("ChiTietPhim", "ChiTietPhim", new { id = a.ID });
        }

        //Xóa yêu thích phim bộ
        public ActionResult XoaYeuThichPhimBo(string tendn, int idphim)
        {
            LuotThichPhimBo pb = data.LuotThichPhimBos.SingleOrDefault(n => n.TenDN == tendn && n.IDPhim == idphim);
            if (pb == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            data.LuotThichPhimBos.DeleteOnSubmit(pb);
            data.SubmitChanges();
            return RedirectToAction("YeuThichPhimBo", new { tendn = pb.TenDN });
        }
    }
}