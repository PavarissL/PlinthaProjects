using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WEventWebDF.Startup))]
namespace WEventWebDF
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
