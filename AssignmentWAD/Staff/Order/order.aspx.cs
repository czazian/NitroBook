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
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT U.UserName, U.PhoneNo, P.PaymentDate AS OrderDate, P.TotalAmount, O.Status, O.OrderID " +
                                   "FROM [User] U " +
                                   "JOIN [Order] O ON U.UserID = O.UserID " +
                                   "JOIN Payment P ON O.OrderID = P.OrderID ";

                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        query += "WHERE U.UserName LIKE '%' + @SearchTerm + '%' OR O.Status LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(O.OrderID AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' OR U.PhoneNo LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(P.PaymentDate AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' " +
                            "OR CAST(P.TotalAmount AS NVARCHAR(50)) LIKE '%' + @SearchTerm + '%' ";
                    }

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            command.Parameters.AddWithValue("@SearchTerm", searchTerm);
                        }

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            dataTable.Load(reader);

                            // Always show the repeater controls
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

                            if (dataTable.Rows.Count > 0)
                            {
                                // Records found, hide the "No matching records found" message
                                lblNoRecordsFound.Visible = false;
                            }
                            else
                            {
                                // No records found, display the "No matching records found" message
                                lblNoRecordsFound.Visible = true;
                                lblNoRecordsFound.Text = "No matching records found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblNoRecordsFound.Visible = true;
                lblNoRecordsFound.Text = "No matching records found.";
            }
        }

        protected void RepeaterStatus_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
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