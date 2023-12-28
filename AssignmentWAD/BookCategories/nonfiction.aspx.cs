using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.BookCategories
{
    public partial class nonfiction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SalesRepeater.DataSource = SalesSource;
            SalesRepeater.DataBind();

            ITRepeater.DataSource = ITSource;
            ITRepeater.DataBind();

            FoodDrinkRepeater.DataSource = FoodDrinkSource;
            FoodDrinkRepeater.DataBind();

            int totalShow = SalesRepeater.Items.Count + ITRepeater.Items.Count + FoodDrinkRepeater.Items.Count;
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

        protected void btnPriceRange_Click(object sender, EventArgs e)
        {
            try
            {
                double maxPrice = double.Parse(txtMaxPrice.Text);
                double minPrice = double.Parse(txtMinPrice.Text);

                if (maxPrice < 0 || minPrice < 0)
                {
                    throw new Exception("*Value must be non-negative.");
                }
                else if (maxPrice < minPrice)
                {
                    throw new Exception("*Max price must be larger than min price");
                }

                // Update the SelectCommand with the new SQL statement
                SalesSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Marketing & Sales' AND Price BETWEEN @MinPrice AND @MaxPrice";
                SalesSource.SelectParameters.Clear();
                SalesSource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                SalesSource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                SalesRepeater.DataBind();

                if (SalesRepeater.Items.Count == 0)
                {
                    lblSalesNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblSalesNotFound.Visible = false;
                }


                // Update the SelectCommand with the new SQL statement
                ITSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Computing & Information Technology' AND Price BETWEEN @minPrice AND @maxPrice";
                ITSource.SelectParameters.Clear();
                ITSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                ITSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                ITRepeater.DataBind();

                if (ITRepeater.Items.Count == 0)
                {
                    lblITNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblITNotFound.Visible = false;
                }

                // Update the SelectCommand with the new SQL statement
                FoodDrinkSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Food & Drinks' AND Price BETWEEN @minPrice AND @maxPrice";
                FoodDrinkSource.SelectParameters.Clear();
                FoodDrinkSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                FoodDrinkSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                FoodDrinkRepeater.DataBind();

                if (FoodDrinkRepeater.Items.Count == 0)
                {
                    lblFDNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblFDNotFound.Visible = false;
                }

                int totalShow = SalesRepeater.Items.Count + ITRepeater.Items.Count + FoodDrinkRepeater.Items.Count;
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
                SalesSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Marketing & Sales' ORDER BY Price ASC";
                SalesSource.SelectParameters.Clear();
                SalesRepeater.DataBind();


                ITSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Computing & Information Technology' ORDER BY Price ASC";
                ITSource.SelectParameters.Clear();
                ITRepeater.DataBind();

                FoodDrinkSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Food & Drinks' ORDER BY Price ASC";
                FoodDrinkSource.SelectParameters.Clear();
                FoodDrinkRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "1")
            {
                SalesSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Marketing & Sales' ORDER BY Price DESC";
                SalesSource.SelectParameters.Clear();
                SalesRepeater.DataBind();


                ITSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Computing & Information Technology' ORDER BY Price DESC";
                ITSource.SelectParameters.Clear();
                ITRepeater.DataBind();

                FoodDrinkSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Food & Drinks' ORDER BY Price DESC";
                FoodDrinkSource.SelectParameters.Clear();
                FoodDrinkRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "2")
            {
                SalesSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Marketing & Sales' ORDER BY Title ASC";
                SalesSource.SelectParameters.Clear();
                SalesRepeater.DataBind();


                ITSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Computing & Information Technology' ORDER BY Title ASC";
                ITSource.SelectParameters.Clear();
                ITRepeater.DataBind();

                FoodDrinkSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Food & Drinks' ORDER BY Title ASC";
                FoodDrinkSource.SelectParameters.Clear();
                FoodDrinkRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "3")
            {
                SalesSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Marketing & Sales' ORDER BY Title DESC";
                SalesSource.SelectParameters.Clear();
                SalesRepeater.DataBind();


                ITSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Computing & Information Technology' ORDER BY Title DESC";
                ITSource.SelectParameters.Clear();
                ITRepeater.DataBind();

                FoodDrinkSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND SubCategory = 'Food & Drinks' ORDER BY Title DESC";
                FoodDrinkSource.SelectParameters.Clear();
                FoodDrinkRepeater.DataBind();
            }
        }
    }
}