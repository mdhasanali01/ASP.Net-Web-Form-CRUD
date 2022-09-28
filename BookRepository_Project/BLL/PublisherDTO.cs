using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookRepository_Project.BLL
{
    public class PublisherDTO
    {
        public int PublisherId { get; set; }
        public string PublisherName { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
    }
}