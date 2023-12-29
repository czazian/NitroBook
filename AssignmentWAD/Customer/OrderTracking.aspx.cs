using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
                TrackingRepeater.DataSource = TrackingSource;

                string userID = Session["UserID"].ToString();

                SqlConnection conn;
                string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                conn = new SqlConnection(strCon);
                conn.Open();

                string trackingSql = "SELECT UserID FROM [User] WHERE UserID = @userID";

                SqlCommand cmdTracking = new SqlCommand(trackingSql, conn);
                cmdTracking.Parameters.AddWithValue("@userID", userID);

                SqlDataReader dtrTracking = cmdTracking.ExecuteReader();

                if (dtrTracking.HasRows)
                {
                    while (dtrTracking.Read())
                    {

                        // Set the value for the userID parameter
                        TrackingSource.SelectParameters["userID"].DefaultValue = dtrTracking["UserID"].ToString();
                    }
                }

                TrackingRepeater.DataBind();



                CalculateEstimatedArrivalDate();
            }

        }
        private void CalculateEstimatedArrivalDate()
        {
            foreach (RepeaterItem item in TrackingRepeater.Items)
            {
                // Find the controls within the item
                Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
                Label lblArrivalDate = (Label)item.FindControl("lblArrivalDate");

                if (lblOrderDate != null && lblArrivalDate != null)
                {
                    // Assuming lblOrderDate.Text contains the payment date
                    DateTime paymentDate;

                    if (DateTime.TryParse(lblOrderDate.Text, out paymentDate))
                    {
                        // Calculate estimated arrival date
                        DateTime estimatedArrivalDate = paymentDate.AddDays(7);

                        // Set the values for lblArrivalDate
                        lblArrivalDate.Text = estimatedArrivalDate.ToShortDateString();
                    }
                    else
                    {
                        // Handle parsing failure if needed
                        lblArrivalDate.Text = "Invalid Date";
                    }
                }
            }
        }

    }
}