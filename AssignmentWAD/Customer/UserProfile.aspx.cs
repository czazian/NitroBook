using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Customer
{
    public partial class UserProfile : System.Web.UI.Page
    {
        public object ConfigurationConnection { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();

            string userID = Session["UserID"].ToString();

            string profileSql = "SELECT * FROM [User] WHERE UserID = @userID";

            SqlCommand cmdProfile = new SqlCommand(profileSql, conn);

            cmdProfile.Parameters.AddWithValue("@userID", userID);

            SqlDataReader dtrProfile = cmdProfile.ExecuteReader();

            if (dtrProfile.HasRows)
            {
                while (dtrProfile.Read())
                {
                    lblWelcomeMsg.Text = "Hi, " + dtrProfile["userName"].ToString();

                    lblUname.Text = dtrProfile["UserName"].ToString();
                    lblEmail.Text = dtrProfile["UserEmail"].ToString();
                    DateTime DateOfBirth = (DateTime)dtrProfile["DateOfBirth"];

                    lblDOB.Text = DateOfBirth.ToShortDateString();
                    lblAddress.Text = dtrProfile["Address"].ToString();
                    lblPhoneNo.Text = "0" + dtrProfile["PhoneNo"].ToString();

                    string imageUrl = dtrProfile["ProfileImage"].ToString();
                    image1.ImageUrl = imageUrl;
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Check if a file is uploaded
            if (FileUpload1.HasFile)
            {
                // Get the file name
                string fileName = Path.GetFileName(FileUpload1.FileName);

                // Specify the folder where you want to save the uploaded file
                string folderPath = Server.MapPath("~/image/");

                // Combine the folder path and file name
                string filePath = Path.Combine(folderPath, fileName);

                // Save the file to the server
                FileUpload1.SaveAs(filePath);

                // Update the ProfileImageUrl in the database
                string userID = Session["UserID"].ToString();
                string updateSql = "UPDATE [User] SET ProfileImage = @imageUrl WHERE UserID = @userID";

                SqlConnection conn;
                string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                conn = new SqlConnection(strCon);
                conn.Open();

                SqlCommand cmdEditProfile = new SqlCommand(updateSql, conn);

                cmdEditProfile.Parameters.AddWithValue("@imageUrl", "~/image/" + fileName);
                cmdEditProfile.Parameters.AddWithValue("@uname", userID);

                        // Execute the update command
                        int isUpdated = cmdEditProfile.ExecuteNonQuery();

                if (isUpdated > 0)
                {
                    // Update the ImageUrl on the page
                    image1.ImageUrl = "~/image/" + fileName;
                }

               
            }

         
        }

    }
}