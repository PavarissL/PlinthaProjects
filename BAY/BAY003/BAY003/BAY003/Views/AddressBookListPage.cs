using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;

using Xamarin.Forms;

namespace BAY003
{
    using Model;
    using System.Windows.Input;
    using ViewModel;
    using Xamarin.Forms;

    public class AddressBookListPage : ContentPage
    {
        private ListView listView;
        private ContactViewModel contactViewModel;

        public AddressBookListPage()
        {
            Title = "Contacts";

            this.contactViewModel = new ContactViewModel();
            listView = new ListView
            {
                RowHeight = 40
            };

            var layout = new StackLayout()
            {
                VerticalOptions = LayoutOptions.FillAndExpand,
                Children = { this.listView }
            };

            this.Content = layout;
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            var cell = new DataTemplate(typeof(TextCell));
            cell.SetBinding(TextCell.TextProperty, "FirstName");
            cell.SetBinding(TextCell.TextProperty, "LastName");
            cell.SetBinding(TextCell.TextProperty, "PhoneNo");
            cell.SetBinding(TextCell.TextProperty, "PhoneLabel");

            listView.ItemTemplate = cell;


            var personDataTemplate = new DataTemplate(() => {
                var grid = new Grid();
                var firstNameLabel = new Label { FontAttributes = FontAttributes.Bold };
                var lastNameLabel = new Label();
                var phoneLabel = new Label { HorizontalTextAlignment = TextAlignment.End };
                var phoneNumberLabel = new Label { HorizontalTextAlignment = TextAlignment.End };

                firstNameLabel.SetBinding(Label.TextProperty, "FirstName");
                lastNameLabel.SetBinding(Label.TextProperty, "LastName");
                phoneLabel.SetBinding(Label.TextProperty, "PhoneNo");
                phoneNumberLabel.SetBinding(Label.TextProperty, "PhoneLabel");

                grid.Children.Add(firstNameLabel);
                grid.Children.Add(lastNameLabel, 1, 0);
                grid.Children.Add(phoneLabel, 2, 0);
                grid.Children.Add(phoneNumberLabel, 2, 1);

                return new ViewCell { View = grid };
            });

            listView.ItemTemplate = personDataTemplate;

            //
            await this.contactViewModel.BindContacts();

            listView.ItemsSource = this.contactViewModel.ContactList;


            listView.ItemSelected += async (sender, e) =>
            {
                Contacts contactItem = (Contacts)e.SelectedItem;
                string phoneNo = String.IsNullOrEmpty(contactItem.PhoneNo.ToString()) ? "" : contactItem.PhoneNo.ToString();
                await Navigation.PopAsync();
                var mainPage = new MainPage();
                mainPage.BindingContext = contactItem;
                new NavigationPage(mainPage);
            };
        }
    }
}
