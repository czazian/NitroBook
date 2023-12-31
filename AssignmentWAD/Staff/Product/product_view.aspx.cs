using System;
using System.Collections.Generic;
using System.Configuration;
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
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
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
                txtAuthor.Text = book.GetValue(2).ToString();
                ddlProductCategory.SelectedValue = book.GetValue(3).ToString();

                int selectedIndex = ddlProductCategory.SelectedIndex;
                ddlSubCategory.Items.Clear();
                switch (selectedIndex)
                {
                    case 0:
                        ddlSubCategory.Items.Add("Fiction New Arrivals");
                        ddlSubCategory.Items.Add("Non-Fiction New Arrivals");
                        ddlSubCategory.Items.Add("Manga & Light Novel New Arrivals");
                        ddlSubCategory.Items.Add("Children's New Arrivals");
                        break;
                    case 1:
                        ddlSubCategory.Items.Add("Fantasy");
                        ddlSubCategory.Items.Add("Horror");
                        ddlSubCategory.Items.Add("General Fiction");
                        break;
                    case 2:
                        ddlSubCategory.Items.Add("Marketing & Sales");
                        ddlSubCategory.Items.Add("Computing & Information technology");
                        ddlSubCategory.Items.Add("Foods & Drinks");
                        break;
                    case 3:
                        ddlSubCategory.Items.Add("Character Stories");
                        ddlSubCategory.Items.Add("Picture Books");
                        break;
                    case 4:
                        ddlSubCategory.Items.Add("Reincarnation");
                        ddlSubCategory.Items.Add("Action");
                        ddlSubCategory.Items.Add("Romance");
                        ddlSubCategory.Items.Add("Slice-of-Life");
                        break;
                }
                txtPrice.Text = book.GetValue(4).ToString();
                ddlLanguage.SelectedValue = book.GetValue(5).ToString();
                txtQuantity.Text = book.GetValue(6).ToString();
                txtDesc.Text = book.GetValue(7).ToString();
                image.ImageUrl = book.GetValue(8).ToString();
                ddlSubCategory.SelectedValue = book.GetValue(9).ToString();
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