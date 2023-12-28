using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Order
{
    public partial class checkout : System.Web.UI.Page
    {
        decimal overallPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //In case the shopping cart is not empty, load the session into shoppingCart.
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];

            //In case the shopping cart is null, create a shopping cart, and add to the session.
            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }

            List<Cart> cartItems = shoppingCart.getCartItems();
            Repeater1.DataSource = cartItems;
            Repeater1.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Order/cart.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
                    Label qty = e.Item.FindControl("lblQty") as Label;
                    HiddenField bookID = e.Item.FindControl("hdnID") as HiddenField;
                    decimal price = shoppingCart.calculate(Convert.ToInt32(bookID.Value), Convert.ToInt32(qty.Text));

                    //Price for individual product
                    ((Label)e.Item.FindControl("lblTotal")).Text = "RM " + (price).ToString();


                    //Calculate overall total
                    overallPrice += price;
                    //Price for overall
                    System.Diagnostics.Debug.WriteLine("Overall : " + overallPrice);
                    lblOverallTotal.Text = overallPrice.ToString();



                    //Final Price Calculation
                    lblShippingAmount.Text = getShippingFee().ToString("C2");
                    lblTaxAmount.Text = getTax().ToString("C2");
                    lblDiscountAmount.Text = getDiscount().ToString("C2");
                    lblTaxAmount.Text = getTax().ToString("C2");
                    lblOverallTotalPayment.Text = getOverllTotal().ToString("C2");
                }

            }
        }


        //Methods for calculation
        public decimal getOverllTotal()
        {
            return overallPrice + getShippingFee() + getTax() - getDiscount();
        }

        //Shipping fee is free, if purchase over 200
        public decimal getShippingFee()
        {
            if(overallPrice >= 200)
            {
                return 0;
            } else
            {
                return 25;
            }
        }

        //Purchase over or equal to RM 200, 10% discount
        public decimal getDiscount()
        {
            decimal discount = 0;
            if(overallPrice >= 200)
            {
                discount = overallPrice * (decimal)0.1;
            } else
            {
                discount = 0;
            }
            return discount;
        }

        //6% of tax applied to every purchase
        public decimal getTax()
        {
            return overallPrice * (decimal)0.06;
        }



        ///CREATE ORDER
        protected void btnSubmitOdr_Click(object sender, EventArgs e)
        {
            //Obtian values required
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }
            List<Cart> items = shoppingCart.getCartItems();
            int userID = Convert.ToInt32(Session["UserID"]);
            System.Diagnostics.Debug.WriteLine("Checkout - UserID : " + userID);
            //int userID = 2; //For Testing Purpose

            //DB
            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            //Processing
            //Insert to Order Table
            string command1 = "INSERT INTO [Order] VALUES (@Status, @UserID)" + "SELECT SCOPE_IDENTITY()";
            SqlCommand cmd1 = new SqlCommand(command1, conn);
            cmd1.Parameters.AddWithValue("@Status", "Pending");
            cmd1.Parameters.AddWithValue("@UserID", userID);
            string insertedOrderID = Convert.ToString(cmd1.ExecuteScalar());

            //Insert to OrderDetails Table
            string command2 = "INSERT INTO [OrderDetails] VALUES (@BookID, @OrderID, @Quantity)";
            SqlCommand cmd2 = new SqlCommand(command2, conn);

            foreach(Cart item in items)
            {
                cmd2.Parameters.Clear(); 
               
                cmd2.Parameters.AddWithValue("@BookID", item.bookID);
                cmd2.Parameters.AddWithValue("@OrderID", insertedOrderID);
                cmd2.Parameters.AddWithValue("@Quantity", item.selectedQuantity);
                cmd2.ExecuteNonQuery();

            }

            //Insert to Payment Table
            DateTime dateTime = DateTime.UtcNow.Date;
            dateTime.ToString("dd/MM/yyyy");
            string command3 = "INSERT INTO [Payment] VALUES (@PaymentDate, @TotalAmount, @PaymentMethod, @ShippingAddress, @OrderID)";
            SqlCommand cmd3 = new SqlCommand(command3, conn);
            cmd3.Parameters.AddWithValue("@PaymentDate", dateTime);
            cmd3.Parameters.AddWithValue("@TotalAmount", getOverllTotal());
            cmd3.Parameters.AddWithValue("@PaymentMethod", lblPaymentMethod.Text);
            cmd3.Parameters.AddWithValue("@ShippingAddress", txtAddress.Text);
            cmd3.Parameters.AddWithValue("@OrderID", insertedOrderID);
            cmd3.ExecuteNonQuery();

            clearCart();

            Response.Redirect("~/Order/completeOrder.aspx?orderID=" + insertedOrderID + "&reachDate=" + dateTime.AddDays(5).ToString("dd/MM/yyyy"));
        }

        public void clearCart()
        {
            Session.Remove("shoppingCart");
        }
    }
}