using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Product
{
    public partial class product_create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //uploading image file
            //done successful
            if (newImgProd.HasFile)
            {
                try
                {
                    newImgProd.SaveAs(Server.MapPath("~/image/book/") + newImgProd.FileName);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO Book(Title, Description, Author, Price, Category, Quantity, Image, Language, SubCategory) values (@title, @desc, @author, @price, @cate, @quantity, @image, @language, @subCate)";
            
            SqlCommand cmdInsert = new SqlCommand(sql, cnn);

            cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text);
            cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text);
            cmdInsert.Parameters.AddWithValue("@author", txtAuthor.Text);
            cmdInsert.Parameters.AddWithValue("@price", txtPrice.Text);
            cmdInsert.Parameters.AddWithValue("@cate", ddlProductCategory.Text);
            cmdInsert.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            cmdInsert.Parameters.AddWithValue("@image", "~/image/book/" + newImgProd.FileName.ToString());
            cmdInsert.Parameters.AddWithValue("@language", ddlLanguage.Text);
            cmdInsert.Parameters.AddWithValue("@subCate", ddlSubCategory.Text);

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add product!'); window.location ='" + ResolveUrl("~/Staff/Product/product.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();
            
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
    }
}