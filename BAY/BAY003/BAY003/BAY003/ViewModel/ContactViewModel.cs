using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAY003.ViewModel
{
    using Model;
    using System.Collections.ObjectModel;
    using Xamarin.Forms;

    public class ContactViewModel : BaseViewModel
    {
        public ObservableCollection<Contacts> ContactList { get; set; }

        public ContactViewModel()
        {
            ContactList = new ObservableCollection<Contacts>();
        }

        public async Task BindContacts()
        {
            var addressBook = DependencyService.Get<IAddressBookInformation>();
            if (addressBook != null)
            {
                //get contact form mobile platform .
                var allAddress = await addressBook.GetContacts();

                foreach (var c in allAddress)
                {
                    var name = c.FirstName + " " + c.LastName + " : " + c.PhoneLabel + " " +c.PhoneNo;
                }

                this.ContactList = new ObservableCollection<Contacts>(allAddress);

            }
        }
    }
}
