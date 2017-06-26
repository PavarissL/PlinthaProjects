using Microsoft.Azure.Mobile.Server;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WEventAppService.DataObjects
{
    [Table("places")]
    public class EventPlace : EntityData
    {
        [JsonProperty("placeId")]
        public string PlaceId { get; set; }

        public string Name { get; set; }

        [JsonProperty("address")]
        public string Address { get; set; }
    }
}