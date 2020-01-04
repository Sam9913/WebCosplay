using System;
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
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (Session["ReturnURL"] != null)
            {
                string query = Session["ReturnURL"].ToString();
                Response.Redirect("~/" + query);
            }
            else if (rblRole.SelectedIndex == 1)
                Response.Redirect("~/Seller_Profile.aspx");
            else if (rblRole.SelectedIndex == 0)
                Response.Redirect("~/Customer_Profile.aspx");
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

                SqlCommand getWish = new SqlCommand("SELECT W.Wish_ID FROM Wishlist W inner join Customer CU on W.Cust_ID=CU.Cust_ID where CU.Cust_UserName=@username", con);
                getWish.Parameters.Add("@username", SqlDbType.NVarChar).Value = userName;


                SqlCommand getCart = new SqlCommand("SELECT C.Cart_ID FROM Cart C inner join Customer CU on C.Cust_ID=CU.Cust_ID where CU.Cust_UserName=@username", con);
                getCart.Parameters.Add("@username", SqlDbType.NVarChar).Value = userName;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());
                SqlDataReader drwish =getWish.ExecuteReader();

                SqlDataReader drcart = getCart.ExecuteReader();

                while (drwish.Read())
                {
                    string wishID = drwish["Wish_ID"].ToString();
                    HttpCookie httpCookie = new HttpCookie("wish_ID");
                    httpCookie.Value = wishID;
                    httpCookie.Expires = DateTime.Now.AddMinutes(20);
                    Response.Cookies.Add(httpCookie);

                }

                while (drcart.Read())
                {
                    string cartID = drcart["Cart_ID"].ToString();
                    HttpCookie httpCookie = new HttpCookie("Cart_ID");
                    httpCookie.Value = cartID;
                    httpCookie.Expires = DateTime.Now.AddMinutes(20);
                    Response.Cookies.Add(httpCookie);
                }

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

            if (rblRole.SelectedIndex == 0)
            {
                result = CustLogin(userName, password);
            }
            else if (rblRole.SelectedIndex == 1)
            {
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

        protected void lbPass_Click(object sender, EventArgs e)
        {
            Session["forPass"] = true;
        }
    }
}