using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class XemSauController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: XemSau
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
            var hopphim = data.HopPhims.Where(m => m.TenDN.Equals(tendn)).ToList();
            return View(hopphim);
        }
    }
}