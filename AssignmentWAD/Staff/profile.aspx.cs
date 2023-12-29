using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace AssignmentWAD.Staff
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffID"] != null)
                {
                    int staffID;
                    if (int.TryParse(Session["StaffID"].ToString(), out staffID))
                    {
                        showstaffDetails(staffID);
                    }
                    else
                    {
                        Response.Redirect("staffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("staffLogin.aspx");
                }

                string confirmScript = "return confirm('Are you sure you want to update the name and password?');";
                btnSubmit.OnClientClick = confirmScript;
            }
        }

        private void showstaffDetails(int staffID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT StaffName, StaffPassword, RoleID FROM Staff WHERE StaffID = @StaffID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string staffName = reader["StaffName"].ToString();
                            string staffPassword = reader["StaffPassword"].ToString();
                            int staffRole;

                            if (int.TryParse(reader["RoleID"].ToString(), out staffRole))
                            {
                                txtUsername.Text = staffName;
                                txtPass.Text = staffPassword;
                                ddlRole.SelectedValue = staffRole.ToString();
                            }
                            else
                            {
                                // Handle the case where parsing RoleID to int fails
                                Response.Redirect("staffLogin.aspx");
                            }
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.CausesValidation && Page.IsValid)
            {
                // Perform the update operation
                UpdateStaffDetails();
            }
        }

        private void UpdateStaffDetails()
        {
            int staffID;
            if (int.TryParse(Session["StaffID"].ToString(), out staffID))
            {
                string newUsername = txtUsername.Text;
                string newPassword = txtPass.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "UPDATE Staff SET StaffName = @NewUsername, StaffPassword = @NewPassword WHERE StaffID = @StaffID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@NewUsername", newUsername);
                        cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                        cmd.Parameters.AddWithValue("@StaffID", staffID);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Success Updated!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = " Sorry, there are something problem here.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            else
            {
                // Handle the case where parsing StaffID to int fails
                Response.Redirect("staffLogin.aspx");
            }
        }


    }
}