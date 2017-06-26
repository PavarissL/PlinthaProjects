using Microsoft.WindowsAzure.MobileServices;
using Microsoft.WindowsAzure.MobileServices.Sync;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using WEvent.Interfaces;
using WEvent.Models;

namespace WEvent.Services
{
    public class AzureEventsService : IEventService
    {
        const string AzureUrl = "http://weventappservice.azurewebsites.net";

        MobileServiceClient client;

        IMobileServiceTable<Events> eventsTable;

        void InitializeAsync()
        {
            if (client != null)
                return;

            client = new MobileServiceClient(AzureUrl);
            eventsTable = client.GetTable<Events>();
        }

        public Task<IEnumerable<Events>> GetEventsAsync()
        {
            InitializeAsync();
            return eventsTable.ReadAsync();
        }
    }
}
