using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Product
{
    public partial class product_create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\xampp\htdocs\Web-Application-Development\AssignmentWAD\App_Data\NitroBooks.mdf;Integrated Security=True";

            cnn = new SqlConnection(connetionString);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO Book(Title, Description, Author, Price, Category, Quantity, Image, Language) values (@title, @desc, @author, @price, @cate, @quantity, @image, @language)";
            
            SqlCommand cmdInsert = new SqlCommand(sql, cnn);

            cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text);
            cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text);
            cmdInsert.Parameters.AddWithValue("@author", txtAuthor.Text);
            cmdInsert.Parameters.AddWithValue("@price", txtPrice.Text);
            cmdInsert.Parameters.AddWithValue("@cate", ddlProductCategory.Text);
            cmdInsert.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            cmdInsert.Parameters.AddWithValue("@image", newImgProd.FileName.ToString());
            cmdInsert.Parameters.AddWithValue("@language", ddlLanguage.Text);

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Staff/Product/product.aspx");
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();
            
        }
    }
}