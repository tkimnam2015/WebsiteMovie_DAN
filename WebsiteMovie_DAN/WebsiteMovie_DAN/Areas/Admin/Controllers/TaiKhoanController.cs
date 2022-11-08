using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using WebsiteMovie_DAN.Common;

namespace WebsiteMovie_DAN.Areas.Admin.Controllers
{
    public class TaiKhoanController : Controller
    {
        // GET: Admin/TaiKhoan
        WebmovieDataContext data = new WebmovieDataContext();
        public ActionResult DSTaiKhoan()
        {
            var tk = data.TaiKhoans.ToList();
            return View(tk);
        }

        //Xóa TK
        public ActionResult XoaTK(string tendn)
        {
            TaiKhoan tk = data.TaiKhoans.SingleOrDefault(n => n.TenDN == tendn);
            if (tk == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            data.TaiKhoans.DeleteOnSubmit(tk);
            data.SubmitChanges();
            return RedirectToAction("DSTaiKhoan");
        }

        //Thêm TK
        [HttpGet]
        public ActionResult ThemTK()
        {
            TaiKhoanDTO taiKhoanDTO = new TaiKhoanDTO();
            return View(taiKhoanDTO);
        }
        [HttpPost]
        public ActionResult ThemTK(TaiKhoanDTO tk)
        {
            string tendn = tk.TenDN;
            string mk = tk.MatKhau;
            string em = tk.Email;
           
            
            //var taikhoan = from t in data.TaiKhoans where t.TenDN.Equals(tendn) select t.TenDN;
            var taikhoan = data.TaiKhoans.ToList();
            int kt = 0;
            foreach (var item in taikhoan)
            {
                if (item.TenDN == tendn)
                    kt = 1;
            }
            if (String.IsNullOrEmpty(tendn))
                ViewData["Loi"] = "Tên đăng nhập không được để trống !";
            else if (String.IsNullOrEmpty(mk))
                ViewData["Loi1"] = "Mật khẩu không được để trống !";
            else if (String.IsNullOrEmpty(em))
                ViewData["Loi3"] = "Email không được để trống !";
            else if (kt == 1)
            {
                ViewData["Loi2"] = "Đã có tài khoản này";
            }
            else
            {
                //tk.TenDN = tendn;
                //tk.MatKhau = mk;
                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.TenDN = tendn;
                taiKhoan.MatKhau = SHA_Hash.SHA1(mk);
                taiKhoan.Email = tk.Email;
                if (tk.Quyen == null ||tk.Quyen=="False")
                {
                    taiKhoan.Quyen = false;
                }
                else
                {
                    taiKhoan.Quyen = true;
                }

                data.TaiKhoans.InsertOnSubmit(taiKhoan);
                data.SubmitChanges();
                return RedirectToAction("DSTaiKhoan");
            }

            return View();
        }

        //Sửa
        public ActionResult SuaTK(string tendn)
        {
            var tk = data.TaiKhoans.First(n => n.TenDN == tendn);
            if (tk == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            return View(tk);
        }

        [HttpPost]
        public ActionResult SuaTK(string tendn, FormCollection collection)
        {
            var tk = data.TaiKhoans.First(n => n.TenDN == tendn);
            var mk = collection["MatKhau"];
            if (String.IsNullOrEmpty(mk))
            {
                ViewData["Loi"] = "Không được để trống";
            }
            else
            {
                tk.MatKhau = SHA_Hash.SHA1(mk);
                UpdateModel(tk);
                data.SubmitChanges();
                return RedirectToAction("DSTaiKhoan");
            }
            return this.SuaTK(tendn);
        }
    }
}