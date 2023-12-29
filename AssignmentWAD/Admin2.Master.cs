using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD
{
    public partial class Admin2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label adminNameLabel = FindControl("adminNameLabel") as Label;

                if (adminNameLabel != null && Session["StaffName"] != null)
                {
                    adminNameLabel.Text = Session["StaffName"].ToString();
                }
                else
                {
                    Response.Redirect("/Staff/staffLogin.aspx");
                }

            }
        }
    }
}