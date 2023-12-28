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
            if (!IsPostBack)
            {
                int userID = getLatestUserID();
                txtUserID.Text = "UserID : " + userID.ToString();

            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {

        }

        private int getLatestUserID()
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

            return newUserId;
        }

        protected void lbtSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();

            int userID = getLatestUserID();

            string RegisterSql = "INSERT INTO [User] (UserID,UserName,UserEmail,UserPasword,PhoneNo,DateOfBirth,Address,ProfileImage,Name) VALUES (@UserID,@name,@UserEmail,@UserPassword,@PhoneNo,@DateOfBirth,@Address,'')";

            SqlCommand cmdRegister = new SqlCommand(RegisterSql, conn);

            cmdRegister.Parameters.AddWithValue("@UserID", userID);
            cmdRegister.Parameters.AddWithValue("@UserEmail", txtEmail.Text);
            cmdRegister.Parameters.AddWithValue("@UserPassword", txtConfirmPass.Text);
            cmdRegister.Parameters.AddWithValue("@PhoneNo", txtPhoneNum.Text);
            cmdRegister.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
            cmdRegister.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmdRegister.Parameters.AddWithValue("@name", txtName.Text);


            int registerNum = cmdRegister.ExecuteNonQuery();

            if (registerNum > 0)
            {
                Session["SuccessMessage"] = "Your account has been registered successfully!";

                Response.Redirect("~/Customer/customerLogin.aspx");
            }
            else
            {
                Session["SuccessMessage"] = "Fail to Register!";

            }
        }
       
    }
}
