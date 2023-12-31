using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Member
{
    public partial class member_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["member_permit"] == null || Session["member_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "SELECT * FROM [User] WHERE UserID=@id";

            SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

            cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["userID"]);
            SqlDataReader user = cmdRetrieve.ExecuteReader();

            if (user.HasRows && user.Read())
            {
                //work, can get query string
                txtUsername.Text = user.GetValue(1).ToString();
                txtEmail.Text = user.GetValue(2).ToString();
                txtPass.Text = user.GetValue(3).ToString();
                txtPhoneNo.Text = user.GetValue(4).ToString();
                txtDateOfBirth.Text = user.GetValue(5).ToString();
                txtAddress.Text = user.GetValue(6).ToString();
                image.ImageUrl = user.GetValue(7).ToString();
            }
            else
            {
                Response.Write("Invalid Records");
            }

            cmdRetrieve.Dispose();
            cnn.Close();
        }
    }
}