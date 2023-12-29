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
    public partial class staffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                StaffLogin();
            }
        }

        private void StaffLogin()
        {
            string email = txtStaffId.Text;
            string password = txtPassword.Text;

            // Validate inputs
            if (string.IsNullOrEmpty(email) && string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("Please enter email", "Please enter password");
                return;
            }
            else if (string.IsNullOrEmpty(email))
            {
                ShowErrorMessage("Please enter email", "");
                return;
            }
            else if (string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("", "Please enter password");
                return;
            }

            if (IsValidStaff(email, password))
            {
                // Authentication successful
                Response.Redirect("~/Staff/Dashboard/dashboard.aspx");
            }
            else
            {
                // Authentication failedS
                ShowErrorMessage("Invalid email or password", "Invalid email or password");
            }
        }

        private void ShowErrorMessage(string emailMessage, string passwordMessage)
        {
            Session["emailError"] = emailMessage;
            Session["passwordError"] = passwordMessage;

            lblError.Text = emailMessage;
            lblError0.Text = passwordMessage;

            Response.Redirect("staffLogin.aspx");
        }

        private bool IsValidStaff(string email, string password)
        {
            string query = "SELECT COUNT(*) FROM Staff WHERE StaffName = @Email AND StaffPassword = @Password";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count > 0)
                    {
                        // Successful login, set session variable
                        Session["StaffName"] = email;
                        return true;
                    }
                }
            }
            return false;
        }
    }
}
