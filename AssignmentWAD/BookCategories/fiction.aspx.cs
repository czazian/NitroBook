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
    public partial class fiction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FantasyRepeater.DataSource = FantasySource;
            FantasyRepeater.DataBind();

            HorrorRepeater.DataSource = HorrorSource;
            HorrorRepeater.DataBind();

            GeneralFicRepeater.DataSource = GeneralFicSource;
            GeneralFicRepeater.DataBind();

            int totalShow = FantasyRepeater.Items.Count + HorrorRepeater.Items.Count + GeneralFicRepeater.Items.Count;
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
                FantasySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Fantasy' AND Price BETWEEN @MinPrice AND @MaxPrice";
                FantasySource.SelectParameters.Clear();
                FantasySource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                FantasySource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                FantasyRepeater.DataBind();

                if (FantasyRepeater.Items.Count == 0)
                {
                    lblFantasyNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblFantasyNotFound.Visible = false;
                }


                // Update the SelectCommand with the new SQL statement
                HorrorSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Horror' AND Price BETWEEN @minPrice AND @maxPrice";
                HorrorSource.SelectParameters.Clear();
                HorrorSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                HorrorSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                HorrorRepeater.DataBind();

                if (HorrorRepeater.Items.Count == 0)
                {
                    lblHorrorNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblHorrorNotFound.Visible = false;
                }

                // Update the SelectCommand with the new SQL statement
                GeneralFicSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'General Fictions' AND Price BETWEEN @minPrice AND @maxPrice";
                GeneralFicSource.SelectParameters.Clear();
                GeneralFicSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                GeneralFicSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                GeneralFicRepeater.DataBind();

                if (GeneralFicRepeater.Items.Count == 0)
                {
                    lblGeneralFicNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblGeneralFicNotFound.Visible = false;
                }

                lblErrMsg.Text = "";

                int totalShow = FantasyRepeater.Items.Count + HorrorRepeater.Items.Count + GeneralFicRepeater.Items.Count;
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
                FantasySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Fantasy' ORDER BY Price ASC";
                FantasySource.SelectParameters.Clear();
                FantasyRepeater.DataBind();


                HorrorSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Horror' ORDER BY Price ASC";
                HorrorSource.SelectParameters.Clear();
                HorrorRepeater.DataBind();

                GeneralFicSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'General Fictions' ORDER BY Price ASC";
                GeneralFicSource.SelectParameters.Clear();
                GeneralFicRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "1")
            {
                FantasySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Fantasy' ORDER BY Price DESC";
                FantasySource.SelectParameters.Clear();
                FantasyRepeater.DataBind();


                HorrorSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Horror' ORDER BY Price DESC";
                HorrorSource.SelectParameters.Clear();
                HorrorRepeater.DataBind();

                GeneralFicSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'General Fictions' ORDER BY Price DESC";
                GeneralFicSource.SelectParameters.Clear();
                GeneralFicRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "2")
            {
                FantasySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Fantasy' ORDER BY Title ASC";
                FantasySource.SelectParameters.Clear();
                FantasyRepeater.DataBind();


                HorrorSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Horror' ORDER BY Title ASC";
                HorrorSource.SelectParameters.Clear();
                HorrorRepeater.DataBind();

                GeneralFicSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'General Fictions' ORDER BY Title ASC";
                GeneralFicSource.SelectParameters.Clear();
                GeneralFicRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "3")
            {
                FantasySource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Fantasy' ORDER BY Title DESC";
                FantasySource.SelectParameters.Clear();
                FantasyRepeater.DataBind();


                HorrorSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'Horror' ORDER BY Title DESC";
                HorrorSource.SelectParameters.Clear();
                HorrorRepeater.DataBind();

                GeneralFicSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Fiction' AND SubCategory = 'General Fictions' ORDER BY Title DESC";
                GeneralFicSource.SelectParameters.Clear();
                GeneralFicRepeater.DataBind();
            }
        }

    }
}