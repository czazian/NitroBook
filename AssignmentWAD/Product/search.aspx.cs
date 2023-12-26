using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Search
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Variable definitions
            string para = Request.QueryString["para"];

            if (para != "")
            {
                //Database
                SqlConnection conn;
                string strConnection = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

                conn = new SqlConnection(strConnection);

                conn.Open();

                string command = "SELECT DISTINCT * FROM Book WHERE UPPER(Author) LIKE UPPER('%' + @para + '%') OR UPPER(Title) LIKE UPPER('%' + @para + '%')";
                SqlCommand cmd = new SqlCommand(command, conn);

                cmd.Parameters.AddWithValue("@para", para);

                SqlDataReader reader = cmd.ExecuteReader();
                
                if (reader.HasRows)
                {
                    BookRepeater.DataSource = reader;
                    BookRepeater.DataBind();

                    //Count number of records
                    noOfBooks.Text = BookRepeater.Controls.Count.ToString();
                }
                else
                {
                    BookRepeater.DataSource = null;
                    BookRepeater.DataBind();
                    noOfBooks.Text = BookRepeater.Controls.Count.ToString();
                }
            } 

        }

        protected void linkBtn1_Command(object sender, CommandEventArgs e)
        {
            string destination = "~/Product/IndividualProduct.aspx?bookID=" + e.CommandArgument.ToString();
            Response.Redirect(destination);
        }
    }
}