using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Order
{
    public partial class cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {

                //Obtain values
                int bookID = Int32.Parse(Request.QueryString["bookID"]);
                Label title = PreviousPage.FindControl("lblBookName") as Label;
                Label author = PreviousPage.FindControl("lblAuthorName") as Label;
                Label price = PreviousPage.FindControl("lblPrice") as Label;
                Label language = PreviousPage.FindControl("lblLanguage") as Label;
                TextBox selectedQuantity = PreviousPage.FindControl("txtQuantity") as TextBox;
                Label description = PreviousPage.FindControl("lblDescription") as Label;
                Image image = PreviousPage.FindControl("imgBook") as Image;

                //Object creation
                Cart book = new Cart(bookID, title.Text, author.Text, Double.Parse(price.Text), language.Text, Int32.Parse(selectedQuantity.Text), description.Text, image.ImageUrl);

                Console.WriteLine("Book : " + book);
            }
        }

        protected void imgBook_Click(object sender, ImageClickEventArgs e)
        {
           
        }
    }
}