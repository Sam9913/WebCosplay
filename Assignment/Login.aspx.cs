using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                if (rblRole.SelectedIndex == 1)
                    Response.Redirect("~/Seller_Profile.aspx");
                else if (rblRole.SelectedIndex == 0)
                    Response.Redirect("~/Customer_Profile.aspx");
            }
        }

        private bool SellerLogin(string userName, string password)
        {

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Seller_UserName FROM Seller WHERE Seller_UserName = @UserName AND Seller_Pass = @Password", con);

                com.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;
                com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());

                if (string.IsNullOrEmpty(result))
                {
                    return false;
                }
                else
                {
                    HttpCookie httpCookie = new HttpCookie("sellerName");
                    httpCookie.Value = userName;
                    httpCookie.Expires = DateTime.Now.AddMinutes(20);
                    Response.Cookies.Add(httpCookie);

                    return true;
                }
            }
        }

        private bool CustLogin(string userName, string password)
        {

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Cust_UserName FROM Customer WHERE Cust_UserName = @UserName AND Cust_Pass = @Password", con);

                com.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;
                com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());

                if (string.IsNullOrEmpty(result))
                {
                    return false;
                }
                else
                {
                    HttpCookie httpCookie = new HttpCookie("customerName");
                    httpCookie.Value = userName;
                    httpCookie.Expires = DateTime.Now.AddMinutes(20);
                    Response.Cookies.Add(httpCookie);

                    return true;
                }
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool result = false;
            string userName = Login1.UserName;
            string password = Login1.Password;

            if (rblRole.SelectedIndex == 0) {
                result = CustLogin(userName, password);
            }
            else if(rblRole.SelectedIndex == 1) {
                result = SellerLogin(userName, password);
            }

            if ((result))
            {
                e.Authenticated = true;
            }
            else
            {
                e.Authenticated = false;
            }
        }
    }
}