﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Member
{
    public partial class member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["member_permit"] == null || Session["member_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/Error/invalid_access_permission.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "noPermission", "alert('You hav no permission!')", true);
            }
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "deleteClick")
            {
                string usernameToDelete = GetUsernameToDelete(e.CommandArgument);

                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM [User] WHERE UserID=@id";

                SqlCommand cmdDelete = new SqlCommand(sql, cnn);

                cmdDelete.Parameters.AddWithValue("@id", e.CommandArgument);
                cmdDelete.ExecuteNonQuery();
                cmdDelete.Dispose();
                cnn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to delete " + usernameToDelete + "!'); window.location ='" + ResolveUrl("~/Staff/Member/member.aspx") + "';", true);
            }
        }

        private string GetUsernameToDelete(object userID)
        {
            string username = string.Empty;

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT UserName FROM [User] WHERE UserID=@id";

            SqlCommand cmdGetUsername = new SqlCommand(sql, cnn);
            cmdGetUsername.Parameters.AddWithValue("@id", userID);

            using (SqlDataReader reader = cmdGetUsername.ExecuteReader())
            {
                if (reader.Read())
                {
                    username = reader["UserName"].ToString();
                }
            }

            cmdGetUsername.Dispose();
            cnn.Close();

            return username;
        }

        public String CreateConfirmation(Object title)
        {
            return String.Format("return confirm('Are you sure you want to delete {0}?');", title);
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
                Repeater5.DataSourceID = SqlDataSource2.ID;

            }
            else //if search value is empty
            {
                //use sqldataSource1
                Repeater1.DataSourceID = SqlDataSource1.ID;
                Repeater2.DataSourceID = SqlDataSource1.ID;
                Repeater3.DataSourceID = SqlDataSource1.ID;
                Repeater4.DataSourceID = SqlDataSource1.ID;
                Repeater5.DataSourceID = SqlDataSource1.ID;

            }
        }
    }
}