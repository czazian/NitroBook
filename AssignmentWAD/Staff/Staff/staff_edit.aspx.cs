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
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE Staff SET StaffName=@name, StaffPassword=@passw, RoleID=@roleID WHERE StaffID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@name", txtUsername.Text);
            cmdUpdate.Parameters.AddWithValue("@passw", txtPass.Text);
            cmdUpdate.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);
            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["StaffID"]);
  
            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                System.Diagnostics.Debug.WriteLine("Idx of Item : " + i);
                Response.Redirect("~/Staff/Staff/staff.aspx");
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