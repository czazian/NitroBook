using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Customer
{
    public partial class OrderTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            string userID = Session["UserID"].ToString();

            DataTable data = GetDataFromDatabase(userID);

            if (data.Rows.Count > 0)
            {
                OuterRepeater.DataSource = data;
                OuterRepeater.DataBind();
            }
            else
            {
                lblFail.Text = "*Sorry, You have no purchased record.";
            }
        }

        private DataTable GetDataFromDatabase(string userID)
        {
            TrackingSource.SelectParameters["userID"].DefaultValue = userID;
            DataView dv = (DataView)TrackingSource.Select(DataSourceSelectArguments.Empty);
            DataTable distinctDataTable = dv.ToTable(true, "OrderID", "PaymentDate", "TotalAmount", "OrderStatus");
            return distinctDataTable;
        }

        protected void OuterRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater innerRepeater = (Repeater)e.Item.FindControl("InnerRepeater");

                // Get the current order's data
                DataRowView orderData = (DataRowView)e.Item.DataItem;
                int orderID = orderData.Row.Field<int>("OrderID");

                // Filter the DataTable to get items for the current order
                DataTable itemsForOrder = ((DataView)TrackingSource.Select(DataSourceSelectArguments.Empty))
                    .Table
                    .Select($"OrderID = {orderID}")
                    .CopyToDataTable();

                innerRepeater.DataSource = itemsForOrder;
                innerRepeater.DataBind();

                CalculateEstimatedArrivalDate();
            }
            else
            {
                lblFail.Text = "You have no purchased record.";
            }
        }



        private void CalculateEstimatedArrivalDate()
        {
            foreach (RepeaterItem item in OuterRepeater.Items)
            {
                // Find the controls within the item
                Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
                Label lblArrivalDate = (Label)item.FindControl("lblArrivalDate");

                if (lblOrderDate != null && lblArrivalDate != null)
                {
                    // Assuming lblOrderDate.Text contains the payment date
                    DateTime paymentDate;

                    // Specify the expected date format
                    string[] dateFormats = { "dd-MM-yyyy" }; // Adjust according to your actual date format

                    // Use DateTime.TryParseExact to handle specific date formats
                    if (DateTime.TryParseExact(lblOrderDate.Text, dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out paymentDate))
                    {
                        // Calculate estimated arrival date
                        DateTime estimatedArrivalDate = paymentDate.AddDays(5);

                        // Set the values for lblArrivalDate
                        lblArrivalDate.Text = estimatedArrivalDate.ToShortDateString();
                    }
                    else
                    {
                        // Handle parsing failure
                        lblArrivalDate.Text = "Invalid Date Format";
                    }
                }
            }
        }






        //protected void Page_Load(object sender, EventArgs e)
        //{

        //    TrackingRepeater.DataSource = TrackingSource;

        //    string userID = Session["UserID"].ToString();

        //    TrackingSource.SelectParameters["userID"].DefaultValue = userID;
        //    TrackingRepeater.DataBind();
        //    CalculateEstimatedArrivalDate();

        //}
        //private void CalculateEstimatedArrivalDate()
        //{
        //    foreach (RepeaterItem item in OuterRepeater.Items)
        //    {
        //        // Find the controls within the item
        //        Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
        //        Label lblArrivalDate = (Label)item.FindControl("lblArrivalDate");

        //        if (lblOrderDate != null && lblArrivalDate != null)
        //        {
        //            // Assuming lblOrderDate.Text contains the payment date
        //            DateTime paymentDate;

        //            if (DateTime.TryParse(lblOrderDate.Text, out paymentDate))
        //            {
        //                // Calculate estimated arrival date
        //                DateTime estimatedArrivalDate = paymentDate.AddDays(5);

        //                // Set the values for lblArrivalDate
        //                lblArrivalDate.Text = estimatedArrivalDate.ToShortDateString();
        //            }
        //            else
        //            {
        //                // Handle parsing failure if needed
        //                lblArrivalDate.Text = "Invalid Date";
        //            }
        //        }
        //    }
        //}

        private SqlConnection getConnection()
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
            return conn;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int rateStar = Convert.ToInt32(r.SelectedValue);
            //System.Diagnostics.Debug.WriteLine(rateStar);
            string feedback = txtFeedback.Text;
            string userID = Session["UserID"].ToString();
            DateTime dateNow = DateTime.Now;
            //string date = dateNow.ToString("dd/MM/yyyy");



            int bookID = findBookID();

            SqlConnection conn = getConnection();

            System.Diagnostics.Debug.WriteLine(bookID);


            string rateSql = "INSERT INTO Comment (RateStar,Comment,CommentDate,BookID,UserID) VALUES (@RateStar,@Comment,@CommentDate,@BookID,@UserID)";

            SqlCommand cmdRate = new SqlCommand(rateSql, conn);

            cmdRate.Parameters.AddWithValue("@RateStar", rateStar);
            cmdRate.Parameters.AddWithValue("@Comment", feedback);
            cmdRate.Parameters.AddWithValue("@CommentDate", dateNow);
            cmdRate.Parameters.AddWithValue("@BookID", bookID);
            cmdRate.Parameters.AddWithValue("@UserID", userID);

            int successRate = cmdRate.ExecuteNonQuery();

            if (successRate > 0)
            {

                Response.Redirect("~/Customer/OrderTracking.aspx");
            }
            else
            {
                lblFail.Text = "Fail to submit feedback";
            }


        }



        private int findBookID()
        {
            int bookID = 0;

            SqlConnection conn = getConnection();

            string matchSql = "SELECT BookID FROM Book WHERE Title = @title";
            SqlCommand cmdMatch = new SqlCommand(matchSql, conn);

            foreach (RepeaterItem item in OuterRepeater.Items)
            {
                // Find the controls within the item
                Label lblBookName1 = (Label)item.FindControl("lblBookName1");

                if (lblBookName1 != null)
                {
                    cmdMatch.Parameters.Clear();  // Clear existing parameters
                    cmdMatch.Parameters.AddWithValue("@title", lblBookName1.Text);

                    SqlDataReader dtrMatch = cmdMatch.ExecuteReader();

                    if (dtrMatch.HasRows)
                    {
                        while (dtrMatch.Read())
                        {
                            bookID = int.Parse(dtrMatch["BookID"].ToString());
                        }
                    }

                    dtrMatch.Close();  // Close the SqlDataReader to avoid issues
                }
            }

            return bookID;
        }

    }

}
