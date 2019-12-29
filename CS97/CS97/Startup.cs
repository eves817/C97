using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CS97.Startup))]
namespace CS97
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
