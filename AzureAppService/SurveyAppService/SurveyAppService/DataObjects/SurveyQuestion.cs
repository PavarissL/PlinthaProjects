using Microsoft.Azure.Mobile.Server;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SurveyAppService.DataObjects
{
    [Table("questions")]
    public class SurveyQuestion : EntityData
    {
        public string Text { get; set; }
        public string Answers { get; set; }
    }
}