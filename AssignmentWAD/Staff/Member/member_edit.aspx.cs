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
    public partial class member_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                    dateOfBirth.SelectedDate = user.GetDateTime(5);
                    txtAddress.Text = user.GetValue(6).ToString();
                    profileImg.ImageUrl = user.GetValue(7).ToString();
                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
  
        }

        protected void dateOfBirth_SelectionChanged(object sender, EventArgs e)
        {
            txtDateOfBirth.Text = dateOfBirth.SelectedDate.ToShortDateString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE [User] SET UserName=@username, UserEmail=@email, UserPassword=@passw, PhoneNo=@phoneNo, DateOfBirth=@dob, Address=@address, ProfileImage=@profileImg WHERE UserID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@username", txtUsername.Text);
            cmdUpdate.Parameters.AddWithValue("@email", txtEmail.Text);
            cmdUpdate.Parameters.AddWithValue("@passw", txtPass.Text);
            cmdUpdate.Parameters.AddWithValue("@phoneNo", txtPhoneNo.Text);
            cmdUpdate.Parameters.AddWithValue("@dob", dateOfBirth.SelectedDate);
            cmdUpdate.Parameters.AddWithValue("@address", txtAddress.Text);
            //uploading image file if new 
            //done successful
            if (newProfileImg.HasFile)
            {
                try
                {
                    newProfileImg.SaveAs(Server.MapPath("~/image/") + newProfileImg.FileName);
                    cmdUpdate.Parameters.AddWithValue("@profileImg", "~/image/" + newProfileImg.FileName.ToString());
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }
            else //remain old profile
            {
                cmdUpdate.Parameters.AddWithValue("@profileImg", profileImg.ImageUrl);
            }
            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["userID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Staff/Member/member.aspx"); 
            }
            else
            {
                Response.Write("Fail to update!");
            }


            cmdUpdate.Dispose();
            cnn.Close();
        }
    }
}