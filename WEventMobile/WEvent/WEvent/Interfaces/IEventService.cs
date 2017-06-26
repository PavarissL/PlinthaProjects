using System.Collections.Generic;
using System.Threading.Tasks;
using WEvent.Models;

namespace WEvent.Interfaces
{
    public interface IEventService
    {
        Task<IEnumerable<Events>> GetEventsAsync();
    }
}
