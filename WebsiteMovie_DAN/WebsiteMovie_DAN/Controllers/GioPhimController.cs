using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;

namespace WebsiteMovie_DAN.Controllers
{
    public class GioPhimController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();

        // GET: GioPhim
        public ActionResult DatPhim(string tendn)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            DateTime dateTime = DateTime.Now;
            var ngaydat = dateTime.Date;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            var datphim = data.DatPhims.Where(m => m.TenDN.Equals(tendn)).ToList();
            return View(datphim);
        }

        //Thêm phim trong danh mục đặt phim
        public ActionResult ThemPhimDat(string tendn, int idphim)
        {
            var quocgia = data.QuocGias.ToList();
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;

            DatPhim phim = new DatPhim();
            
            var dsphim = data.DatPhims.Where(m => m.TenDN == tendn).ToList();
            foreach (var item in dsphim)
            {
                if (item.IDPhim == idphim)
                    return RedirectToAction("ChiTietPhim", "ChiTietPhim", new { id = item.IDPhim });
            }
            phim.TenDN = tendn;
            phim.IDPhim = idphim;
            phim.NgayDat = DateTime.Now;
            data.DatPhims.InsertOnSubmit(phim);
            data.SubmitChanges();
            return RedirectToAction("ChiTietPhim", "ChiTietPhim", new { id = idphim });
        }

        //Xóa phim đã đặt mua
        public ActionResult XoaPhimDat(string tendn, int idphim)
        {
            DatPhim pd = data.DatPhims.SingleOrDefault(n => n.TenDN == tendn && n.IDPhim == idphim);
            if (pd == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            data.DatPhims.DeleteOnSubmit(pd);
            data.SubmitChanges();
            return RedirectToAction("DatPhim", new { tendn = pd.TenDN });
        }
    }
}