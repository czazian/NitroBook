using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Role
{
    public partial class role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlTableCell tdResult = e.Item.FindControl("tdResult") as HtmlTableCell;
                if (DataBinder.Eval(e.Item.DataItem, "Result").ToString() == "1")
                {
                    tdResult.Attributes["class"] = "Won";
                }
                else if (DataBinder.Eval(e.Item.DataItem, "Result").ToString() == "2")
                {
                    tdResult.Attributes["class"] = "Lost";
                }
            }
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "deleteClick")
            {
                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM [Role] WHERE RoleID=@id";

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