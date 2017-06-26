using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WEventWeb.Startup))]
namespace WEventWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
