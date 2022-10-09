using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class ChiTietPhimController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: ChiTietPhim
        public ActionResult ChiTietPhim(int id, string tendn)
        {

            var Phim = data.DSPhimBos.Where(m => m.ID == id).First();
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;

            return View(Phim);
        }

        public ActionResult ChiTietPhimLe(int id)
        {
            var DSPhimLe = data.DSPhimLes.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimLe;
            var Phim = data.DSPhimLes.Where(m => m.ID == id).First();
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;

            return View(Phim);
        }
    }
}