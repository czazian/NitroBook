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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private SqlConnection getConnection()
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
            return conn;
        }

        private Boolean matchEmail()
        {

            SqlConnection conn = getConnection();

            string matchSql = "SELECT * FROM [User] WHERE UserEmail = @userEmail";

            SqlCommand cmdMatch = new SqlCommand(matchSql, conn);

            cmdMatch.Parameters.AddWithValue("@userEmail", txtEmail.Text);

            SqlDataReader dtrMatch = cmdMatch.ExecuteReader();

            Boolean isMatch = false;
            if (dtrMatch.HasRows)
            {
                while (dtrMatch.Read())
                {
                    isMatch = true;
                }
            }
            conn.Close();
            return isMatch;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Boolean matchResult = matchEmail();

            if (!matchResult)
            {
                lblErrMsg.Text = "Sorry, your email is not match! Please try again.";
               
            }
            else
            {
                SqlConnection conn = getConnection();
                string resetSql = "UPDATE [USER] SET UserPassword = @password WHERE UserEmail = @email";

                SqlCommand cmdReset = new SqlCommand(resetSql, conn);
                cmdReset.Parameters.AddWithValue("@password", txtConfirmPass.Text);
                cmdReset.Parameters.AddWithValue("@email", txtEmail.Text);

                int resetPassw = cmdReset.ExecuteNonQuery();

                if (resetPassw > 0)
                {
                    Session["SuccessMessage"] = "*Your password is successfully reset!";
                    Response.Redirect("~/Customer/customerLogin.aspx");
                }
            }
        }
    }
}