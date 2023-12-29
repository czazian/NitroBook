using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD
{
    public partial class Admin2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label adminNameLabel = FindControl("adminNameLabel") as Label;

                if (adminNameLabel != null && Session["StaffID"] != null)
                {
                    string staffID = Session["StaffID"].ToString();

                    // Assuming you have a method to retrieve StaffName based on StaffID
                    string staffName = GetStaffNameByStaffID(staffID);

                    if (!string.IsNullOrEmpty(staffName))
                    {
                        adminNameLabel.Text = staffName;
                    }
                    else
                    {
                        // StaffName is not found
                        Response.Redirect("/Staff/staffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Staff/staffLogin.aspx");
                }
            }
        }

        private string GetStaffNameByStaffID(string staffID)
        {
            string staffName = string.Empty;

            // Use your database connection and query to get the StaffName
            // Replace the following code with your actual database logic

            string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT StaffName FROM Staff WHERE StaffID = @StaffID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    object staffNameObj = cmd.ExecuteScalar();

                    if (staffNameObj != null)
                    {
                        staffName = staffNameObj.ToString();
                    }
                }
            }

            return staffName;
        }
    }
}