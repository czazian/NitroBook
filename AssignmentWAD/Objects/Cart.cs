using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssignmentWAD
{
    public class Cart
    {
        public int bookID {  get; set; }
        public string title { get; set; }
        public string author { get; set; }
        public double price { get; set; }
        public int selectedQuantity { get; set; }
        public string image { get; set; }

        public Cart(int bookID, string title, string author, double price, int selectedQuantity, string image)
        {
            this.bookID = bookID;
            this.title = title;
            this.author = author;
            this.price = price;
            this.selectedQuantity = selectedQuantity;
            this.image = image;
        }

        public int getBookid()
        {
            return bookID;
        }

        public double getPrice()
        {
            return price;
        }

        public void setPrice(Double price)
        {
            this.price = price;
        }

        public int getQuantity()
        {
            return selectedQuantity;
        }

        public void setQuantity(int selectedQuantity)
        {
            this.selectedQuantity = selectedQuantity;
        }

        public string getTitle()
        {
            return title;
        }

        public void setTitle(string title)
        {
            this.title = title;
        }

        public string getAuthor()
        {
            return author;
        }

        public void setAuthor(string author)
        {
            this.author = author;
        }

        public string getImage()
        {
            return image;
        }

        public void setImage(string image)
        {
            this.image = image;
        }
    }
}
