using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using PagedList;
using PagedList.Mvc;
using WebsiteMovie_DAN.Entity;
namespace WebsiteMovie_DAN.Controllers
{
    public class TimKiemController : Controller
    {
        //
        // GET: /TimKiem/
        WebmovieDataContext data = new WebmovieDataContext();//truy cập dữ liêu cua linQ
        //kết nối entity để truy cập lịch sử
        WebmoviedbEntities db = new WebmoviedbEntities();
        public ActionResult TimKiemTheLoai(int id)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var Phim = data.DSPhimBos.Where(m => m.IDTheLoai == id);
            return View(Phim);
        }
        public ActionResult TimKiemNam(int id)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var Phim = data.DSPhimBos.Where(m => m.NamPhatHanh == id);
            return View(Phim);
        }
        public ActionResult TimKiemQuocGia(int id)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var Phim = data.DSPhimBos.Where(m => m.MaQG == id);
            return View(Phim);
        }
    }
}
