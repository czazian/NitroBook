using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace AssignmentWAD.Staff.Dashboard
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RepeaterStatus_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Assuming 'Status' is a Label in your Repeater template
                Label statusLabel = (Label)e.Item.FindControl("StatusLabel");

                if (statusLabel != null)
                {
                    string status = (string)DataBinder.Eval(e.Item.DataItem, "Status");

                    // Set color based on status
                    switch (status)
                    {
                        case "Pending":
                            statusLabel.ForeColor = System.Drawing.Color.Blue;
                            break;
                        case "Shipping":
                            statusLabel.ForeColor = System.Drawing.Color.Chocolate;
                            break;
                        case "Delivered":
                            statusLabel.ForeColor = System.Drawing.Color.Green;
                            break;
                    }
                }
            }
        }

    }
}