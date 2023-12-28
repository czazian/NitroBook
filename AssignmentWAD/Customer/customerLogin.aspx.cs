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
    public partial class customerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                    }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();

            string loginSql = "SELECT * FROM [User] WHERE UserName = @uname AND UserPasword = @password";

            SqlCommand cmdLogin = new SqlCommand(loginSql, conn);

            cmdLogin.Parameters.AddWithValue("@uname", txtUsername.Text);
            cmdLogin.Parameters.AddWithValue("@password", txtPassword.Text);

            SqlDataReader dtrLogin = cmdLogin.ExecuteReader();

            if (dtrLogin.HasRows)
            {
                Session["UserName"] = txtUsername.Text;
                Response.Redirect("~/Home/homepage.aspx");
            }
            else
            {
                lblLoginErr.Text = "*Invalid email or password. Please try again.";
            }


        }
    }
}