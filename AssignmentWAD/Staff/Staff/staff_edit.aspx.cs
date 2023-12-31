using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
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
                    txtPass.Text = staff.GetValue(2).ToString();
                    ddlRole.SelectedValue = staff.GetValue(3).ToString();

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
            if (IsUsernameUnique(txtUsername.Text, Request.QueryString["staffID"]))
            {
                UpdateStaff();
            }
            else
            {
                // Display error message for duplicate username
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorScript", "alert('Username already exists. Please choose a different username.');", true);
            }
        }

        private void UpdateStaff()
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE Staff SET StaffName=@name, StaffPassword=@passw, RoleID=@roleID WHERE StaffID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            cmdUpdate.Parameters.AddWithValue("@name", txtUsername.Text);
            cmdUpdate.Parameters.AddWithValue("@passw", txtPass.Text);
            cmdUpdate.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);
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

        private bool IsUsernameUnique(string username, string staffID)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "SELECT COUNT(*) FROM [Staff] WHERE StaffName=@name AND StaffID<>@id";

            SqlCommand cmdCheckUsername = new SqlCommand(sql, cnn);
            cmdCheckUsername.Parameters.AddWithValue("@name", username);
            cmdCheckUsername.Parameters.AddWithValue("@id", staffID);

            int count = (int)cmdCheckUsername.ExecuteScalar();

            cmdCheckUsername.Dispose();
            cnn.Close();

            return count == 0;
        }


    }
}