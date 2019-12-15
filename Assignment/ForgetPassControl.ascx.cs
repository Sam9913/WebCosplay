using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ForgetPassControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string getSellerEmail(string userName)
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
                    return null;
                }
                else
                {
                    return result;
                }
            }
        }

        private string getCustEmail(string userName)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Cust_Email FROM Customer WHERE Cust_UserName = @UserName", con);

                com.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;

                con.Open();
                string result = Convert.ToString(com.ExecuteScalar());

                if (string.IsNullOrEmpty(result))
                {
                    return null;
                }
                else
                {
                    return result;
                }
            }
        }

        private string getSellerPassword(string userName)
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
                    return null;
                }
                else
                {
                    return result;
                }
            }
        }

        private string getCustPassword(string userName)
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
                    return null;
                }
                else
                {
                    return result;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (getCustEmail(txtName.Text) != null)
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("tansh9913@gmail.com");
                mailMessage.To.Add(new MailAddress(getCustEmail(txtName.Text)));
                mailMessage.Subject = "Your subject";
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "Your password is " + getCustPassword(txtName.Text);

                SmtpClient client = new SmtpClient();
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("tansh9913@gmail.com", "TAN 990213");
                client.Host = "smtp.gmail.com";
                client.Send(mailMessage);
            }
            else if (getSellerEmail(txtName.Text) != null)
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("tansh9913@gmail.com");
                mailMessage.To.Add(new MailAddress(getSellerEmail(txtName.Text)));
                mailMessage.Subject = "Your subject";
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "Your password is " + getSellerPassword(txtName.Text);

                SmtpClient client = new SmtpClient();
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("tansh9913@gmail.com", "TAN 990213");
                client.Host = "smtp.gmail.com";
                client.Send(mailMessage);
            }
            else
                Response.Write("<script language=javascript>alert('Invalid username!')</script>");
        }
    }
}