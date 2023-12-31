using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
                // Authentication failed
                ShowErrorMessage("Invalid email or password", "Invalid email or password");
            }
        }

        private void ShowErrorMessage(string emailMessage, string passwordMessage)
        {
            lblError.Text = emailMessage;
            lblError0.Text = passwordMessage;
        }

        private bool IsValidStaff(string email, string password)
        {
            string query = "SELECT StaffID FROM Staff WHERE StaffName = @Email AND StaffPassword = @Password";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", HashPassword(password));

                    object staffID = cmd.ExecuteScalar();

                    if (staffID != null)
                    {
                        // Successful login, set session variable with StaffID
                        Session["StaffID"] = staffID.ToString();
                        return true;
                    }
                }
            }
            return false;
        }

        //Hash Password Function
        public string HashPassword(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
            
        }
    }
}
