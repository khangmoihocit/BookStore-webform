using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace btl_laptrinhweb.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public double PriceNew { get; set; }
        public double PriceOld { get; set; }
        public int Quantity { get; set; }
        public int CategoryId { get; set; }
        public int AuthorId { get; set; }
        public int PublisherId {  get; set; }
        public Book() { }

        public Book(int id, string title, string description, string image, double priceNew, double priceOld, int quantity, int categoryId, int authorId, int publisherId)
        {
            Id = id;
            Title = title;
            Description = description;
            Image = image;
            PriceNew = priceNew;
            PriceOld = priceOld;
            Quantity = quantity;
            CategoryId = categoryId;
            AuthorId = authorId;
            PublisherId = publisherId;
        }
    }
}