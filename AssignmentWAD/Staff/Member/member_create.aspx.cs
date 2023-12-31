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
    public partial class member_create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dateOfBirth_SelectionChanged(object sender, EventArgs e)
        {
            txtDateOfBirth.Text = dateOfBirth.SelectedDate.ToShortDateString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!IsUsernameUnique(txtUsername.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Username is already taken. Please choose a different username.');", true);
                return;
            }

            if (!IsEmailUnique(txtEmail.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Email is already registered. Please use a different email address.');", true);
                return;
            }

            //uploading image file
            //done successful
            if (profileImg.HasFile)
            {
                try
                {
                    profileImg.SaveAs(Server.MapPath("~/image/") + profileImg.FileName);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO [User] (UserName, UserEmail, UserPassword, PhoneNo, DateOfBirth, Address, ProfileImage) values (@username, @email, @passw, @phoneNo, @dob, @address, @profileImg)";

            SqlCommand cmdInsert = new SqlCommand(sql, cnn);
            cmdInsert.Parameters.AddWithValue("@username", txtUsername.Text);
            cmdInsert.Parameters.AddWithValue("@email", txtEmail.Text);
            cmdInsert.Parameters.AddWithValue("@passw", txtPass.Text);
            cmdInsert.Parameters.AddWithValue("@phoneNo", txtPhoneNo.Text);
            cmdInsert.Parameters.AddWithValue("@dob", dateOfBirth.SelectedDate);
            cmdInsert.Parameters.AddWithValue("@address", txtAddress.Text);
            cmdInsert.Parameters.AddWithValue("@profileImg", "~/image/" + profileImg.FileName.ToString());

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add member " + txtUsername.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Member/member.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();
        }

        private bool IsUsernameUnique(string username)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT COUNT(*) FROM [User] WHERE UserName = @username";

            SqlCommand cmdCheckUsername = new SqlCommand(sql, cnn);
            cmdCheckUsername.Parameters.AddWithValue("@username", username);

            int count = Convert.ToInt32(cmdCheckUsername.ExecuteScalar());

            cmdCheckUsername.Dispose();
            cnn.Close();

            return count == 0;
        }

        private bool IsEmailUnique(string email)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT COUNT(*) FROM [User] WHERE UserEmail = @email";

            SqlCommand cmdCheckEmail = new SqlCommand(sql, cnn);
            cmdCheckEmail.Parameters.AddWithValue("@email", email);

            int count = Convert.ToInt32(cmdCheckEmail.ExecuteScalar());

            cmdCheckEmail.Dispose();
            cnn.Close();

            return count == 0; 
        }
    }
}