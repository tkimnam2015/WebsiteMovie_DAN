using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using System.Configuration;

namespace WebsiteMovie_DAN.Controllers
{
    public class TinTucPhimController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: TinTucPhim
        //đoạn kết nối entity
       
        public ActionResult TinTuc()
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.tintucphims.ToList();
            return View(tt);
        }
        public ActionResult ChiTietTinTuc(int id)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.tintucphims.SingleOrDefault(n => n.idtintuc == id);
            return View(tt);
        }
    }
}