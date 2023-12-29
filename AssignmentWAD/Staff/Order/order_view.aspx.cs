using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Order
{
    public partial class order_view : System.Web.UI.Page
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
                            txtOrderDate.Text = Convert.ToDateTime(reader["OrderDate"]).ToString("yyyy-MM-dd");
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
    }
}