using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMovie_DAN.Models
{
    public class TaiKhoanDTO
    {

        private string tenDN;

        private string matKhau;

        private string quyen;

        private string email;

        public string TenDN { get => tenDN; set => tenDN = value; }
        public string MatKhau { get => matKhau; set => matKhau = value; }
        public string Quyen { get => quyen; set => quyen = value; }
        public string Email { get => email; set => email = value; }
    }
}