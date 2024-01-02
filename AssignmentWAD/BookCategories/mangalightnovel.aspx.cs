using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.BookCategories
{
    public partial class manga_lightnovel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReinRepeater.DataSource = ReinSource;
            ReinRepeater.DataBind();

            ActionRepeater.DataSource = ActionSource;
            ActionRepeater.DataBind();

            RomanceRepeater.DataSource = RomanceSource;
            RomanceRepeater.DataBind();

            SliceRepeater.DataSource = SliceSource;
            SliceRepeater.DataBind();

            int totalShow = ReinRepeater.Items.Count + ReinRepeater.Items.Count + ReinRepeater.Items.Count + SliceRepeater.Items.Count;
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

        protected void btnPriceRange_OnClick(object sender, EventArgs e)
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
                ReinSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation' AND Price BETWEEN @MinPrice AND @MaxPrice";
                ReinSource.SelectParameters.Clear();
                ReinSource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                ReinSource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                ReinRepeater.DataBind();

                if (ReinRepeater.Items.Count == 0)
                {
                    lblReinNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblReinNotFound.Text = "";
                    //lblReinNotFound.Visible = false;
                }


                // Update the SelectCommand with the new SQL statement
                ActionSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action' AND Price BETWEEN @minPrice AND @maxPrice";
                ActionSource.SelectParameters.Clear();
                ActionSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                ActionSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                ActionRepeater.DataBind();

                if (ActionRepeater.Items.Count == 0)
                {
                    lblActionNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblActionNotFound.Text = "";
                }

                // Update the SelectCommand with the new SQL statement
                RomanceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance' AND Price BETWEEN @minPrice AND @maxPrice";
                RomanceSource.SelectParameters.Clear();
                RomanceSource.SelectParameters.Add("maxPrice", DbType.Double, maxPrice.ToString());
                RomanceSource.SelectParameters.Add("minPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                RomanceRepeater.DataBind();

                if (RomanceRepeater.Items.Count == 0)
                {
                    lblRomanceNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblRomanceNotFound.Text = "";
                }


                // Update the SelectCommand with the new SQL statement
                SliceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life' AND Price BETWEEN @MinPrice AND @MaxPrice";
                SliceSource.SelectParameters.Clear();
                SliceSource.SelectParameters.Add("MaxPrice", DbType.Double, maxPrice.ToString());
                SliceSource.SelectParameters.Add("MinPrice", DbType.Double, minPrice.ToString());

                // Rebind the data
                SliceRepeater.DataBind();

                if (SliceRepeater.Items.Count == 0)
                {
                    lblSliceNotFound.Text = "Sorry, No Result Found.";
                }
                else
                {
                    lblSliceNotFound.Text = "";
                }

                lblErrMsg.Text = "";

                int totalShow = ReinRepeater.Items.Count + ActionRepeater.Items.Count + RomanceRepeater.Items.Count + SliceRepeater.Items.Count;
                lblTotalShow.Text = "Showing 1 - " + totalShow.ToString();
            }
            catch (FormatException ex)
            {
                lblErrMsg.Text = "*Only number accepted";
                lblActionNotFound.Text = "";
                lblReinNotFound.Text = "";
                lblRomanceNotFound.Text = "";
                lblSliceNotFound.Text = "";

            }
            catch (Exception ex)
            {
                lblErrMsg.Text = ex.Message;
                lblActionNotFound.Text = "";
                lblReinNotFound.Text = "";
                lblRomanceNotFound.Text = "";
                lblSliceNotFound.Text = "";
            }
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFilter.SelectedValue.ToString() == "0")
            {
                ReinSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation' ORDER BY Price ASC";
                ReinSource.SelectParameters.Clear();
                ReinRepeater.DataBind();

                ActionSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action' ORDER BY Price ASC";
                ActionSource.SelectParameters.Clear();
                ActionRepeater.DataBind();

                RomanceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance' ORDER BY Price ASC";
                RomanceSource.SelectParameters.Clear();
                RomanceRepeater.DataBind();

                SliceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life' ORDER BY Price ASC";
                SliceSource.SelectParameters.Clear();
                SliceRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "1")
            {
                ReinSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation' ORDER BY Price DESC";
                ReinSource.SelectParameters.Clear();
                ReinRepeater.DataBind();


                ActionSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action' ORDER BY Price DESC";
                ActionSource.SelectParameters.Clear();
                ActionRepeater.DataBind();

                RomanceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance' ORDER BY Price DESC";
                RomanceSource.SelectParameters.Clear();
                RomanceRepeater.DataBind();

                SliceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life' ORDER BY Price DESC";
                SliceSource.SelectParameters.Clear();
                SliceRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "2")
            {
                ReinSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation' ORDER BY Title ASC";
                ReinSource.SelectParameters.Clear();
                ReinRepeater.DataBind();


                ActionSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action' ORDER BY Title ASC";
                ActionSource.SelectParameters.Clear();
                ActionRepeater.DataBind();

                RomanceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance' ORDER BY Title ASC";
                RomanceSource.SelectParameters.Clear();
                RomanceRepeater.DataBind();

                SliceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life' ORDER BY Title ASC";
                SliceSource.SelectParameters.Clear();
                SliceRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.ToString() == "3")
            {
                ReinSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation' ORDER BY Title DESC";
                ReinSource.SelectParameters.Clear();
                ReinRepeater.DataBind();

                ActionSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action' ORDER BY Title DESC";
                ActionSource.SelectParameters.Clear();
                ActionRepeater.DataBind();

                RomanceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance' ORDER BY Title DESC";
                RomanceSource.SelectParameters.Clear();
                RomanceRepeater.DataBind();

                SliceSource.SelectCommand = "SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life' ORDER BY Title DESC";
                SliceSource.SelectParameters.Clear();
                SliceRepeater.DataBind();
            }
        }
    }
}