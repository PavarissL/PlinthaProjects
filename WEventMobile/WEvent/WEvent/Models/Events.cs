using System;
using Microsoft.WindowsAzure.MobileServices;
using Newtonsoft.Json;

namespace WEvent.Models
{
    [JsonObject(Title = "events")]
    public class Events
    {
        [JsonProperty("eventId")]
        public string EventId { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("startDate")]
        public string StartDate { get; set; }

        [JsonProperty("endDate")]
        public string EndDate { get; set; }

        

        public string HeadshotUrl {
            get { return "Homer.gif"; }
            set { }
        }

        public string Email
        {
            get { return "myEmail@aol.com"; }
            set { }
        }

        public bool IsRequested {
            get { return true; }
            set { }
        }

        public string PlaceImageUrl
        {
            get { return "meetingroom001.jpg"; }
            set { }
        }

        [UpdatedAt]
        public DateTimeOffset UpdatedAt { get; set; }

        [Version]
        public string AzureVersion { get; set; }

        public string Id { get; set; }
    }
}
