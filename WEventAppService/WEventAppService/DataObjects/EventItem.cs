using Microsoft.Azure.Mobile.Server;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WEventAppService.DataObjects
{
    [Table("events")]
    public class EventItem : EntityData
    {
        [JsonProperty("eventId")]
        public string EventId { get; set; }

        public string Name { get; set; }

        [JsonProperty("startDate")]
        public string StartDate { get; set; }

        [JsonProperty("endDate")]
        public string EndDate { get; set; }
    }
}