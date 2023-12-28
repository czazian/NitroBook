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
    public partial class staff_create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO Staff(StaffName, StaffPassword, RoleID) values (@name, @passw, @roleID)";

            SqlCommand cmdInsert = new SqlCommand(sql, cnn);

            cmdInsert.Parameters.AddWithValue("@name", txtUsername.Text);
            cmdInsert.Parameters.AddWithValue("@passw", txtPass.Text);
            cmdInsert.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Staff/Staff/staff.aspx");
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