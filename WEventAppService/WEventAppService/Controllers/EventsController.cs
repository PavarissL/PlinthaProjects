using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.OData;
using Microsoft.Azure.Mobile.Server;
using WEventAppService.DataObjects;
using WEventAppService.Models;
using System;

namespace WEventAppService.Controllers
{
    public class EventsController : TableController<EventItem>
    {
        protected override void Initialize(HttpControllerContext controllerContext)
        {
            base.Initialize(controllerContext);
            MobileServiceContext context = new MobileServiceContext();
            DomainManager = new EntityDomainManager<EventItem>(context, Request);
        }

        // GET tables/Events
        public IQueryable<EventItem> GetAllEventItem()
        {
            return Query(); 
        }

        // GET tables/Events/48D68C86-6EA6-4C25-AA33-223FC9A27959
        public SingleResult<EventItem> GetEventItem(string id)
        {
            return Lookup(id);
        }

        // PATCH tables/Events/48D68C86-6EA6-4C25-AA33-223FC9A27959
        [HttpPatch]
        public Task<EventItem> UpdateEventItem(string id, Delta<EventItem> patch)
        {
             return UpdateAsync(id, patch);
        }

        // POST tables/Events
        [HttpPost]
        public async Task<IHttpActionResult> InsertEventItem(EventItem item)
        {
            item.EventId = Guid.NewGuid().ToString();
            EventItem current = await InsertAsync(item);
            return CreatedAtRoute("Tables", new { id = current.Id }, current);
        }

        // DELETE tables/Events/48D68C86-6EA6-4C25-AA33-223FC9A27959
        public Task DeleteEventItem(string id)
        {
             return DeleteAsync(id);
        }
    }
}
