using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public int PhoneNumber { get; set; }
        public DateTime RegisteredDate { get; set; }
        public string Role { get; set; }

        public User(int id, string userName, string password, string email, string address, int phoneNumber, DateTime registeredDate, string role)
        {
            Id = id;
            UserName = userName;
            Password = password;
            Email = email;
            Address = address;
            PhoneNumber = phoneNumber;
            RegisteredDate = registeredDate;
            Role = role;
        }

        public User()
        {
        }
    }
}