using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;
using System.Security.Policy;
using System.Threading;
using AssignmentWAD.Staff.Order;
using System.Xml.Linq;

namespace AssignmentWAD.Order
{
    public partial class IndividualProduct : System.Web.UI.Page
    {
        public decimal percentageOfOne;
        public decimal percentageOfTwo;
        public decimal percentageOfThree;
        public decimal percentageOfFour;
        public decimal percentageOfFive;
        protected void Page_Load(object sender, EventArgs e)
        {

            //Query String
            string bookID = Request.QueryString["bookID"];


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
            if (different == 0)
            {
                rangevalidator.MaximumValue = different.ToString();
                rangevalidator.MinimumValue = different.ToString();
            }
            else
            {
                rangevalidator.MaximumValue = different.ToString();
                rangevalidator.MinimumValue = "1";
            }

            conn.Close();


            SqlConnection conn2;
            string strConnection2 = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn2 = new SqlConnection(strConnection2);

            conn2.Open();

            //Display Comment
            string command = "SELECT * FROM [Comment] c, [User] u, [Book] b WHERE c.UserID = u.UserID AND b.BookID = c.BookID AND c.BookID = @BookID ORDER BY c.RateStar ASC";

            SqlCommand sqlCommand = new SqlCommand(command, conn2);
            sqlCommand.Parameters.AddWithValue("@BookID", bookID);
            SqlDataReader reader2 = sqlCommand.ExecuteReader();
            CommentRepeater.DataSource = reader2;
            CommentRepeater.DataBind();

            conn2.Close();

            //Count the 1,2,3,4,5 stars of each book comment
            SqlConnection conn3;
            string strConnection3 = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn3 = new SqlConnection(strConnection3);

            conn3.Open();
            int one;
            int two;
            int three;
            int four;
            int five;

            string cmd1Star = "SELECT COUNT(*) FROM [Comment] c, [Book] b WHERE c.BookID = b.BookID AND c.RateStar = 1 AND c.BookID = @BookID";
            string cmd2Star = "SELECT COUNT(*) FROM [Comment] c, [Book] b WHERE c.BookID = b.BookID AND c.RateStar = 2 AND c.BookID = @BookID";
            string cmd3Star = "SELECT COUNT(*) FROM [Comment] c, [Book] b WHERE c.BookID = b.BookID AND c.RateStar = 3 AND c.BookID = @BookID";
            string cmd4Star = "SELECT COUNT(*) FROM [Comment] c, [Book] b WHERE c.BookID = b.BookID AND c.RateStar = 4 AND c.BookID = @BookID";
            string cmd5Star = "SELECT COUNT(*) FROM [Comment] c, [Book] b WHERE c.BookID = b.BookID AND c.RateStar = 5 AND c.BookID = @BookID";
            SqlCommand cmd1 = new SqlCommand(cmd1Star, conn3);
            SqlCommand cmd2 = new SqlCommand(cmd2Star, conn3);
            SqlCommand cmd3 = new SqlCommand(cmd3Star, conn3);
            SqlCommand cmd4 = new SqlCommand(cmd4Star, conn3);
            SqlCommand cmd5 = new SqlCommand(cmd5Star, conn3);
            cmd1.Parameters.AddWithValue("@BookID", Request.QueryString["bookID"]);
            cmd2.Parameters.AddWithValue("@BookID", Request.QueryString["bookID"]);
            cmd3.Parameters.AddWithValue("@BookID", Request.QueryString["bookID"]);
            cmd4.Parameters.AddWithValue("@BookID", Request.QueryString["bookID"]);
            cmd5.Parameters.AddWithValue("@BookID", Request.QueryString["bookID"]);
            one = (int)cmd1.ExecuteScalar();
            two = (int)cmd2.ExecuteScalar();
            three = (int)cmd3.ExecuteScalar();
            four = (int)cmd4.ExecuteScalar();
            five = (int)cmd5.ExecuteScalar();
            lblOneStar.Text = one.ToString();
            lblTwoStar.Text = two.ToString();
            lblThreeStar.Text = three.ToString();
            lblFourStar.Text = four.ToString();
            lblFiveStar.Text = five.ToString();


            int totalNumberOfItems = one + two + three + four + five;
            if (one != 0)
            {
                percentageOfOne = (decimal)one * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfOne = 0;
            }

            if (two != 0)
            {
                percentageOfTwo = (decimal)two * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfTwo = 0;
            }

            if (three != 0)
            {
                percentageOfThree = (decimal)three * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfThree = 0;
            }

            if (four != 0)
            {
                percentageOfFour = (decimal)four * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfFour = 0;
            }

            if (five != 0)
            {
                percentageOfFive = (decimal)five * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfFive = 0;
            }



            //Calculate the customer reviews by 5.0 decimal point
            //ranking.Text = "N/A"; //Testing Purpose

            lblRate.Text = totalNumberOfItems.ToString();
            decimal circleMark = 0;
            if (totalNumberOfItems != 0)
            {
                circleMark = ((one * 1) + (two * 2) + (three * 3) + (four * 4) + (five * 5)) / (one + two + three + four + five);
                lblRate.Text = circleMark.ToString("F1");
                if (circleMark >= 4)
                {
                    ranking.Text = "Excellent";
                }
                else if (circleMark >= 3)
                {
                    ranking.Text = "Good";
                }
                else
                {
                    ranking.Text = "Unsatisfied";
                }
            }
            else
            {
                lblRate.Text = circleMark.ToString("F1");
                ranking.Text = "N/A";
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


        //The filter and sorting feature
        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

            string bookID = Request.QueryString["bookID"];
            System.Diagnostics.Debug.WriteLine("Query String : " + bookID);

            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            if (ddlFilter.SelectedValue.Equals("0"))
            {

                string command = "SELECT * " +
                    "FROM [Comment] c, [User] u, [Book] b " +
                    "WHERE c.UserID = u.UserID " +
                    "AND b.BookID = c.BookID " +
                    "AND c.BookID = @BookID " +
                    "ORDER BY c.RateStar ASC";

                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("1"))
            {
                string command = "SELECT * " +
                    "FROM [Comment] c, [User] u, [Book] b " +
                    "WHERE c.UserID = u.UserID " +
                    "AND b.BookID = c.BookID " +
                    "AND c.BookID = @BookID " +
                    "ORDER BY c.RateStar DESC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("2"))
            {
                string command = "SELECT * " +
                    "FROM [Comment] c, [User] u, [Book] b " +
                    "WHERE c.UserID = u.UserID " +
                    "AND b.BookID = c.BookID " +
                    "AND c.BookID = @BookID " +
                    "ORDER BY c.CommentDate DESC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("3"))
            {
                string command = "SELECT * " +
                    "FROM [Comment] c, [User] u, [Book] b " +
                    "WHERE c.UserID = u.UserID " +
                    "AND b.BookID = c.BookID " +
                    "AND c.BookID = @BookID " +
                    "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            } 
            else if (ddlFilter.SelectedValue.Equals("4"))
            {
                string command = "SELECT * " +
                        "FROM [Comment] c, [User] u, [Book] b " +
                        "WHERE c.UserID = u.UserID " +
                        "AND b.BookID = c.BookID " +
                        "AND c.BookID = @BookID " +
                        "AND c.RateStar = 1" + 
                        "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("5"))
            {
                string command = "SELECT * " +
                        "FROM [Comment] c, [User] u, [Book] b " +
                        "WHERE c.UserID = u.UserID " +
                        "AND b.BookID = c.BookID " +
                        "AND c.BookID = @BookID " +
                        "AND c.RateStar = 2" +
                        "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("6"))
            {
                string command = "SELECT * " +
                        "FROM [Comment] c, [User] u, [Book] b " +
                        "WHERE c.UserID = u.UserID " +
                        "AND b.BookID = c.BookID " +
                        "AND c.BookID = @BookID " +
                        "AND c.RateStar = 3" +
                        "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("7"))
            {
                    string command = "SELECT * " +
                       "FROM [Comment] c, [User] u, [Book] b " +
                       "WHERE c.UserID = u.UserID " +
                       "AND b.BookID = c.BookID " +
                       "AND c.BookID = @BookID " +
                       "AND c.RateStar = 4" +
                       "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("8"))
            {
                string command = "SELECT * " +
                        "FROM [Comment] c, [User] u, [Book] b " +
                        "WHERE c.UserID = u.UserID " +
                        "AND b.BookID = c.BookID " +
                        "AND c.BookID = @BookID " +
                        "AND c.RateStar = 5" +
                        "ORDER BY c.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@BookID", bookID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
        }
    }
}