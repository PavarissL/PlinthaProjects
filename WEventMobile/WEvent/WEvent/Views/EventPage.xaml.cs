using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WEvent.Interfaces;
using WEvent.Models;
using WEvent.Services;
using Xamarin.Forms;

namespace WEvent
{
    public partial class EventPage : ContentPage
    {
        readonly IEventService service = new AzureEventsService();

        public EventPage()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            if (events == null)
                await LoadEvents();
        }

        async Task LoadEvents()
        {
            IsBusy = true;

            try
            {
                // load all event to ListView
                events = (await service.GetEventsAsync()).ToList();
                allEvents.ItemsSource = events;
            }
            catch (Exception ex)
            {
                await this.DisplayAlert("Error", "Failed to download questions: " + ex.Message, "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }

        async void OnLogoutButtonClicked(object sender, EventArgs e)
        {
            App.IsUserLoggedIn = false;
            Navigation.InsertPageBefore(new LoginPage(), this);
            await Navigation.PopAsync();
        }

        //View User Profile
        async void OnProfileClicked(object sender, EventArgs args)
        {
            await DisplayAlert("Go Profile Detail", "TODO : Goto Profile Detail Page", "OK");

            Person person = new Person() { Name = "Judy Lee" };
            await Navigation.PushAsync(new ViewUserProfile(person));
        }

        //TODO : Refresh ListView
        bool reverse;
        void OnRefreshing(object sender, EventArgs e)
        {
            ListView lv = (ListView)sender;

            //List<Person> reversedData = ((reverse)
            //    ? PersonFactory.Characters.OrderBy(p => p.Name)
            //    : PersonFactory.Characters.OrderByDescending(p => p.Name)).ToList();
            //reverse = !reverse;

            //PersonFactory.Characters.Clear();
            //foreach (var item in reversedData)
            //    PersonFactory.Characters.Add(item);

            lv.IsRefreshing = false;
        }

        //Add Event
        void OnAddEventClicked(object sender, EventArgs e)
        {
            DisplayAlert("Add Event", "TODO : Goto Add Event Page", "OK");
            //await Navigation.PushAsync(new Views.Master(), false);
        }

        //Event Action Bar 
        void OnCommentClicked(object sender, EventArgs e)
        {
            DisplayAlert("Add/View All Coment", "TODO : Goto Comment Page", "OK");
        }

        void OnRequestClicked(object sender, EventArgs e)
        {
            DisplayAlert("Request Person to Joins", "TODO : Goto Person List Page", "OK");
        }

        void OnJoinClicked(object sender, EventArgs e)
        {
            DisplayAlert("Add me Joins the Event", "TODO : update data add user join to the event", "OK");
        }

        void OnViewPendingEventClicked(object sender, EventArgs e)
        {
            DisplayAlert("View Requested Event List", "TODO : show Event list wich requested you to Join", "OK");
        }

        async void OnAccountButtonClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Go Account Detail", "TODO : Goto Account Detail Page", "OK");

            Person person = new Person() { Name = "John Woo"};
            await Navigation.PushAsync(new AccountDetail(person));
        }

        #region Data
        private List<Events> events;
        #endregion
    }
}
