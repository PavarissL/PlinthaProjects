using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace WEvent
{
    public partial class ViewUserProfile : ContentPage
    {
        public ViewUserProfile(Person person)
        {
            Title = person.Name;
            InitializeComponent();
        }
    }
}
