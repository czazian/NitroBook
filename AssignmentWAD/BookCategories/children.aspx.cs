using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.BookCategories
{
    public partial class children : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CharStoryRepeater.DataSource = CharStorySource;
            CharStoryRepeater.DataBind();

            PicBookRepeater.DataSource = PicBookSource;
            PicBookRepeater.DataBind();

            int totalShow = CharStoryRepeater.Items.Count + PicBookRepeater.Items.Count;
            lblTotalShow.Text = "Showing 1 - " + totalShow.ToString();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {

        }

        protected void btnViewMore_Click(object sender, EventArgs e)
        {

        }

        protected void lkbSubCat1_Click(object sender, EventArgs e)
        {
        }

        protected void lkbSubCat2_Click(object sender, EventArgs e)
        {

        }

        protected void btnPriceRange_Click(object sender, EventArgs e)
        {
            try
            {
                double maxPrice = double.Parse(txtMaxPrice.Text);
                double minPrice = double.Parse(txtMinPrice.Text);

                if (maxPrice < 0 || minPrice < 0)
                {
                    throw new Exception("*Value must be non-negative");
                }
                else if (maxPrice < minPrice)
                {
                    throw new Exception("*Max price must be larger than min price");
                }
                else if (maxPrice == minPrice)
                {
                    throw new Exception("*Max price and min price cannot be same");
                }


                // Update the SelectCommand with the new SQL statement
                CharStorySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Character Stories' AND Price BETWEEN @MinPrice AND @MaxPrice";
                CharStorySource.SelectParameters.Clear();
                CharStorySource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                CharStorySource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                CharStoryRepeater.DataBind();

                if (CharStoryRepeater.Items.Count == 0)
                {
                    lblCharStoryNotFound.Text = "Sorry, No Result Found.";
                }


                // Update the SelectCommand with the new SQL statement
                PicBookSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Picture Books' AND Price BETWEEN @minPrice AND @maxPrice";
                PicBookSource.SelectParameters.Clear();
                PicBookSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                PicBookSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                PicBookRepeater.DataBind();

                if (PicBookRepeater.Items.Count == 0)
                {
                    lblPicBookNotFound.Text = "Sorry, No Result Found.";
                }

                int totalShow = CharStoryRepeater.Items.Count + PicBookRepeater.Items.Count;
                lblTotalShow.Text = "Showing 1 - " + totalShow.ToString();
            }
            catch (FormatException ex)
            {
                lblErrMsg.Text = "*Only number accepted";
            }
            catch (Exception ex)
            {
                lblErrMsg.Text = ex.Message;

            }
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFilter.SelectedValue.ToString() == "0")
            {
                CharStorySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Character Stories' ORDER BY Price ASC";
                CharStorySource.SelectParameters.Clear();
                CharStoryRepeater.DataBind();


                PicBookSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Picture Books' ORDER BY Price ASC";
                PicBookSource.SelectParameters.Clear();
                PicBookRepeater.DataBind();

            }
            else if(ddlFilter.SelectedValue.ToString() == "1")
            {
                CharStorySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Character Stories' ORDER BY Price DESC";
                CharStorySource.SelectParameters.Clear();
                CharStoryRepeater.DataBind();


                PicBookSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Picture Books' ORDER BY Price DESC";
                PicBookSource.SelectParameters.Clear();
                PicBookRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "2")
            {
                CharStorySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Character Stories' ORDER BY Title ASC";
                CharStorySource.SelectParameters.Clear();
                CharStoryRepeater.DataBind();


                PicBookSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Picture Books' ORDER BY Title ASC";
                PicBookSource.SelectParameters.Clear();
                PicBookRepeater.DataBind();
            }else if (ddlFilter.SelectedValue.ToString() == "3")
            {
                CharStorySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Character Stories' ORDER BY Title DESC";
                CharStorySource.SelectParameters.Clear();
                CharStoryRepeater.DataBind();


                PicBookSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND SubCategory = 'Picture Books' ORDER BY Title DESC";
                PicBookSource.SelectParameters.Clear();
                PicBookRepeater.DataBind();
            }
        }

    }
}