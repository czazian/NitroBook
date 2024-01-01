using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Member
{
    public partial class member_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["member_permit"] == null || Session["member_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }

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
                    prevPasswHashed.Value = user.GetValue(3).ToString();
                    txtPhoneNo.Text = user.GetValue(4).ToString();
                    txtDateOfBirth.Text = user.GetValue(5).ToString();
                    dateOfBirth.SelectedDate = user.GetDateTime(5).Date;
                    txtDateOfBirth.Text = dateOfBirth.SelectedDate.ToString("dd/MM/yyyy");
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
            if (!IsUsernameDuplicate(txtUsername.Text, Request.QueryString["userID"]) && !IsEmailDuplicate(txtEmail.Text, Request.QueryString["userID"]))
            {
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql1 = "UPDATE [User] SET UserName=@username, UserEmail=@email, UserPassword=@passw, PhoneNo=@phoneNo, DateOfBirth=@dob, Address=@address, ProfileImage=@profileImg WHERE UserID=@id";
                String sql2 = "UPDATE[User] SET UserName=@username, UserEmail=@email, PhoneNo=@phoneNo, DateOfBirth=@dob, Address=@address, ProfileImage=@profileImg WHERE UserID=@id";
                SqlCommand cmdUpdate;

                //if empty, no need to update password
                if (hiddenVal_prevPass.Value == "no")
                {
                    cmdUpdate = new SqlCommand(sql2, cnn);
                }
                else
                {
                    cmdUpdate = new SqlCommand(sql1, cnn);
                    cmdUpdate.Parameters.AddWithValue("@passw", HashPassword(txtNewPassw.Text));
                }

                //update detail
                cmdUpdate.Parameters.AddWithValue("@username", txtUsername.Text);
                cmdUpdate.Parameters.AddWithValue("@email", txtEmail.Text);
                cmdUpdate.Parameters.AddWithValue("@phoneNo", txtPhoneNo.Text);
                cmdUpdate.Parameters.AddWithValue("@dob", dateOfBirth.SelectedDate);
                cmdUpdate.Parameters.AddWithValue("@address", txtAddress.Text);
                //uploading image file if new 
                //done successfully
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


                if (!string.IsNullOrEmpty(txtPrevPassw.Text))
                {
                    // Check if the previous password is correct before updating
                    if (!IsPreviousPasswordCorrect(Request.QueryString["userID"], cnn))
                    {
                        ShowErrorMessage("Incorrect Previous Password.");
                        return;
                    }

                }


                int i = cmdUpdate.ExecuteNonQuery();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to edit member " + txtUsername.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Member/member.aspx") + "';", true);
                }
                else
                {
                    ShowErrorMessage("Fail to update!");
                }

                cmdUpdate.Dispose();
                cnn.Close();
            }
            else if (IsUsernameDuplicate(txtUsername.Text, Request.QueryString["userID"]))
            {
                ShowErrorMessage("Error to edit member! The username already exists, please re-enter.");
            }
            else if (IsEmailDuplicate(txtEmail.Text, Request.QueryString["userID"]))
            {
                ShowErrorMessage("Error to edit member! The email already exists, please re-enter.");
            }
        }

        private bool IsPreviousPasswordCorrect(string userId, SqlConnection conn)
        {
            string query = "SELECT COUNT(*) FROM [User] WHERE UserID = @id AND UserPassword = @PrevPassword";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@id", userId);
                cmd.Parameters.AddWithValue("@PrevPassword", HashPassword(txtPrevPassw.Text));

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "errorScript", $"alert('{message}');", true);
        }

        private bool IsUsernameDuplicate(string username, string userId)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT COUNT(*) FROM [User] WHERE UserName = @username AND UserID != @id";

            SqlCommand cmdCheckUsername = new SqlCommand(sql, cnn);
            cmdCheckUsername.Parameters.AddWithValue("@username", username);
            cmdCheckUsername.Parameters.AddWithValue("@id", userId);

            int count = (int)cmdCheckUsername.ExecuteScalar();

            cmdCheckUsername.Dispose();
            cnn.Close();

            return count > 0;
        }

        private bool IsEmailDuplicate(string email, string userId)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT COUNT(*) FROM [User] WHERE UserEmail = @email AND UserID != @id";

            SqlCommand cmdCheckEmail = new SqlCommand(sql, cnn);
            cmdCheckEmail.Parameters.AddWithValue("@email", email);
            cmdCheckEmail.Parameters.AddWithValue("@id", userId);

            int count = (int)cmdCheckEmail.ExecuteScalar();

            cmdCheckEmail.Dispose();
            cnn.Close();

            return count > 0;
        }

        //Hash Password Function
        public string HashPassword(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }

        protected void txtPrevPassw_TextChanged(object sender, EventArgs e)
        {
            //if the prev passw not empty
            if (txtPrevPassw.Text != "")
            {
                //if not match
                if (prevPasswHashed.Value != HashPassword(txtPrevPassw.Text))
                {
                    lblPrevPassErrorMsg.Text = "Incorrect Previous Password";
                    hiddenVal_prevPass.Value = "no";
                    lblPrevPassErrorMsg.ForeColor = System.Drawing.Color.Red;
                }
                else //if match
                {
                    lblPrevPassErrorMsg.Text = "Correct Previous Password";
                    hiddenVal_prevPass.Value = "yes";
                    lblPrevPassErrorMsg.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                lblPrevPassErrorMsg.Text = "";
                hiddenVal_prevPass.Value = "no";
            }

        }
    }
}