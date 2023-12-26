using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Order
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //SESSION
                //In case the shopping cart is not empty, load the session into shoppingCart.
                ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];

                //In case the shopping cart is null, create a shopping cart, and add to the session.
                if (shoppingCart == null)
                {
                    shoppingCart = new ShoppingCart();
                    Session["shoppingCart"] = shoppingCart;
                }



                //Obtain values
                int bookID = Convert.ToInt32(Request.QueryString["bookID"]);
                int selectedQuantity = Convert.ToInt32(Request.QueryString["qty"]);


                SqlConnection conn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                conn = new SqlConnection(strConnection);

                conn.Open();

                string command = "SELECT * FROM Book WHERE BookID = @bookID";
                SqlCommand cmd = new SqlCommand(command, conn);
                cmd.Parameters.AddWithValue("@bookID", bookID);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    string msg = "";
                    while (reader.Read())
                    {
                        msg += reader["Title"].ToString() + "|" + reader["Author"].ToString() + "|" + reader["Price"].ToString() + "|" + reader["Image"].ToString();
                    }

                    string[] data = msg.Split('|');

                    //Object creation
                    Cart book = new Cart(bookID, data[0], data[1], Double.Parse(data[2]), selectedQuantity, data[3]);

                    shoppingCart.addItem(book);
                }

                //Define the data source for the repeater
                BookRepeater.DataSource = shoppingCart.getCartItems();
                BookRepeater.DataBind();
            }
        }

        protected void imgBook_Command(object sender, CommandEventArgs e)
        {
            string destination = "~/Product/IndividualProduct.aspx?bookID=" + e.CommandArgument;
            Response.Redirect(destination);
        }

    }
}