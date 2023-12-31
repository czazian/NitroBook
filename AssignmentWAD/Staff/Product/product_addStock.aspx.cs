using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Product
{
    public partial class product_addStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }

            //only load when first time initialize the page
            if (!IsPostBack)
            {
                //retrieve query string and display it
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "SELECT * FROM Book WHERE BookID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                //get book ID from query string
                cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["bookID"]);
                SqlDataReader book = cmdRetrieve.ExecuteReader();

                if (book.HasRows && book.Read())
                {
                    //work, can get query string
                    txtTitle.Text = book.GetValue(1).ToString();
                    txtAuthor.Text = book.GetValue(2).ToString();
                    ddlProductCategory.SelectedValue = book.GetValue(3).ToString();

                    //for flexible category and sub-category
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
                    txtCurrentQuantity.Text = book.GetValue(6).ToString();
                    txtDesc.Text = book.GetValue(7).ToString();
                    image.ImageUrl = book.GetValue(8).ToString();
                    ddlSubCategory.SelectedValue = book.GetValue(9).ToString();
                    //latest = current + add (0)
                    txtLatestQuantity.Text = (int.Parse(book.GetValue(6).ToString()) + int.Parse(txtAddQuantity.Text)).ToString();

                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
            else //post back when user input add quantity
            {
                //latest = current + add (integer)
                int currentQuantity;
                if (int.TryParse(txtCurrentQuantity.Text, out currentQuantity))
                {
                    int addQuantity;
                    if (int.TryParse(txtAddQuantity.Text, out addQuantity))
                    {
                        txtLatestQuantity.Text = (currentQuantity + addQuantity).ToString();
                    }
                    else
                    {
                        // Handle the case where txtAddQuantity is not a valid integer
                    }
                }
                else
                {
                    // Handle the case where txtCurrentQuantity is not a valid integer
                }
            }

        }

        protected void ddlProductCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE Book SET Quantity = (Quantity + @quantityAdd) WHERE BookID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@quantityAdd", txtAddQuantity.Text);

            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["bookID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add stock!'); window.location ='" + ResolveUrl("~/Staff/Product/product.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to update!");
            }


            cmdUpdate.Dispose();
            cnn.Close();
        }

        protected void btnShortCutQuantity_Click(object sender, EventArgs e)
        {
            Button clickedShortCutQuantityBtn = sender as Button;
            switch (clickedShortCutQuantityBtn.ID)
            {
                case "btn10":
                    txtAddQuantity.Text = "10";
                    break;
                case "btn20":
                    txtAddQuantity.Text = "20";
                    break;
                case "btn30":
                    txtAddQuantity.Text = "30";
                    break;
                case "btn40":
                    txtAddQuantity.Text = "40";
                    break;
                case "btn50":
                    txtAddQuantity.Text = "50";
                    break;
                default:
                    txtAddQuantity.Text = "0";
                    break;
            }

            txtLatestQuantity.Text = (int.Parse(txtCurrentQuantity.Text) + int.Parse(txtAddQuantity.Text)).ToString();
        }

        protected void btnCal_Click(object sender, EventArgs e)
        {
            txtLatestQuantity.Text = (int.Parse(txtCurrentQuantity.Text) + int.Parse(txtAddQuantity.Text)).ToString();
        }
    }
}