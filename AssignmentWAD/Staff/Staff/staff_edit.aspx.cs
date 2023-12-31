using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Staff
{
    public partial class staff_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["staff_permit"] == null || Session["staff_permit"].ToString() != "1")
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

                sql = "SELECT * FROM [Staff] WHERE StaffID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["staffID"]);
                SqlDataReader staff = cmdRetrieve.ExecuteReader();

                if (staff.HasRows && staff.Read())
                {
                    //work, can get query string
                    txtUsername.Text = staff.GetValue(1).ToString();
                    ddlRole.SelectedValue = staff.GetValue(3).ToString();

                    //put old password into hidden field
                    prevPasswHashed.Value = staff.GetValue(2).ToString();

                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            // Check if the previous password is correct
            if (!string.IsNullOrEmpty(txtPrevPassw.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "prevPassError", "alert('Incorrect Previous Password');", true);
                return;
            }

            // Check for duplicate username
            if (IsDuplicateUsername(txtUsername.Text, Request.QueryString["StaffID"]))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "duplicateUsername", "alert('Username already exists. Please choose a different username.');", true);
                return;
            }

            // Proceed with the update
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            // with update password
            String sql1 = "UPDATE Staff SET StaffName=@name, StaffPassword=@passw, RoleID=@roleID WHERE StaffID=@id";
            // without update password
            String sql2 = "UPDATE Staff SET StaffName=@name, RoleID=@roleID WHERE StaffID=@id";

            SqlCommand cmdUpdate;
            // if empty, no need update password
            if (hiddenVal_prevPass.Value == "no")
            {
                cmdUpdate = new SqlCommand(sql2, cnn);
            }
            else
            {
                cmdUpdate = new SqlCommand(sql1, cnn);
                cmdUpdate.Parameters.AddWithValue("@passw", HashPassword(txtNewPassw.Text));
            }

            // update detail
            cmdUpdate.Parameters.AddWithValue("@name", txtUsername.Text);
            cmdUpdate.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);
            // where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["StaffID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                System.Diagnostics.Debug.WriteLine("Idx of Item : " + i);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to edit staff " + txtUsername.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Staff/staff.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to update!");
            }

            cmdUpdate.Dispose();
            cnn.Close();
        }

        private bool IsDuplicateUsername(string username, string staffID)
        {
            // Check if the given username already exists (excluding the current staff ID)
            string query = "SELECT COUNT(*) FROM Staff WHERE StaffName = @Username AND StaffID != @StaffID";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;
                }
            }
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