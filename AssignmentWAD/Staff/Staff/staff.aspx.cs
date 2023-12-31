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
    public partial class staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["staff_permit"] == null || Session["staff_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "deleteClick")
            {
                string staffNameToDelete = GetStaffNameToDelete(e.CommandArgument);

                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM Staff WHERE StaffID=@id";

                SqlCommand cmdDelete = new SqlCommand(sql, cnn);

                cmdDelete.Parameters.AddWithValue("@id", e.CommandArgument);
                cmdDelete.ExecuteNonQuery();
                cmdDelete.Dispose();
                cnn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to delete staff " + staffNameToDelete + "!'); window.location ='" + ResolveUrl("~/Staff/Staff/staff.aspx") + "';", true);
            }
        }

        private string GetStaffNameToDelete(object staffID)
        {
            // Retrieve the staff name based on the staffID
            string staffName = "";
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "SELECT StaffName FROM Staff WHERE StaffID=@id";
            SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);
            cmdRetrieve.Parameters.AddWithValue("@id", staffID);

            SqlDataReader reader = cmdRetrieve.ExecuteReader();
            if (reader.HasRows && reader.Read())
            {
                staffName = reader.GetString(0);
            }

            cmdRetrieve.Dispose();
            cnn.Close();

            return staffName;
        }

        public String CreateConfirmation(Object title)
        {
            return String.Format("return confirm('Are you sure you want to delete staff {0}?');", title);
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            //trigger here when search is click
            //if have search value is not null
            //use sqldataSource2
            if (txtSearch.Text != "")
            {
                Repeater1.DataSourceID = SqlDataSource2.ID;
                Repeater2.DataSourceID = SqlDataSource2.ID;
                Repeater3.DataSourceID = SqlDataSource2.ID;
                Repeater4.DataSourceID = SqlDataSource2.ID;

            }
            else //if search value is empty
            {
                //use sqldataSource1
                Repeater1.DataSourceID = SqlDataSource1.ID;
                Repeater2.DataSourceID = SqlDataSource1.ID;
                Repeater3.DataSourceID = SqlDataSource1.ID;
                Repeater4.DataSourceID = SqlDataSource1.ID;
            }
        }
    }
}