using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Order
{
    public partial class order_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["OrderID"]))
                {
                    int orderID;
                    if (int.TryParse(Request.QueryString["OrderID"], out orderID))
                    {
                        LoadOrderDetails(orderID);
                        Button1.Visible = ddlStatus.SelectedValue != "Delivered";
                    }
                    else
                    {
                        Response.Redirect("~/Staff/Order/order.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Staff/Order/order.aspx");
                }
            }

        }

        protected void ddlStatus_DataBound(object sender, EventArgs e)
        {
            // hide the button when 'Delivered' is selected
            Button1.Visible = ddlStatus.SelectedValue != "Delivered";
        }


        private void LoadOrderDetails(int orderID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"SELECT
                                    U.UserName,
                                    U.UserEmail,
                                    U.PhoneNo,
                                    P.PaymentMethod,
                                    P.ShippingAddress,
                                    P.TotalAmount,
                                    P.PaymentDate AS OrderDate,
                                    O.Status
                                FROM
                                    [Order] O
                                JOIN
                                    [User] U ON O.UserID = U.UserID
                                JOIN
                                    Payment P ON O.OrderID = P.OrderID
                                WHERE
                                    O.OrderID = @OrderID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate customer info
                            txtFullName.Text = reader["UserName"].ToString();
                            txtEmail.Text = reader["UserEmail"].ToString();
                            txtPhoneNo.Text = reader["PhoneNo"].ToString();

                            // Populate order info
                            txtPayMethod.Text = reader["PaymentMethod"].ToString();
                            txtShippingAdd.Text = reader["ShippingAddress"].ToString();
                            txtTotalAmount.Text = reader["TotalAmount"].ToString();
                            txtOrderDate.Text = Convert.ToDateTime(reader["OrderDate"]).ToString("dd/MM/yyyy");
                            ddlStatus.SelectedValue = reader["Status"].ToString();

                            // Order Detail
                            RepeaterNo.DataSource = SqlDataSource1;
                            RepeaterNo.DataBind();

                            RepeaterProduct.DataSource = SqlDataSource1;
                            RepeaterProduct.DataBind();

                            RepeaterPrice.DataSource = SqlDataSource1;
                            RepeaterPrice.DataBind();

                            RepeaterQuantity.DataSource = SqlDataSource1;
                            RepeaterQuantity.DataBind();

                        }
                        else
                        {
                            Response.Redirect("~/Staff/Order/order.aspx");
                        }
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectedStatus = hdnSelectedStatus.Value;

            if (!string.IsNullOrEmpty(selectedStatus))
            {
                int orderID;
                if (int.TryParse(Request.QueryString["OrderID"], out orderID))
                {
                    bool updateSuccess = UpdateOrderStatus(orderID, selectedStatus);

                    if (updateSuccess)
                    {
                        // Show a confirmation message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Status updated successfully to Order " + orderID + "!'); window.location ='" + ResolveUrl("~/Staff/Order/order.aspx") + "';", true);
                    }
                    else
                    {
                        // Show an error message if the update fails
                        ClientScript.RegisterStartupScript(GetType(), "confirmStatusUpdate", "alert('Failed to update status.');", true);
                    }
                }
                else
                {
                    // Handle invalid OrderID
                    ClientScript.RegisterStartupScript(GetType(), "confirmStatusUpdate", "alert('Invalid OrderID.');", true);
                }
            }
        }

        private bool UpdateOrderStatus(int orderID, string selectedStatus)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "UPDATE [Order] SET Status = @Status WHERE OrderID = @OrderID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Status", selectedStatus);
                        cmd.Parameters.AddWithValue("@OrderID", orderID);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception or handle it as needed
                return false;
            }
        }

    }
}