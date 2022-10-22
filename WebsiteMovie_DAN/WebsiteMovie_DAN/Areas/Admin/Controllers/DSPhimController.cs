using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using System.IO;

namespace WebsiteMovie_DAN.Areas.Admin.Controllers
{
    public class DSPhimController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: Admin/DSPhim
        public ActionResult DSPhimLe()
        {
            var ALL_Phim = from tt in data.DSPhimLes select tt;
            return View(ALL_Phim);
        }

        public ActionResult DSPhimBo()
        {
            var ALL_Phim = from tt in data.DSPhimBos select tt;
            return View(ALL_Phim);
        }

        //Chi tiết tập phim bộ
        public ActionResult CTTapPhimBo(int id)
        {
            var ALL_Phim = from tt in data.CTTapPhims.Where(m => m.ID == id) select tt;
            ViewData["iD"] = id;
            return View(ALL_Phim);
        }
    }
}