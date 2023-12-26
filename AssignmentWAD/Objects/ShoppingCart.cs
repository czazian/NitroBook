using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using static System.Net.Mime.MediaTypeNames;

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
                if (currentItem.bookID.Equals(newItem.bookID))
                {
                    System.Diagnostics.Debug.WriteLine("This is equal objects");
                    currentItem.selectedQuantity += newItem.selectedQuantity;

                    //Return since, everytime, only added one book. The book is found, so stop it.
                    return;
                }
            }


            //If the book is not found / it is the first item, baru add into the cart
            book.Add(newItem);
            System.Diagnostics.Debug.WriteLine("This is not equal objects");
        }

        public void removeItem(int bookID)
        {
            //book.RemoveAt(bookID);
            for (int i = 0; i < book.Count; i++)
            {
                {
                    if (book[i].bookID.Equals(bookID))
                    {
                        book.RemoveAt(i);
                        return;
                    }
                }
            }
        }

        public decimal calculate(int bookID, int qty)
        {
            decimal total = 0;
            foreach (Cart currentItem in book)
            {
                if (currentItem.bookID.Equals(bookID)){
                    total = currentItem.price * qty;
                }
            }

            return total;
        }
    }
}