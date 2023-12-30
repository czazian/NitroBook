using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Order
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind data for the first load
                BindData("");
            }
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();
            BindData(searchTerm);
        }

        private void BindData(string searchTerm)
        {
            try
            {
                // You may need to adjust the connection string based on your environment
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT U.UserName, U.PhoneNo, P.PaymentDate AS OrderDate, P.TotalAmount, O.Status, O.OrderID " +
                                   "FROM [User] U " +
                                   "JOIN [Order] O ON U.UserID = O.UserID " +
                                   "JOIN Payment P ON O.OrderID = P.OrderID ";

                    // Append the WHERE clause for searching if a search term is provided
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        query += "WHERE U.UserName LIKE '%' + @SearchTerm + '%' OR O.Status LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(O.OrderID AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' OR U.PhoneNo LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(P.PaymentDate AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(P.TotalAmount AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' ";
                    }

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters for search
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            command.Parameters.AddWithValue("@SearchTerm", searchTerm);
                        }

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            dataTable.Load(reader);

                            RepeaterOrder.DataSource = dataTable;
                            RepeaterOrder.DataBind();
                            RepeaterPhone.DataSource = dataTable;
                            RepeaterPhone.DataBind();
                            RepeaterAmountPaid.DataSource = dataTable;
                            RepeaterAmountPaid.DataBind();
                            RepeaterMember.DataSource = dataTable;
                            RepeaterMember.DataBind();
                            RepeaterStatus.DataSource = dataTable;
                            RepeaterStatus.DataBind();
                            RepeaterOperation.DataSource = dataTable;
                            RepeaterOperation.DataBind();
                            RepeaterOrderDate.DataSource = dataTable;
                            RepeaterOrderDate.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions, log errors, or display an error message
            }
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