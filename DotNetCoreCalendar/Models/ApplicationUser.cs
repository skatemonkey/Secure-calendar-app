using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetCoreCalendar.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string FullName { get; set; }
        public byte[] ProfilePicture { get; set; }

        public virtual ICollection<Event> Events { get; set; }

    }
}
