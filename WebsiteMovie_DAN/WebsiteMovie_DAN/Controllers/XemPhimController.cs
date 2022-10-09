using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class XemPhimController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        private List<CTTapPhim> laytap(int id, int count)
        {

            return data.CTTapPhims.Where(m => m.ID == id).Take(count).ToList();
        }
        // GET: XemPhim
        public ActionResult XemPhim(int id, int? tap)
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            //var Phim = data.CTTapPhims.Where(m => m.ID == id).ToList();
            var Phim = data.DSPhimBos.Where(m => m.ID == id).ToList();
            int pageSize = 1;
            int pageNum = (tap ?? 1);
            var a = laytap(id, 1000);
            var p = data.CTTapPhims.Where(m => m.TapPhim == tap && m.ID == id).ToList();
            ViewData["p"] = p;
            return View(a.ToPagedList(pageNum, pageSize));

        }

        public ActionResult XemPhimLe(int id)
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            var Phim = data.DSPhimLes.Where(m => m.ID == id).ToList();
            return View(Phim);

        }

    }
}