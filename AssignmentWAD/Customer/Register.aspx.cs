﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace AssignmentWAD.Customer
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        private SqlConnection getConnection()
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
            return conn;
        }

        protected void lbtSubmit_Click(object sender, EventArgs e)
        {

            SqlConnection conn = getConnection();

            string RegisterSql = "INSERT INTO [User] (UserName,UserEmail,UserPassword,PhoneNo,DateOfBirth,Address,ProfileImage) VALUES (@userName,@UserEmail,@UserPassword,@PhoneNo,@DateOfBirth,@Address,@ProfileImg)";

            SqlCommand cmdRegister = new SqlCommand(RegisterSql, conn);

            cmdRegister.Parameters.AddWithValue("@userName", txtUserName.Text);
            cmdRegister.Parameters.AddWithValue("@UserEmail", txtEmail.Text);
            cmdRegister.Parameters.AddWithValue("@UserPassword", HashPassword(txtConfirmPass.Text));
            cmdRegister.Parameters.AddWithValue("@PhoneNo", txtPhoneNum.Text);
            cmdRegister.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
            cmdRegister.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmdRegister.Parameters.AddWithValue("@ProfileImg", "~/image/administrator-icon.png");

            int registerNum = cmdRegister.ExecuteNonQuery();


            if (registerNum > 0)
            {
                Session["SuccessMessage"] = "*Your account has been successfully registered!";
                conn.Close();

                Response.Redirect("~/Customer/customerLogin.aspx");
            }
            else
            {
                lblFailReg.Text = "*Fail to Register!";
            }
        }

        //Hash Password Function
        public string HashPassword(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }
    }
}
