using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class LichSuXemController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: LichSuXem
        public ActionResult Index(string tendn)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            var lichsu = data.LichSus.Where(m => m.TenDN.Equals(tendn)).ToList();
            return View(lichsu);
        }

        public ActionResult ThemVaoLichSu(string tendn, int idphim, int id, int? tap)
        {
            var quocgia = data.QuocGias.ToList();
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;

            LichSu phim = new LichSu();
            var dsphim = data.LichSus.Where(m => m.TenDN == tendn).ToList();
            DSPhimBo a = data.DSPhimBos.SingleOrDefault(n => n.ID == id);
            foreach (var item in dsphim)
            {
                if (item.IDPhim == idphim)
                {
                    a.LuotXem += 1;
                    UpdateModel(a);

                    data.SubmitChanges();
                    return RedirectToAction("XemPhim", "XemPhim", new { id = a.ID, tap = 1 });
                }


            }
            phim.TenDN = tendn;
            phim.IDPhim = idphim;
            data.LichSus.InsertOnSubmit(phim);
            data.SubmitChanges();


            a.LuotXem += 1;
            UpdateModel(a);

            data.SubmitChanges();
            return RedirectToAction("XemPhim", "XemPhim", new { id = a.ID, tap = 1 });

        }

        public ActionResult XoaLichSu(string tendn, int idphim)
        {
            LichSu tl = data.LichSus.SingleOrDefault(n => n.TenDN == tendn && n.IDPhim == idphim);
            if (tl == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            data.LichSus.DeleteOnSubmit(tl);
            data.SubmitChanges();
            return RedirectToAction("Index", new { tendn = tl.TenDN });
        }
    }
}