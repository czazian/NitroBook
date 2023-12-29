using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Customer
{
    public partial class OrderTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            TrackingRepeater.DataSource = TrackingSource;

            string userID = Session["UserID"].ToString();

            TrackingSource.SelectParameters["userID"].DefaultValue = userID;
            TrackingRepeater.DataBind();
            CalculateEstimatedArrivalDate();
       
        }
        private void CalculateEstimatedArrivalDate()
        {
            foreach (RepeaterItem item in TrackingRepeater.Items)
            {
                // Find the controls within the item
                Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
                Label lblArrivalDate = (Label)item.FindControl("lblArrivalDate");

                if (lblOrderDate != null && lblArrivalDate != null)
                {
                    // Assuming lblOrderDate.Text contains the payment date
                    DateTime paymentDate;

                    if (DateTime.TryParse(lblOrderDate.Text, out paymentDate))
                    {
                        // Calculate estimated arrival date
                        DateTime estimatedArrivalDate = paymentDate.AddDays(7);

                        // Set the values for lblArrivalDate
                        lblArrivalDate.Text = estimatedArrivalDate.ToShortDateString();
                    }
                    else
                    {
                        // Handle parsing failure if needed
                        lblArrivalDate.Text = "Invalid Date";
                    }
                }
            }
        }

        private SqlConnection getConnection()
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
            return conn;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int rateStar = GetSelectedRating();
            string feedback = txtFeedback.Text;
            string userID = Session["UserID"].ToString();
            DateTime dateNow = DateTime.Now;
            //string date = dateNow.ToString("dd/MM/yyyy");

            int bookID = findBookID();

            SqlConnection conn = getConnection();

            string rateSql = "INSERT INTO Comment (RateStar,Comment,CommentDate,BookID,UserID) VALUES (@RateStar,@Comment,@CommentDate,@BookID,@UserID)";

            SqlCommand cmdRate = new SqlCommand(rateSql,conn);

            cmdRate.Parameters.AddWithValue("@RateStar", rateStar);
            cmdRate.Parameters.AddWithValue("@Comment", feedback);
            cmdRate.Parameters.AddWithValue("@CommentDate", dateNow);
            cmdRate.Parameters.AddWithValue("@BookID", bookID);
            cmdRate.Parameters.AddWithValue("@UserID", userID);

            int successRate = cmdRate.ExecuteNonQuery();

            if (successRate>0) {
                Response.Redirect("~/Home/homepage.aspx");
            }
            else
            {
                lblFail.Text = "Fail to submit feedback";
            }


        }



        private int findBookID()
        {
         
                    SqlConnection conn = getConnection();

            string matchSql = "SELECT BookID FROM Book WHERE Title = @title";

            SqlCommand cmdMatch = new SqlCommand(matchSql, conn);


            foreach (RepeaterItem item in TrackingRepeater.Items)
            {
                // Find the controls within the item
                Label lblBookName1 = (Label)item.FindControl("lblBookName1");
                if (lblBookName1 != null)
                {
                    cmdMatch.Parameters.Clear();  // Clear existing parameters
                    cmdMatch.Parameters.AddWithValue("@title", lblBookName1.Text);

                }
            }

            SqlDataReader dtrMatch = cmdMatch.ExecuteReader();

            int bookID = 0;
            if (dtrMatch.HasRows)
            {
                while (dtrMatch.Read())
                {
                    bookID = int.Parse(dtrMatch["BookID"].ToString());
                }
            }
            conn.Close();

            return bookID;
        }

        private int GetSelectedRating()
        {
            RadioButton rbtRate1 = (RadioButton)lblRate1.FindControl("rbtRate1");
            RadioButton rbtRate2 = (RadioButton)lblRate2.FindControl("rbtRate2");
            RadioButton rbtRate3 = (RadioButton)lblRate3.FindControl("rbtRate3");
            RadioButton rbtRate4 = (RadioButton)lblRate4.FindControl("rbtRate4");
            RadioButton rbtRate5 = (RadioButton)lblRate5.FindControl("rbtRate5");

            if (rbtRate1.Checked)
            {
                return 1;
            }
            else if (rbtRate2.Checked)
            {
                return 2;
            }
            else if (rbtRate3.Checked)
            {
                return 3;
            }
            else if (rbtRate4.Checked)
            {
                return 4;
            }
            else if (rbtRate5.Checked)
            {
                return 5;
            }
            else
            {
                return 0;
            }
        }

    }

    }
