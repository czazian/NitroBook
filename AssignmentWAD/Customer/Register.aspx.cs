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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {

        }

        protected void lbtSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();

            // Retrieve the current maximum UserID
            string getMaxUserIdSql = "SELECT MAX(UserID) FROM [User]";
            SqlCommand cmdMaxUserId = new SqlCommand(getMaxUserIdSql, conn);
            object result = cmdMaxUserId.ExecuteScalar();

            int currentMaxUserId = (result == DBNull.Value) ? 0 : Convert.ToInt32(result);

            // Calculate the new UserID
            int newUserId = currentMaxUserId + 1;


            string RegisterSql = "INSERT INTO [User] (UserID,UserName,UserEmail,UserPasword,PhoneNo,DateOfBirth,Address,ProfileImage,Name) VALUES (@UserID,@UserName,@UserEmail,@UserPassword,@PhoneNo,@DateOfBirth,@Address,'',@Name)";

            SqlCommand cmdRegister = new SqlCommand(RegisterSql, conn);

            cmdRegister.Parameters.AddWithValue("@UserID", newUserId);
            cmdRegister.Parameters.AddWithValue("@UserName", txtNewUsername.Text);
            cmdRegister.Parameters.AddWithValue("@UserEmail", txtEmail.Text);
            cmdRegister.Parameters.AddWithValue("@UserPassword", txtConfirmPass.Text);
            cmdRegister.Parameters.AddWithValue("@PhoneNo", txtPhoneNum.Text);
            cmdRegister.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
            cmdRegister.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmdRegister.Parameters.AddWithValue("@Name", txtName.Text);



            int registerNum = cmdRegister.ExecuteNonQuery();

            if (registerNum > 0)
            {
                Response.Write("<script>alert('Successfully Registered');</script>");

                Response.Redirect("~/Customer/customerLogin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Fail to Register.');</script>");

            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Your server-side logic after the form is submitted
            string username = txtNewUsername.Text;

            // Perform server-side validation
            if (CheckIfUsernameExists(username))
            {
                // Server-side validation failed
                CustomValidator1.ErrorMessage = "Username already exists. Please choose another username.";
                CustomValidator1.IsValid = false;
                return; // Do not proceed further
            }

            // Continue with the registration logic
            // ...

            // Inform the user about successful registration
            Response.Write("<script>alert('Successfully Registered.');</script>");

            // Redirect to another page if needed
            // Response.Redirect("YourSuccessPage.aspx");
        }

        private bool CheckIfUsernameExists(string username)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            
                conn.Open();

                string checkDuplicateSql = "SELECT UserName FROM [User] WHERE UserName LIKE @Username";

            SqlCommand cmdCheck = new SqlCommand(checkDuplicateSql, conn);
                
                    cmdCheck.Parameters.AddWithValue("@Username", username);

            SqlDataReader dtrCheck = cmdCheck.ExecuteReader();

            Boolean isExists = true;
            if (dtrCheck.HasRows)
            {
                while (dtrCheck.Read())
                {
                    isExists = true;
                }
            }

            return isExists;
            
        }

        protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            // Server-side validation logic using CheckIfUsernameExists method
            args.IsValid = !CheckIfUsernameExists(args.Value);
        }
    }
}
