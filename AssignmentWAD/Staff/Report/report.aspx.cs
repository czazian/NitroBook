using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Staff.Report
{
    public partial class report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection cnn1, cnn2, cnn3, cnn4, cnn5;
            string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            cnn1 = new SqlConnection(strConnection);
            cnn2 = new SqlConnection(strConnection);
            cnn3 = new SqlConnection(strConnection);
            cnn4 = new SqlConnection(strConnection);

            cnn1.Open();
            cnn2.Open();
            cnn3.Open();
            cnn4.Open();
            //report time filter: [all, today, month, year]
            String timeFilterVal = timeFilter.SelectedItem.Value;
            timeFilter.Items.FindByValue("today").Text = "Today (" + DateTime.Today.ToShortDateString() + ")";
            timeFilter.Items.FindByValue("month").Text = "This month: " + DateTime.Now.ToString("MMMM");
            timeFilter.Items.FindByValue("year").Text = "This year: " + DateTime.Today.Year.ToString();
            String sql1 = "";
            String sql2 = "";
            String sql3 = "";
            String sql4 = "";
            String sql5 = "";
            String sql6 = "";
            String sql7 = "";
            switch (timeFilterVal)
            {
                case "all":
                    sql1 = "SELECT COUNT(*) FROM [Order], [Payment] WHERE [Order].OrderID = [Payment].OrderID";
                    sql2 = "SELECT SUM(Quantity) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID";
                    sql3 = "SELECT SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID";
                    sql4 = "SELECT SUM(Payment.TotalAmount) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID";
                    sql5 = "SELECT [Book].BookID, [Book].Title, [Book].Price, SUM([OrderDetails].Quantity) AS 'Quantity Sold', SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID GROUP BY [Book].BooKID, [Book].Title, [Book].Price";
                    sql6 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' DESC";
                    sql7 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' ASC";
                    break;

                case "today":
                    sql1 = "SELECT COUNT(*) FROM [Order], [Payment] WHERE [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103)";             
                    sql2 = "SELECT SUM(Quantity) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103)";
                    sql3 = "SELECT SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103)";
                    sql4 = "SELECT SUM(Payment.TotalAmount) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103)";
                    sql5 = "SELECT [Book].BookID, [Book].Title, [Book].Price, SUM([OrderDetails].Quantity) AS 'Quantity Sold', SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103) GROUP BY [Book].BooKID, [Book].Title, [Book].Price";
                    sql6 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103) GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' DESC";
                    sql7 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate = convert(Date, getdate(), 103) GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' ASC";
                    break;

                case "month":
                    sql1 = "SELECT COUNT(*) FROM [Order], [Payment] WHERE [Order].OrderID = Payment.OrderID AND Payment.PaymentDate >= format(GETDATE(), '01-MM-yyyy')";                  
                    sql2 = "SELECT SUM(Quantity) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy')";
                    sql3 = "SELECT SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy')";
                    sql4 = "SELECT SUM(Payment.TotalAmount) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy')";
                    sql5 = "SELECT [Book].BookID, [Book].Title, [Book].Price, SUM([OrderDetails].Quantity) AS 'Quantity Sold', SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price";
                    sql6 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' DESC";
                    sql7 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-MM-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' ASC";
                    break;

                case "year":
                    sql1 = "SELECT COUNT(*) FROM [Order], [Payment] WHERE [Order].OrderID = Payment.OrderID AND Payment.PaymentDate >= format(GETDATE(), '01-01-yyyy')";                 
                    sql2 = "SELECT SUM(Quantity) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy')";
                    sql3 = "SELECT SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy')";
                    sql4 = "SELECT SUM(Payment.TotalAmount) FROM [OrderDetails], [Order], [Payment] WHERE [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy')";
                    sql5 = "SELECT [Book].BookID, [Book].Title, [Book].Price, SUM([OrderDetails].Quantity) AS 'Quantity Sold', SUM([OrderDetails].Quantity*[Book].Price) AS 'Total Price' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price";
                    sql6 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' DESC";
                    sql7 = "SELECT TOP 5 [Book].BookID, [Book].Title, [Book].Price, [Book].[Image], SUM([OrderDetails].Quantity) AS 'Quantity Sold' FROM [OrderDetails], [Order], [Payment], [Book] WHERE [Book].BookID = [OrderDetails].BooKID AND [OrderDetails].OrderID = [Order].OrderID AND [Order].OrderID = [Payment].OrderID AND [Payment].PaymentDate >= format(GETDATE(), '01-01-yyyy') GROUP BY [Book].BooKID, [Book].Title, [Book].Price, [Book].[Image] ORDER BY 'Quantity Sold' ASC";
                    break;

            }

            SqlCommand cmdRetrieve1 = new SqlCommand(sql1, cnn1);
            SqlCommand cmdRetrieve2 = new SqlCommand(sql2, cnn2);
            SqlCommand cmdRetrieve3 = new SqlCommand(sql3, cnn3);
            SqlCommand cmdRetrieve4 = new SqlCommand(sql4, cnn4);

            SqlDataReader totalOrder = cmdRetrieve1.ExecuteReader();
            SqlDataReader quanSales = cmdRetrieve2.ExecuteReader();
            SqlDataReader salesProfit = cmdRetrieve3.ExecuteReader();
            SqlDataReader totalProfit = cmdRetrieve4.ExecuteReader();

            if ((totalOrder.HasRows && totalOrder.Read()) && (salesProfit.HasRows && salesProfit.Read()) && (quanSales.HasRows && quanSales.Read()) && (totalProfit.HasRows && totalProfit.Read()))
            {
                lblNoRecord.Text = "";
                lblTotalOrder.Text = totalOrder.GetValue(0).ToString();
                lblQuanSales.Text = quanSales.GetValue(0).ToString();
                lblSalesProfit.Text = salesProfit.GetValue(0).ToString();
                lblTotalProfit.Text = totalProfit.GetValue(0).ToString();

                if(totalOrder.GetValue(0).ToString() == "0")
                {
                    lblQuanSales.Text = "0";
                    lblSalesProfit.Text = "0";
                    lblTotalProfit.Text = "0";
                    lblNoRecord.Text = "No records found...";
                }
                //bind to a data source
                SqlDataSource1.SelectCommand = sql5;
                SqlDataSource2.SelectCommand = sql6;
                SqlDataSource3.SelectCommand = sql7;
                SqlDataSource1.DataBind();
                Repeater1.DataBind();
                Repeater2.DataBind();
                Repeater3.DataBind();
                Repeater4.DataBind();
                Repeater5.DataBind();
                Repeater6.DataBind();
                Repeater7.DataBind();
            }
            else
            {
                Response.Write("Invalid Records");
            }

        }

        protected void timeFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}