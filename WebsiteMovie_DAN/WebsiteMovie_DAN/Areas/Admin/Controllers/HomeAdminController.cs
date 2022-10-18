using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        WebmovieDataContext data = new WebmovieDataContext();

        public ActionResult Home()
        {
            int demnd = data.TaiKhoans.ToList().Count;
            int demphimle = data.DSPhimLes.ToList().Count;
            int demphimbo = data.DSPhimBos.ToList().Count;
            ViewData["NguoiDung"] = demnd;
            ViewData["PhimLe"] = demphimle;
            ViewData["PhimBo"] = demphimbo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(10).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var DSPhimLe = data.DSPhimLes.OrderByDescending(x => x.LuotXem).Take(10).ToList();
            ViewData["TopPhimLe"] = DSPhimLe;
            var DSPhimBoMoi = data.DSPhimBos.OrderByDescending(a => a.ID).Take(10).ToList();
            ViewData["PhimBoMoi"] = DSPhimBoMoi;
            var DSPhimLeMoi = data.DSPhimLes.OrderByDescending(a => a.ID).Take(10).ToList();
            ViewData["PhimLeMoi"] = DSPhimLeMoi;
            return View();
        }
    }
}