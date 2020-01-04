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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Cconfirmation box
                string message = "Your account have been added successfully!";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                //Database
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString);

                //Add to Customer table
                if (FileUpload1.HasFile)
                {
                    string profImage = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + profImage);

                    if (rbnAccType.SelectedIndex == 0)
                    {
                        string insertCustQuery = "INSERT into Customer (Cust_ID, Cust_Name, Cust_IC, Cust_Gender, Cust_Phone, Cust_Email, Cust_UserName, Cust_Pass, Cust_Image, Cust_Address) " +
                            "values (@id, @name, @ic, @gender, @phone, @email, @username, @password, @image, @address)";

                        conn.Open();
                        SqlCommand cmd = new SqlCommand(insertCustQuery, conn);

                        cmd.Parameters.AddWithValue("@id", lblID.Text);
                        cmd.Parameters.AddWithValue("@name", txtName.Text);
                        cmd.Parameters.AddWithValue("@ic", txtIC.Text);
                        cmd.Parameters.AddWithValue("@gender", rbnGender.SelectedIndex);
                        cmd.Parameters.AddWithValue("@phone", txtPhoneNum.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@username", txtUName.Text);
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@image", profImage);
                        cmd.Parameters.AddWithValue("@address", txtAdress.Text);

                        cmd.ExecuteNonQuery();
                        conn.Close();

                        /////////////////////////////////////////////////////////////////////////////////////////////////////////

                        //Auto generate CartID
                        string cart_ID = " ";
                        string cart = "SELECT COUNT(*) FROM Cart";
                        try
                        {
                            conn.Open();
                            SqlCommand addcartid = new SqlCommand(cart, conn);
                            int cartid = Convert.ToInt32(addcartid.ExecuteScalar());
                            cartid++;

                            if (cartid < 10)
                                cart_ID = "CA100" + Convert.ToString(cartid);
                            else if (cartid < 100)
                                cart_ID = "CA10" + Convert.ToString(cartid);
                            else
                                cart_ID = "CA" + Convert.ToString(cartid);

                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            cart_ID = "Error" + ex.ToString();
                        }

                        //Add to Cart table
                        string cartQuery = "INSERT INTO Cart (Cart_ID, Cart_Total, Cust_ID) values (@cartid, @carttotal, @id)";
                        conn.Open();
                        SqlCommand cartcmd = new SqlCommand(cartQuery, conn);

                        cartcmd.Parameters.AddWithValue("@cartid", cart_ID);
                        cartcmd.Parameters.AddWithValue("@carttotal", 0);
                        cartcmd.Parameters.AddWithValue("@id", lblID.Text);
                        cartcmd.ExecuteNonQuery();
                        conn.Close();

                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                        //Auto generate WishID
                        string wish_ID = " ";
                        string wish = "SELECT COUNT(*) FROM Wishlist";
                        try
                        {
                            conn.Open();
                            SqlCommand addwishid = new SqlCommand(wish, conn);
                            int wishid = Convert.ToInt32(addwishid.ExecuteScalar());
                            wishid++;

                            if (wishid < 10)
                                wish_ID = "W100" + Convert.ToString(wishid);
                            else if (wishid < 100)
                                wish_ID = "W10" + Convert.ToString(wishid);
                            else
                                wish_ID = "W" + Convert.ToString(wishid);

                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            wish_ID = "Error" + ex.ToString();
                        }

                        //Add to Wish table
                        string wishQuery = "INSERT INTO Wishlist (Wish_ID, Cust_ID) values (@wishid, @id)";
                        conn.Open();
                        SqlCommand wishcmd = new SqlCommand(wishQuery, conn);

                        wishcmd.Parameters.AddWithValue("@wishid", wish_ID);
                        wishcmd.Parameters.AddWithValue("@id", lblID.Text);
                        wishcmd.ExecuteNonQuery();
                        conn.Close();

                        HttpCookie httpCookie = new HttpCookie("customerName");
                        httpCookie.Value = txtUName.Text;
                        httpCookie.Expires = DateTime.Now.AddMinutes(20);
                        Response.Cookies.Add(httpCookie);

                        httpCookie = new HttpCookie("Cart_ID");
                        httpCookie.Value = cart_ID;
                        httpCookie.Expires = DateTime.Now.AddMinutes(20);
                        Response.Cookies.Add(httpCookie);

                        httpCookie = new HttpCookie("wish_ID");
                        httpCookie.Value = wish_ID;
                        httpCookie.Expires = DateTime.Now.AddMinutes(20);
                        Response.Cookies.Add(httpCookie);

                        if (Session["ReturnURL"] != null)
                        {
                            string query = Session["ReturnURL"].ToString();
                            Response.Redirect("~/" + query);
                        }
                        else
                            Response.Redirect("~/Customer_Profile.aspx");

                    }
                    else if (rbnAccType.SelectedIndex == 1)
                    {
                        string insertSellQuery = "INSERT into Seller(Seller_ID, Seller_Name, Seller_Phone, Seller_Email, Seller_IC, Seller_Rate, Seller_Gender, Seller_UserName, Seller_Pass, Seller_Image, Seller_Details)" +
                            "values(@id, @name, @phone, @email, @ic, @rate, @gender, @username, @pass, @image, @details)";

                        conn.Open();
                        SqlCommand cmd2 = new SqlCommand(insertSellQuery, conn);

                        cmd2.Parameters.AddWithValue("@id", lblID.Text);
                        cmd2.Parameters.AddWithValue("@name", txtName.Text);
                        cmd2.Parameters.AddWithValue("@phone", txtPhoneNum.Text);
                        cmd2.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd2.Parameters.AddWithValue("@ic", txtIC.Text);
                        cmd2.Parameters.AddWithValue("@rate", 0);
                        cmd2.Parameters.AddWithValue("@gender", rbnGender.SelectedIndex);
                        cmd2.Parameters.AddWithValue("@username", txtUName.Text);
                        cmd2.Parameters.AddWithValue("@pass", txtPassword.Text);
                        cmd2.Parameters.AddWithValue("@image", profImage);

                        cmd2.ExecuteNonQuery();
                        conn.Close();

                        HttpCookie httpCookie = new HttpCookie("sellerName");
                        httpCookie.Value = txtUName.Text;
                        httpCookie.Expires = DateTime.Now.AddMinutes(20);
                        Response.Cookies.Add(httpCookie);

                        if (Session["ReturnURL"] != null)
                        {
                            string query = Session["ReturnURL"].ToString();
                            Response.Redirect("~/" + query);
                        }
                        else
                            Response.Redirect("~/Seller_Profile.aspx");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Error, please try again')</script>");
                }
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void rbnAccType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            if (rbnAccType.SelectedIndex == 0)
            {
                //Address visible for customer
                Label11.Visible = true;
                Label12.Visible = true;
                txtAdress.Visible = true;

                //Automatically generated customerID            
                string stmt = "SELECT COUNT(*) FROM Customer";
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(stmt, con);
                    int cust = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    cust++;

                    if (cust < 10)
                        lblID.Text = "CU100" + Convert.ToString(cust);
                    else if (cust < 100)
                        lblID.Text = "CU10" + Convert.ToString(cust);
                    else
                        lblID.Text = "CU" + Convert.ToString(cust);

                    con.Close();
                }
                catch (Exception ex)
                {
                    lblID.Text = "Error" + ex.ToString();
                }

            }
            else if(rbnAccType.SelectedIndex == 1)
            {
                //Address unvisible for seller
                Label11.Visible = false;
                Label12.Visible = false;
                txtAdress.Visible = false;

                //Automatically generated SellerID
                string stmt = "SELECT COUNT(*) FROM Seller";
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(stmt, con);
                    int seller = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    seller++;
                    if (seller < 10)
                        lblID.Text = "SE100" + Convert.ToString(seller);
                    else if (seller < 100)
                        lblID.Text = "SE10" + Convert.ToString(seller);
                    else
                        lblID.Text = "SE" + Convert.ToString(seller);

                    con.Close();
                }
                catch (Exception ex)
                {
                    lblID.Text = "Error" + ex.ToString();
                }
            }

        }

        protected void checkExistUser_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rbnAccType.SelectedIndex == 1)
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                {
                    SqlCommand com = new SqlCommand("SELECT Seller_UserName FROM Seller", con);

                    con.Open();
                    SqlDataReader result = com.ExecuteReader();

                    while (result.Read())
                    {
                        string username = result["Seller_UserName"].ToString();
                        if (username.Equals(txtUName.Text))
                        {
                            args.IsValid = false;
                            break;
                        }
                        else
                        {
                            args.IsValid = true;
                        }
                    }
                }
            }
            else
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                {
                    SqlCommand com = new SqlCommand("SELECT Cust_UserName FROM Customer", con);

                    con.Open();
                    SqlDataReader result = com.ExecuteReader();

                    while (result.Read())
                    {
                        string username = result["Cust_UserName"].ToString();
                        if (result.Equals(txtUName.Text))
                        {
                            args.IsValid = false;
                            break;
                        }
                        else
                        {
                            args.IsValid = true;
                        }
                    }
                }
            }
        }

        protected void checkExistEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rbnAccType.SelectedIndex == 1)
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                {
                    SqlCommand com = new SqlCommand("SELECT Seller_Email FROM Seller", con);

                    con.Open();
                    SqlDataReader result = com.ExecuteReader();

                    while (result.Read())
                    {
                        string email = result["Seller_Email"].ToString();
                        if (email.Equals(txtEmail.Text))
                        {
                            args.IsValid = false;
                            break;
                        }
                        else
                        {
                            args.IsValid = true;
                        }
                    }
                }
            }
            else
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
                {
                    SqlCommand com = new SqlCommand("SELECT Cust_Email FROM Customer", con);

                    con.Open();
                    SqlDataReader result = com.ExecuteReader();

                    while (result.Read())
                    {
                        string email = result["Cust_Email"].ToString();
                        if (email.Equals(txtEmail.Text))
                        {
                            args.IsValid = false;
                            break;
                        }
                        else
                        {
                            args.IsValid = true;
                        }
                    }
                }
            }
        }
    }
}