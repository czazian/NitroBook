using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace AssignmentWAD.Order
{
    public partial class IndividualProduct : System.Web.UI.Page
    {
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
                    lblPrice.Text = book["Price"].ToString();
                    lblLanguage.Text = book["Language"].ToString();
                    lblAvailability.Text = book["Quantity"].ToString();
                    lblDescription.Text = book["Description"].ToString();
                }
            }

            conn.Close();
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            string postback = "~/Order/cart.aspx?bookID=" + Request.QueryString["bookID"] + "&qty=" + txtQuantity.Text;
            Response.Redirect(postback);
        }
    }
}