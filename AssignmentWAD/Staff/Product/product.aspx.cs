﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Product
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater6_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "deleteClick")
            {
                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM Book WHERE BookID=@id";

                SqlCommand cmdDelete = new SqlCommand(sql, cnn);

                cmdDelete.Parameters.AddWithValue("@id", e.CommandArgument);
                cmdDelete.ExecuteNonQuery();
                cmdDelete.Dispose();
                cnn.Close();

                Response.Redirect(Request.RawUrl);
            }
        }

        public String CreateConfirmation(Object title) 
        {
            return String.Format("return confirm('Are you sure you want to delete {0}?');", title);
        }

    }
}