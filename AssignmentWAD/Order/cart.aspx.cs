using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Order
{
    public partial class cart : System.Web.UI.Page
    {

        decimal overallPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Customer/customerLogin.aspx");
            }
            else
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
                            msg += reader["Title"].ToString() + "|" + reader["Author"].ToString() + "|" + reader["Price"] + "|" + reader["Image"].ToString();
                        }

                        string[] data = msg.Split('|');

                        //Object creation
                        decimal p = Convert.ToDecimal(data[2]);
                        Cart book = new Cart(bookID, data[0], data[1], Decimal.Round(p, 2), selectedQuantity, data[3]);

                        shoppingCart.addItem(book);
                    }

                    //Define the data source for the repeater
                    BookRepeater.DataSource = shoppingCart.getCartItems();
                    BookRepeater.DataBind();


                }

            }

        }

        protected void imgBook_Command(object sender, CommandEventArgs e)
        {
            string destination = "~/Product/IndividualProduct.aspx?bookID=" + e.CommandArgument;
            Response.Redirect(destination, false);
            Context.ApplicationInstance.CompleteRequest();
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Obtian the bookid of the clicked item in the cart 
            int index = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            System.Diagnostics.Debug.WriteLine("Idx of Item : " + index);

            //Get all cart items stored in the session
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];


            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }

            shoppingCart.removeItem(index);
            Response.Redirect("~/Order/cart.aspx"); //Refresh page
        }

        protected void BookRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
                if (shoppingCart == null)
                {
                    shoppingCart = new ShoppingCart();
                    Session["shoppingCart"] = shoppingCart;
                }
                else
                {
                    TextBox qty = e.Item.FindControl("currentQty") as TextBox;
                    HiddenField bookID = e.Item.FindControl("hdnID") as HiddenField;
                    decimal price = shoppingCart.calculate(Convert.ToInt32(bookID.Value), Convert.ToInt32(qty.Text));

                    //Price for individual product
                    ((Label)e.Item.FindControl("lblTotal")).Text = "RM " + (price).ToString();


                    //Calculate overall total
                    overallPrice += price;
                    //Price for overall
                    System.Diagnostics.Debug.WriteLine("Overall : " + overallPrice);
                    lblAmount.Text = overallPrice.ToString();

                }

            }
        }

    }
}