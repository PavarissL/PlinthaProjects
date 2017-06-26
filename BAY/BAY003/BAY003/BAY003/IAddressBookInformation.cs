using BAY003.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAY003
{
    public interface IAddressBookInformation
    {
        Task<List<Contacts>> GetContacts();
    }
}
