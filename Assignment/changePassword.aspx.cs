﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class changePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool validateSellerPassword(string userName)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Seller_Email FROM Seller WHERE Seller_UserName = @UserName", con);

                com.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());

                if (string.IsNullOrEmpty(result))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        private bool validateCustPassword(string userName)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Cust_Pass FROM Customer WHERE Cust_UserName = @UserName", con);

                com.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());

                if (string.IsNullOrEmpty(result))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        protected void ChangePassword1_ChangedPassword(object sender, EventArgs e)
        {
            if (Request.Cookies["customerName"] != null)
            {
                if (validateCustPassword(Request.Cookies["customerName"].Value) != false)
                {
                    string password = txtCurrent.Text;
                    string newPass = txtNew.Text;
                    string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                    {
                        SqlCommand com = new SqlCommand("UPDATE Customer SET Cust_Pass = @NewPass WHERE Cust_Pass = @Password", con);
                        SqlDataAdapter adapter = new SqlDataAdapter();

                        com.Parameters.Add("@NewPass", SqlDbType.NVarChar).Value = newPass;
                        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;

                        con.Open();
                        adapter.UpdateCommand = com;
                        adapter.UpdateCommand.ExecuteNonQuery();
                    }
                }
            }
            else if (Request.Cookies["sellerName"] != null)
            {
                if (validateSellerPassword(Request.Cookies["sellerName"].Value) != false && txtNew.Text.Equals(txtConfirm.Text))
                {
                    string password = txtCurrent.Text;
                    string newPass = txtNew.Text;
                    string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                    {
                        SqlCommand com = new SqlCommand("UPDATE Seller SET Seller_Pass = @NewPass WHERE Seller_Pass = @Password", con);
                        SqlDataAdapter adapter = new SqlDataAdapter();

                        com.Parameters.Add("@NewPass", SqlDbType.NVarChar).Value = newPass;
                        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;

                        con.Open();
                        adapter.UpdateCommand = com;
                        adapter.UpdateCommand.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Change password successful. you will be logged out.')</script>");
                    HttpCookie aCookie = Request.Cookies["sellerName"];
                    aCookie.Expires = DateTime.Now.AddDays(-10);
                    aCookie.Value = "";
                    Response.Cookies.Add(aCookie);
                    Response.Redirect("~/Home.aspx");
                }
            }
        }
    }
}