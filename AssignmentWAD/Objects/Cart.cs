using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssignmentWAD
{
    public class Cart
    {
        public int bookID;
        public string title;
        public string author;
        public double price;
        public string language;
        public int selectedQuantity;
        public string description;
        public string image;

        public Cart(int bookID, string title, string author, double price, string language, int selectedQuantity, string description, string image)
        {
            this.bookID = bookID;
            this.title = title;
            this.author = author;
            this.price = price;
            this.language = language;
            this.selectedQuantity = selectedQuantity;
            this.description = description;
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
        public string getLanguage()
        {
            return language;
        }

        public void setLanguage(string language)
        {
            this.language = language;
        }

        public string getDescription()
        {
            return description;
        }

        public void setDescription(string description)
        {
            this.description = description;
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
