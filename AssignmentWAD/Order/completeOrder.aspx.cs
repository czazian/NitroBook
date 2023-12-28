using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Order
{
    public partial class completeOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderID = "MY" + Request.QueryString["orderID"];
            string reachDate = Request.QueryString["reachDate"];

            lblTraxID.Text = orderID;
            lblDate.Text = reachDate;
        }

        protected void btnCheckOrderStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home/homepage.aspx");
        }
    }
}