using BAY003.UWP;
using System;
using System.Collections.Generic;
using Xamarin.Forms;

[assembly: Dependency(typeof(AddressBookInformation))]
namespace BAY003.UWP
{
    using Model;
    using System.Threading.Tasks;
    using Windows.ApplicationModel.Contacts;

    public class AddressBookInformation : IAddressBookInformation
    {
        public async Task<List<Contacts>> GetContacts()
        {
            var contactList = new List<Contacts>();

            var contactStore = await ContactManager.RequestStoreAsync();
            var contacts = await contactStore.FindContactsAsync();

            foreach (Contact contact in contacts)
            {
                // Note: on certain android device(Htc for example) it show name in DisplayName Field
                foreach (var item in contact.Phones)
                {
                    contactList.Add(new Contacts() { FirstName = contact.FirstName, LastName = contact.LastName, PhoneLabel = item.Kind.ToString(), PhoneNo = item.Number });
                }
            }

            return contactList;
        }
    }
}
