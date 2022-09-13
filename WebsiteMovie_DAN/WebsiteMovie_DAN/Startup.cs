using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebsiteMovie_DAN.Startup))]
namespace WebsiteMovie_DAN
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
