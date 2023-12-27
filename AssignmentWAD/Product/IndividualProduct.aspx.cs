using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;

namespace AssignmentWAD.Order
{
    public partial class IndividualProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Query String
            string bookID = Request.QueryString["bookID"];

            if (!Page.IsPostBack)
            {
                //Connection Establish
                SqlConnection conn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                conn = new SqlConnection(strConnection);

                conn.Open();

                //Command & Execution 
                string retrieve = "SELECT * FROM Book WHERE BOOKID = @bookID";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@bookID", bookID);

                SqlDataReader book = cmd.ExecuteReader(); //More than 1 value

                //Data Assignment
                if (book.HasRows)  //If the value from database is not empty
                {
                    //Read() is required to get the data
                    while (book.Read())
                    {
                        imgBook.ImageUrl = book["Image"].ToString();
                        lblBookName.Text = book["Title"].ToString();
                        lblAuthorName.Text = book["Author"].ToString();
                        lblPrice.Text = "RM " + book["Price"].ToString();
                        lblLanguage.Text = book["Language"].ToString();
                        lblAvailability.Text = book["Quantity"].ToString();
                        lblDescription.Text = book["Description"].ToString();
                        lblCategory.Text = book["Category"].ToString(); 
                    }
                }

                //Check if cart already has it, then get it quantity in the cart, and compare with the quantity available in DB
                //to know how many quantity can be selected
                ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
                if (shoppingCart == null)
                {
                    shoppingCart = new ShoppingCart();
                    Session["shoppingCart"] = shoppingCart;
                }
                List<Cart> cartItems = shoppingCart.getCartItems();

                int currentQty = getCurrentQty(Convert.ToInt32(bookID), cartItems);
                int availableQty = getAvailableQuantity(Convert.ToInt32(bookID));
                //System.Diagnostics.Debug.WriteLine("Current : " + currentQty);
                //System.Diagnostics.Debug.WriteLine("Available : " + availableQty);


                int different = availableQty - currentQty;
                if(different == 0)
                {
                    rangevalidator.MaximumValue = different.ToString();
                    rangevalidator.MinimumValue = different.ToString();
                } else
                {
                    rangevalidator.MaximumValue = different.ToString();
                    rangevalidator.MinimumValue = "1";
                }

            }
        }

        public int getAvailableQuantity(int bookID)
        {
            //Connection Establish
            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            //To Get the available quantity
            string command2 = "SELECT Quantity FROM Book WHERE BookID = @bookID";
            SqlCommand cmd2 = new SqlCommand(command2, conn);
            cmd2.Parameters.AddWithValue("@bookID", bookID);

            return (int)cmd2.ExecuteScalar();
        }

        public int getCurrentQty(int bookID, List<Cart> cartItems)
        {
            int currentQty = 0;
            foreach (Cart cart in cartItems)
            {
                if (cart.bookID.Equals(bookID))
                {
                    currentQty = cart.selectedQuantity;
                    break;
                }
            }
            return currentQty;
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            string postback = "~/Order/cart.aspx?bookID=" + Request.QueryString["bookID"] + "&qty=" + txtQuantity.Text;
            Response.Redirect(postback, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}