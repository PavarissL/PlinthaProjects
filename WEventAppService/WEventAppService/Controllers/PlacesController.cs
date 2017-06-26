using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.OData;
using Microsoft.Azure.Mobile.Server;
using WEventAppService.DataObjects;
using WEventAppService.Models;

namespace WEventAppService.Controllers
{
    public class PlacesController : TableController<EventPlace>
    {
        protected override void Initialize(HttpControllerContext controllerContext)
        {
            base.Initialize(controllerContext);
            MobileServiceContext context = new MobileServiceContext();
            DomainManager = new EntityDomainManager<EventPlace>(context, Request);
        }

        // GET tables/EventPlace
        public IQueryable<EventPlace> GetAllEventPlace()
        {
            return Query(); 
        }

        // GET tables/EventPlace/48D68C86-6EA6-4C25-AA33-223FC9A27959
        public SingleResult<EventPlace> GetEventPlace(string id)
        {
            return Lookup(id);
        }

        // PATCH tables/EventPlace/48D68C86-6EA6-4C25-AA33-223FC9A27959
        [HttpPatch]
        public Task<EventPlace> UpdateEventPlace(string id, Delta<EventPlace> patch)
        {
             return UpdateAsync(id, patch);
        }

        // POST tables/EventPlace
        [HttpPost]
        public async Task<IHttpActionResult> InsertEventPlace(EventPlace item)
        {
            EventPlace current = await InsertAsync(item);
            return CreatedAtRoute("Tables", new { id = current.Id }, current);
        }

        // DELETE tables/EventPlace/48D68C86-6EA6-4C25-AA33-223FC9A27959
        public Task DeleteEventPlace(string id)
        {
             return DeleteAsync(id);
        }
    }
}
