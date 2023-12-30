using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Customer
{
    public partial class customerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SuccessMessage"] != null)
            {
                lblSuccRegMsg.Text = Session["SuccessMessage"].ToString();
            }
            
        }

    

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();

            string loginSql = "SELECT * FROM [User] WHERE userName = @userName AND UserPassword = @password";

            SqlCommand cmdLogin = new SqlCommand(loginSql, conn);

            cmdLogin.Parameters.AddWithValue("@userName", txtUserName.Text);
            cmdLogin.Parameters.AddWithValue("@password", txtPassword.Text);

            SqlDataReader dtrLogin = cmdLogin.ExecuteReader();

            if (dtrLogin.HasRows)
            {
                while (dtrLogin.Read())
                {
                    string UserID = dtrLogin["UserID"].ToString();
                    Session["UserID"] = UserID.ToString();
                    System.Diagnostics.Debug.WriteLine("UserID : " + Session["UserID"].ToString());
                    Response.Redirect("~/Customer/UserProfile.aspx");
                }
            }
            else
            {
                lblLoginErr.Text = "*Invalid ID or password. Please try again.";
            }


        }
    }
}