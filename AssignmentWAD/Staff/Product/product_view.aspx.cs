using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Product
{
    public partial class product_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\xampp\htdocs\Web-Application-Development\AssignmentWAD\App_Data\NitroBooks.mdf;Integrated Security=True";

            cnn = new SqlConnection(connetionString);
            cnn.Open();

            String sql = "";

            sql = "SELECT * FROM Book WHERE BookID=@id";

            SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

            cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["bookID"]);
            SqlDataReader book = cmdRetrieve.ExecuteReader();

            if (book.HasRows && book.Read())
            {
                //work, can get query string
                txtTitle.Text = book.GetValue(1).ToString();
                txtDesc.Text = book.GetValue(2).ToString();
                txtAuthor.Text = book.GetValue(3).ToString();
                txtPrice.Text = book.GetValue(4).ToString();
                ddlProductCategory.SelectedValue = book.GetValue(5).ToString();
                txtQuantity.Text = book.GetValue(6).ToString();
                image.ImageUrl = book.GetValue(7).ToString();
                ddlLanguage.SelectedValue = book.GetValue(8).ToString();
           
            }
            else
            {
                Response.Write("Invalid Records");
            }

            cmdRetrieve.Dispose();
            cnn.Close();
        }
    }
}