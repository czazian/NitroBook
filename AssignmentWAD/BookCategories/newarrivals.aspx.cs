using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.BookCategories
{
    public partial class newarrivals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FNARepeater.DataSource = FNASource;
            FNARepeater.DataBind();

            NFNARepeater.DataSource = NFNASource;
            NFNARepeater.DataBind();

            MangaNARepeater.DataSource = MangaNASource;
            MangaNARepeater.DataBind();

            CNARepeater.DataSource = NFNASource;
            CNARepeater.DataBind();

            int totalShow = FNARepeater.Items.Count + NFNARepeater.Items.Count + MangaNARepeater.Items.Count + CNARepeater.Items.Count;
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
                FNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 AND Price BETWEEN @MinPrice AND @MaxPrice";
                FNASource.SelectParameters.Clear();
                FNASource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                FNASource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                FNARepeater.DataBind();

                if (FNARepeater.Items.Count == 0)
                {
                    lblFNANotFound.Text = "Sorry, No Result Found.";
                }


                // Update the SelectCommand with the new SQL statement
                NFNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 AND Price BETWEEN @minPrice AND @maxPrice";
                NFNASource.SelectParameters.Clear();
                NFNASource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                NFNASource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                NFNARepeater.DataBind();

                if (NFNARepeater.Items.Count == 0)
                {
                    lblNFNANotFound.Text = "Sorry, No Result Found.";
                }

                // Update the SelectCommand with the new SQL statement
                MangaNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 AND Price BETWEEN @minPrice AND @maxPrice";
                MangaNASource.SelectParameters.Clear();
                MangaNASource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                MangaNASource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                MangaNARepeater.DataBind();

                if (MangaNARepeater.Items.Count == 0)
                {
                    lblMangaNANotFound.Text = "Sorry, No Result Found.";
                }

                // Update the SelectCommand with the new SQL statement
                CNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 AND Price BETWEEN @minPrice AND @maxPrice";
                CNASource.SelectParameters.Clear();
                CNASource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                CNASource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                CNARepeater.DataBind();

                if (CNARepeater.Items.Count == 0)
                {
                    lblCNANotFound.Text = "Sorry, No Result Found.";
                }

                lblErrMsg.Text = "";

                int totalShow = FNARepeater.Items.Count + NFNARepeater.Items.Count + MangaNARepeater.Items.Count + CNARepeater.Items.Count;
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
                FNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 ORDER BY Price ASC";
                FNASource.SelectParameters.Clear();
                FNARepeater.DataBind();


                NFNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 ORDER BY Price ASC";
                NFNASource.SelectParameters.Clear();
                NFNARepeater.DataBind();

                MangaNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 ORDER BY Price ASC";
                MangaNASource.SelectParameters.Clear();
                MangaNARepeater.DataBind();

                CNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 ORDER BY Price ASC";
                CNASource.SelectParameters.Clear();
                CNARepeater.DataBind();

            }
            else if (ddlFilter.SelectedValue.ToString() == "1")
            {
                FNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 ORDER BY Price DESC";
                FNASource.SelectParameters.Clear();
                FNARepeater.DataBind();


                NFNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 ORDER BY Price DESC";
                NFNASource.SelectParameters.Clear();
                NFNARepeater.DataBind();

                MangaNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 ORDER BY Price DESC";
                MangaNASource.SelectParameters.Clear();
                MangaNARepeater.DataBind();

                CNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 ORDER BY Price DESC";
                CNASource.SelectParameters.Clear();
                CNARepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "2")
            {
                FNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 ORDER BY Title ASC";
                FNASource.SelectParameters.Clear();
                FNARepeater.DataBind();


                NFNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 ORDER BY Title ASC";
                NFNASource.SelectParameters.Clear();
                NFNARepeater.DataBind();

                MangaNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 ORDER BY Title ASC";
                MangaNASource.SelectParameters.Clear();
                MangaNARepeater.DataBind();

                CNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 ORDER BY Title ASC";
                CNASource.SelectParameters.Clear();
                CNARepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "3")
            {
                FNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 ORDER BY Title DESC";
                FNASource.SelectParameters.Clear();
                FNARepeater.DataBind();


                NFNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 ORDER BY Title DESC";
                NFNASource.SelectParameters.Clear();
                NFNARepeater.DataBind();

                MangaNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 ORDER BY Title DESC";
                MangaNASource.SelectParameters.Clear();
                MangaNARepeater.DataBind();

                CNASource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 ORDER BY Title DESC";
                CNASource.SelectParameters.Clear();
                CNARepeater.DataBind();
            }
        
    }
     
    }
}