using AssignmentWAD.Staff.Staff;
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
            string staffID = Session["StaffID"].ToString();

            //everytime user load this page need to check permission
            //Get the staff & role
            SqlConnection cnn, cnn2;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn2 = new SqlConnection(strConnection);
            cnn.Open();
            cnn2.Open();
            String sql1 = "SELECT RoleID FROM Staff WHERE StaffID=@id";
            String sql2 = "SELECT * FROM Role WHERE RoleID=@id";
            SqlCommand cmdRetrieve = new SqlCommand(sql1, cnn);
            SqlCommand cmdRetrieve2 = new SqlCommand(sql2, cnn2);

            cmdRetrieve.Parameters.AddWithValue("@id", staffID);
            SqlDataReader staff = cmdRetrieve.ExecuteReader();

            //if staff found
            //find the role and initiallize the permission
            if (staff.HasRows && staff.Read())
            {
                //get roleID from the staff
                String roleID = staff.GetValue(0).ToString();

                //get details of the role
                cmdRetrieve2.Parameters.AddWithValue("@id", roleID);
                SqlDataReader role = cmdRetrieve2.ExecuteReader();

                if (role.HasRows && role.Read())
                {
                    String prod_permit = role.GetValue(2).ToString();
                    String report_permit = role.GetValue(3).ToString();
                    String member_permit = role.GetValue(4).ToString();
                    String role_permit = role.GetValue(5).ToString();
                    String staff_permit = role.GetValue(6).ToString();

                    //display none if no permission to the corresponding module
                    if (prod_permit == "0")
                    {
                        prodLi.Style.Add("display", "none");
                    }

                    if (report_permit == "0")
                    {
                        reportLi.Style.Add("display", "none");
                    }
                    if (member_permit == "0")
                    {
                        memberLi.Style.Add("display", "none");
                    }
                    if (role_permit == "0")
                    {
                        roleLi.Style.Add("display", "none");
                    }
                    if (staff_permit == "0")
                    {
                        staffLi.Style.Add("display", "none");
                    }
                }
            }

            if (!IsPostBack)
            {
                Label adminNameLabel = FindControl("adminNameLabel") as Label;

                if (adminNameLabel != null && Session["StaffID"] != null)
                {

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