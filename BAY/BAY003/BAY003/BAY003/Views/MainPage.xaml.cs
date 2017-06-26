using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace BAY003
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        async void ViewContactList(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AddressBookListPage());
        }

        void Entry_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (e.NewTextValue.Length > 13)
            {
                entryId.Text = entryId.Text.Remove(13);
            }
        }

        private async void SubmitData(object sender, EventArgs e)
        {
            await DisplayAlert("Data Submit", "Data was submitted.", "OK");
        }
    }
}
