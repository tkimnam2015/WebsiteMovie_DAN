using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMovie_DAN.Models;
using Facebook;
using System.Configuration;
using WebsiteMovie_DAN.Common;
using System.Security.Policy;

namespace WebsiteMovie_DAN.Controllers
{
    public class DangNhapDangKyController : Controller
    {
        WebmovieDataContext data = new WebmovieDataContext();
        // GET: DangNhapDangKy
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        public ActionResult DangNhap()
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;

            var tendn = collection["TenDN"];
            var mk = collection["MatKhau"];
            if (String.IsNullOrEmpty(tendn))
                ViewData["Loi"] = "Bạn phải nhập tên đăng nhập";
            else if (String.IsNullOrEmpty(mk))
            {
                ViewData["Loi1"] = "Bạn phải nhập mật khẩu";
            }
            else
            {
                TaiKhoan tk = data.TaiKhoans.SingleOrDefault(n => n.TenDN.Equals(tendn) && n.MatKhau.Equals(SHA_Hash.SHA1(mk)));
                if (tk != null && tk.MatKhau == SHA_Hash.SHA1(mk))
                {
                    if (tk.Quyen == true)//Admin
                    {
                        @Session["ten"] = tk.TenDN;
                        @Session["TK"] = tk.TenDN;
                        @Session["quyen"] = 1;
                        ViewBag.ThongBao = "Đăng nhập thành công admin";
                        return RedirectToAction("Home", "Admin/HomeAdmin/");
                    }
                    if (tk.Quyen == false || tk.Quyen == null)
                    {
                        @Session["quyen"] = null;
                        @Session["TK"] = tk.TenDN;
                        @Session["ten"] = tk.TenDN;
                        ViewBag.ThongBao = "Đăng nhập thành công";
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewData["Loi2"] = "Tên đăng nhâp hoặc mật khẩu không đúng";
                }
            }

            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(TaiKhoan tk, FormCollection coll)
        {
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["QuocGia"] = quocgia;
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            var tendn = coll["TenDN"];
            var mk = coll["MatKhau"];
            var mknhaplai = coll["MatKhauNhapLai"];
            var email = coll["Email"];
            //var taikhoan = from t in data.TaiKhoans where t.TenDN.Equals(tendn) select t.TenDN;
            var taikhoan = data.TaiKhoans.ToList();
            int kt = 0;
            foreach (var item in taikhoan)
            {
                if (item.TenDN == tendn)
                    kt = 1;
            }
            if (String.IsNullOrEmpty(tendn))
                ViewData["Loi"] = "Chưa điền tên đăng nhập";
            else if (String.IsNullOrEmpty(mk))
                ViewData["Loi1"] = "Mật khẩu chưa được điền";
            else if (kt == 1)
            {
                ViewData["Loi2"] = "Đã có tài khoản này";
            }
            else if (mk != mknhaplai)
            {
                ViewData["Loi12"] = "mật khẩu nhập lại không đúng";
            }
            else if (String.IsNullOrEmpty(email))
                ViewData["Loi123"] = "Chưa điền thông tin email";
            else
            {
                tk.TenDN = tendn;
                SHA_Hash Hash = new SHA_Hash();
                tk.MatKhau = SHA_Hash.SHA1(mk);
                tk.Email = email;
                tk.Quyen = false;
                data.TaiKhoans.InsertOnSubmit(tk);
                data.SubmitChanges();
                return RedirectToAction("/DangNhap");
            }
            return View();
        }
        public ActionResult DangXuat()
        {
            @Session["ten"] = null;
            @Session["quyen"] = null;
            @Session["TK"] = null;
            return Redirect("/");

        }
        public ActionResult DangNhapFaceBook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email",
            });

            return Redirect(loginUrl.AbsoluteUri);
        }
        public ActionResult FacebookCallback(string code, TaiKhoan tk, FormCollection coll)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });


            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;

                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                string userName = me.email;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;
                string aaaaaaaaa = firstname + "@321dSDFdgb";
                var taikhoan = data.TaiKhoans.ToList();
                int kt = 0;
                foreach (var item in taikhoan)
                {
                    if (item.TenDN == aaaaaaaaa)
                        kt = 1;
                }

                if (kt == 1)
                {
                    @Session["ten"] = firstname;
                    @Session["TK"] = aaaaaaaaa;
                    @Session["quyen"] = null;
                }
                else
                {
                    tk.TenDN = firstname + "@321dSDFdgb";
                    tk.MatKhau = "12312ABC@312jidqjv";
                    data.TaiKhoans.InsertOnSubmit(tk);
                    data.SubmitChanges();
                    @Session["TK"] = firstname;
                    @Session["quyen"] = null;

                }
            }
            return RedirectToAction("Index", "Home");
        }
    }
}