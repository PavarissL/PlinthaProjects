using BAY003.iOS;
using System;
using System.Collections.Generic;
using System.Linq;
using Xamarin.Forms;

[assembly: Dependency(typeof(AddressBookInformation))]
namespace BAY003.iOS
{
    using Model;
    using System.Threading.Tasks;
    using Xamarin.Contacts;

    public class AddressBookInformation : IAddressBookInformation
    {
        /// <summary>
        /// The book.
        /// </summary>
        private AddressBook book = null;

        /// <summary>
        /// Initializes a new instance of the <see cref="AddressBookInformation"/> class.
        /// </summary>
        public AddressBookInformation()
        {
            this.book = new AddressBook();
        }

        public async Task<List<Contacts>> GetContacts()
        {
            var contacts = new List<Contacts>();

            // Observation:
            // On device RequestPermission() returns false sometimes so you can use  this.book.RequestPermission().Result (remove await)
            var permissionResult = await this.book.RequestPermission();
            if (permissionResult)
            {
                if (!this.book.Any())
                {
                    Console.WriteLine("No contacts found");
                }
                
                foreach (Contact contact in book)
                {
                    // Note: on certain android device(Htc for example) it show name in DisplayName Field
                    foreach (var item in contact.Phones)
                    {
                        contacts.Add(new Contacts() { FirstName = contact.FirstName, LastName = contact.LastName, PhoneLabel = item.Label, PhoneNo = item.Number });
                    }
                }
            }

            return contacts;
        }
    }
}