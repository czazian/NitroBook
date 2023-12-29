using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffName"] != null)
                {
                    string staffName = Session["StaffName"].ToString();
                    txtUsername.Text = staffName;

                    showstaffDetails(staffName);
                }
                else
                {
                    Response.Redirect("staffLogin.aspx");
                }
            }
        }

        private void showstaffDetails(string staffName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT StaffPassword, RoleID FROM Staff WHERE StaffName = @StaffName";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffName", staffName);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string staffPassword = reader["StaffPassword"].ToString();
                            string staffRole = reader["RoleID"].ToString();

                            txtPass.Text = staffPassword;
                            ddlRole.SelectedValue = staffRole;
                        }
                        else
                        {
                            // Handle case where staff details are not found
                        }
                    }
                }
            }
        }
    }
}