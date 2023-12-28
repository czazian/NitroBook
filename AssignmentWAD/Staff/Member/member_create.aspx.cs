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
                Response.Redirect("~/Staff/Member/member.aspx");
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();
        }
    }
}