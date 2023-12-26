using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace AssignmentWAD
{
    public class ShoppingCart
    {
        protected List<Cart> book;

        public ShoppingCart()
        {
            book = new List<Cart>();
        }

        public List<Cart> getCartItems()
        {
            return book;
        }


        //Problematic : When I click a book and return, the book will be automatically add again 
        public void addItem(Cart newItem)
        {
            //Loop through a list, until the last item, or until a match item found
            foreach (Cart currentItem in book)
            {
                //If there is any match elements, the quantity of the book will increase based on the customer new entered quantity
                if (currentItem.Equals(newItem))
                {
                    currentItem.selectedQuantity += newItem.selectedQuantity;

                    //Return since, everytime, only added one book. The book is found, so stop it.
                    return;
                }
            }


            //If the book is not found / it is the first item, baru add into the cart
            book.Add(newItem);
        }



        public void removeItem(int bookID)
        {
            book.RemoveAt(bookID);
        }

    }
}