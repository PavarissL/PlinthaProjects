using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WEventAppService.Startup))]

namespace WEventAppService
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureMobileApp(app);
        }
    }
}