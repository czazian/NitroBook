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

        Label status;

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

                //Assign status to page variable
                status = (Label)e.Item.FindControl("lblDeliveryStatus");

                Repeater innerRepeater = (Repeater)e.Item.FindControl("InnerRepeater");

                // Get the current order's data
                DataRowView orderData = (DataRowView)e.Item.DataItem;
                int orderID = orderData.Row.Field<int>("OrderID");

                // Filter the DataTable to get items for the current order
                DataTable itemsForOrder = ((DataView)TrackingSource.Select(DataSourceSelectArguments.Empty))
                    .Table
                    .Select($"OrderID = {orderID}")
                    .OrderByDescending(x => x.Field<DateTime>("PaymentDate"))
                    .CopyToDataTable();
                itemsForOrder.DefaultView.Sort = "PaymentDate DESC";

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
            string feedback = txtFeedback.Text;
            string userID = Session["UserID"].ToString();
            DateTime dateNow = DateTime.Now;
            //string date = dateNow.ToString("dd/MM/yyyy");

            string bookID = Session["bID"].ToString();


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
                Session.Remove("bID");
            }
            else
            {
                lblFail.Text = "Fail to submit feedback";
            }


        }


        protected void InnerRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                //To set the visibility of rate button  -> Status is Page variable
                Button btn = (Button)e.Item.FindControl("btnToOpenFeedback");
                if(status.Text == "Delivered")
                {
                    btn.Visible = true;
                    status.ForeColor = System.Drawing.Color.LawnGreen;
                } else
                {
                    btn.Visible = false;
                    status.ForeColor = System.Drawing.Color.LightSalmon;
                }

            }
        }
        

        //Set BookID to comment to Session
        protected void btnToOpenFeedback_Command(object sender, CommandEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "openModal()", true);

            System.Diagnostics.Debug.WriteLine("ID : " + e.CommandArgument.ToString());
            Session["bID"] = e.CommandArgument.ToString();
        }
    }

}
