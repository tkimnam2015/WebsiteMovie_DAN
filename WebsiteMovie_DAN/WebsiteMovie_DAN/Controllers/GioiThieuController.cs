using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using System.Configuration;

namespace WebsiteMovie_DAN.Controllers
{
    public class GioiThieuController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: GioiThieu
        public ActionResult GioiThieuWebXemPhimSo1VietNam()
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.gioithieus.ToList();
            return View(tt);
        }
    }
}