using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CosplayWeb
{
    public partial class Seller_Profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        //Like or dislike
        //protected void LinkButton1_Command(object sender, CommandEventArgs e)
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);
            
        //    string unlike = "far fa-heart icon_heart1";
        //    string like = "fas fa-heart icon_heart2";
        //    int updatedstatuslike = 0;

        //    int totalLike = Convert.ToInt32((Repeater3.Items[index].FindControl("numLikes") as Label).Text);
        //    //int likestatus = Convert.ToInt32((Repeater3.Items[index].FindControl("")))
        //    string passIn = (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass;
        //    string galleryID = (Repeater3.Items[index].FindControl("hidden_Gallery_ID") as HiddenField).Value;

        //    string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
        //    SqlConnection con = new SqlConnection(conString);
        //    HttpCookie cookie = Request.Cookies["sellerName"];

        //    string username = Server.HtmlEncode(cookie.Value);
        //    string getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + username + "'";

        //    con.Open();
        //    SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
        //    string userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
        //    con.Close();

        //    SqlDataAdapter adapter = new SqlDataAdapter();
            

        //    if (passIn.Equals(unlike))
        //    {
        //        updatedstatuslike = 1;

        //        (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = like;
        //        totalLike++;
        //        (Repeater3.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);

        //        string updateStatusLike = "UPDATE [Like] set LikeStatus = '" + updatedstatuslike + "'WHERE Gallery_ID = '" + galleryID + "' AND User_ID = '" + userID + "'";
        //        string updateTotalLike = "UPDATE Gallery set TotalLikes = '" + totalLike + "' WHERE Gallery_ID = '" + galleryID + "'";

        //        con.Open();
        //        SqlCommand cmd1 = new SqlCommand(updateTotalLike, con);
        //        SqlCommand cmd2 = new SqlCommand(updateStatusLike, con);

        //        adapter.UpdateCommand = cmd1;
        //        cmd1.ExecuteNonQuery();

        //        adapter.UpdateCommand = cmd2;
        //        cmd2.ExecuteNonQuery();

        //        con.Close();

        //    }
        //    else
        //    {
        //        updatedstatuslike = 0;

        //        (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = unlike;
        //        totalLike--;
        //        (Repeater3.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);

        //        string updateStatusLike = "UPDATE [Like] set LikeStatus = '" + updatedstatuslike + "'WHERE Gallery_ID = '" + galleryID + "' AND User_ID = '" + userID + "'";
        //        string updateTotalLike = "UPDATE Gallery set TotalLikes = '" + totalLike + "' WHERE Gallery_ID = '" + galleryID + "'";

        //        con.Open();
        //        SqlCommand cmd1 = new SqlCommand(updateTotalLike, con);
        //        SqlCommand cmd2 = new SqlCommand(updateStatusLike, con);

        //        adapter.UpdateCommand = cmd1;
        //        cmd1.ExecuteNonQuery();

        //        adapter.UpdateCommand = cmd2;
        //        cmd2.ExecuteNonQuery();

        //        con.Close();
        //    }
            

        //}

        //Show comment box or not
        //protected void LinkButton2_Command(object sender, CommandEventArgs e)
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);


        //    string state1 = "far fa-comment icon_comment";
        //    string state2 = "far fa-comment-dots icon_comment";

        //    string passIn = (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass;

        //    if (passIn.Equals(state1))
        //    {
        //        (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass = state2;
        //        (Repeater3.Items[index].FindControl("tbx_comment") as TextBox).Visible = true;
        //        (Repeater3.Items[index].FindControl("username_comment") as Label).Visible = true;

        //    }
        //    else
        //    {
        //        (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass = state1;
        //        (Repeater3.Items[index].FindControl("tbx_comment") as TextBox).Visible = false;
        //        (Repeater3.Items[index].FindControl("username_comment") as Label).Visible = false;
        //    }

        //}

        //Delete this post
        protected void LinkButton3_Command(object sender, CommandEventArgs e)
        {

        }

        //initialise when first run the repeater
        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            HttpCookie cookie = Request.Cookies["sellerName"];

            string status="";
            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            
            string username = Server.HtmlEncode(cookie.Value);
            string galleryID = (e.Item.FindControl("hidden_Gallery_ID") as HiddenField).Value;

            string getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + username + "'";

            con.Open();
            SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
            string userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
            con.Close();

            string setLikeStatus = "INSERT into [Like] (Gallery_ID, LikeStatus, User_ID) values (@galleryID, @likestatus, @userID)";

            string stmt = "SELECT L.LikeStatus FROM Gallery G join Seller S on G.User_ID = S.Seller_ID join [Like] L on (L.Gallery_ID = G.Gallery_ID AND L.User_ID = S.Seller_ID) " +
                "WHERE (S.Seller_UserName = '" + username + "' AND G.Gallery_ID = '" + galleryID + "')";
            
            con.Open();


            SqlCommand cmdCount = new SqlCommand(stmt, con);
            SqlDataReader dr = cmdCount.ExecuteReader();

            while (dr.Read())
            {
                status = dr["LikeStatus"].ToString();
            }

            con.Close();

            if (status == "1")
            {
                (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = like;
            }
            else if (status == "0")
            {
                (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = unlike;
            }
            else
            {
                status = "0";
                (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                con.Open();
                SqlCommand cmd1 = new SqlCommand(setLikeStatus, con);

                cmd1.Parameters.AddWithValue("@galleryID", galleryID);
                cmd1.Parameters.AddWithValue("@likestatus", status);
                cmd1.Parameters.AddWithValue("@userID", userID);

                cmd1.ExecuteNonQuery();
                con.Close();
            }




        }

        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string customer = "";
            string seller = "";

            string userID = (e.Item.FindControl("hdn_userID") as HiddenField).Value;
            string uname = (e.Item.FindControl("lbl_uname") as Label).Text;
            string custName = "SELECT CU.Cust_Username FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string sellName = "Select S.Seller_Username FROM Seller S WHERE S.Seller_ID = '" + userID + "'";

            con.Open();
            
            SqlCommand getCustName = new SqlCommand(custName, con);
            SqlCommand getSellName = new SqlCommand(sellName, con);

            customer = Convert.ToString(getCustName.ExecuteScalar());
            seller = Convert.ToString(getSellName.ExecuteScalar());

            if(customer != "")
            {
                (e.Item.FindControl("lbl_uname") as Label).Text = customer;
            }
            else
            {
                (e.Item.FindControl("lbl_uname") as Label).Text = seller;
            }


        }
    }
}