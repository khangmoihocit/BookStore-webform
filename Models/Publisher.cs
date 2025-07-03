using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class Publisher
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public Publisher() { }

        public Publisher(int id, string name, string address, string phoneNumber)
        {
            Id = id;
            Name = name;
            Address = address;
            PhoneNumber = phoneNumber;
        }
    }
}