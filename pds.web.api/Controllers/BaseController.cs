using System.Web.Http;
using System.Web.Http.Cors;

namespace pds.web.api.Controllers
{
    [EnableCors("*", "*", "*")]
    public class BaseController : ApiController
    {
        public SharpRaven.RavenClient ravenClient;
        public BaseController()
        {
            ravenClient = new SharpRaven.RavenClient("https://d01b2b96414043b9a89ebba1157cbae6:dbb03477d5ba4bdebef2a9ad248807c1@sentry.io/118549");
        }
    }
}
