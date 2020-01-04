using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CosplayWeb
{
    public partial class Seller_Gallery : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string login_username = "";
            string getUserID = "";
            string login_userID = "";
            Boolean isSeller = false;

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            if (Request.Cookies["customerName"] == null && Request.Cookies["sellerName"] == null)
            {
                login_username = "";
                login_userID = "";
                isSeller = false;
            }
            else if (Request.Cookies["customerName"] != null)
            {
                HttpCookie cookie = Request.Cookies["customerName"];
                login_username = Server.HtmlEncode(cookie.Value);
                isSeller = false;
                getUserID = "SELECT CU.Cust_ID FROM Customer CU WHERE CU.Cust_Username = '" + login_username + "'";

                con.Open();
                SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
                login_userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
                con.Close();
            }
            else if (Request.Cookies["sellerName"] != null)
            {
                HttpCookie cookie = Request.Cookies["sellerName"];
                login_username = Server.HtmlEncode(cookie.Value);
                isSeller = true;
                getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + login_username + "'";

                con.Open();
                SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
                login_userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
                con.Close();
            }

            hdn_loginUserID.Value = login_userID;
            hdn_isSeller.Value = Convert.ToString(isSeller);
        }

        protected void Button_addProduct_onClick(object sender, EventArgs e)
        {

        }

        protected void gallery_image_Command(object sender, CommandEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "open_modal_postDetails();", true);

            int index = Convert.ToInt32(e.CommandArgument);
            Boolean isSeller = false;

            string galleryID = (Repeater1.Items[index].FindControl("hdn_galleryID") as HiddenField).Value;
            string userID = (Repeater1.Items[index].FindControl("hdn_userID") as HiddenField).Value;

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string getSName = "SELECT S.Seller_Name FROM Seller S WHERE S.Seller_ID = '" + userID + "'";
            string getCName = "SELECT CU.Cust_Name FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string username = "";

            if (userID.StartsWith("SE"))
            {
                isSeller = true;
            }

            if (isSeller)
            {
                con.Open();
                SqlCommand sqlGetSName = new SqlCommand(getSName, con);
                username = Convert.ToString(sqlGetSName.ExecuteScalar());
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand sqlGetCName = new SqlCommand(getCName, con);
                username = Convert.ToString(sqlGetCName.ExecuteScalar());
                con.Close();
            }


            enPost_image.ImageUrl = (Repeater1.Items[index].FindControl("gallery_image") as ImageButton).ImageUrl;
            enPost_desc.Text = (Repeater1.Items[index].FindControl("hdn_desc") as HiddenField).Value;
            enPost_date.Text = (Repeater1.Items[index].FindControl("hdn_date") as HiddenField).Value;
            enPost_username.Text = username;
            enPost_userImg.ImageUrl = (Repeater1.Items[index].FindControl("hdn_userImg") as HiddenField).Value;
            enPost_tag.Text = "#" + (Repeater1.Items[index].FindControl("hdn_tag") as HiddenField).Value;
            enPost_galleryID.Value = (Repeater1.Items[index].FindControl("hdn_galleryID") as HiddenField).Value;
            enPost_numLikes.Text = (Repeater1.Items[index].FindControl("numLikes") as Label).Text;
            enPost_LinkButton1.CssClass = (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass;
            enPost_itemIndex.Value = (Repeater1.Items[index].FindControl("hdn_itemIndex") as HiddenField).Value;
            enPost_numComment.Text = (Repeater1.Items[index].FindControl("numComment") as Label).Text;

            //con.Close();


            //enPost_image.ImageUrl = (Repeater1.Items[index].FindControl("hidden_Gallery_ID") as HiddenField).Value;


        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Boolean isSeller = false;
            string userID = (e.Item.FindControl("hdn_userID") as HiddenField).Value;

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string getSName = "SELECT S.Seller_Name FROM Seller S WHERE S.Seller_ID = '" + userID + "'";
            string getCName = "SELECT CU.Cust_Name FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string username = "";

            string getSImg = "SELECT S.Seller_Image FROM Seller S WHERE S.Seller_ID = '" + userID + "'";
            string getCImg = "SELECT CU.Cust_Image FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string userImg = "";

            if (userID.StartsWith("SE"))
            {
                isSeller = true;
            }

            if (isSeller)
            {
                con.Open();
                SqlCommand sqlGetSName = new SqlCommand(getSName, con);
                SqlCommand sqlGetSImg = new SqlCommand(getSImg, con);
                username = Convert.ToString(sqlGetSName.ExecuteScalar());
                userImg = Convert.ToString(sqlGetSImg.ExecuteScalar());
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand sqlGetCName = new SqlCommand(getCName, con);
                SqlCommand sqlGetCImg = new SqlCommand(getCImg, con);
                username = Convert.ToString(sqlGetCName.ExecuteScalar());
                userImg = Convert.ToString(sqlGetCImg.ExecuteScalar());
                con.Close();
            }

            (e.Item.FindControl("post_username") as Label).Text = username;
            (e.Item.FindControl("hdn_userImg") as HiddenField).Value = "~/image/" + userImg;

            //initialise the icon_heart based on cookie
            int status;
            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            string galleryID = (e.Item.FindControl("hdn_galleryID") as HiddenField).Value;
            string login_userID = hdn_loginUserID.Value;

            if(login_userID == "")
            {
                (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = unlike;
            }

            else
            {
                string setLikeStatus = "INSERT into [Like] (Gallery_ID, LikeStatus, User_ID) values (@galleryID, @likestatus, @userID)";
                string getLikeStatus = "SELECT L.LikeStatus FROM [Like] L WHERE (L.Gallery_ID = '" + galleryID + "' AND L.User_ID = '" + login_userID + "')";

                con.Open();
                SqlCommand sqlGetLikeStatus = new SqlCommand(getLikeStatus, con);
                status = Convert.ToInt32(sqlGetLikeStatus.ExecuteScalar());
                con.Close();

                if (status == 1)
                {
                    (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = like;
                }
                else if (status == -1)
                {
                    (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                }
                else
                {
                    status = -1;
                    (e.Item.FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(setLikeStatus, con);

                    cmd1.Parameters.AddWithValue("@galleryID", galleryID);
                    cmd1.Parameters.AddWithValue("@likestatus", status);
                    cmd1.Parameters.AddWithValue("@userID", login_userID);

                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
            }
            
            //get number count of comments for each post
            string getCountComment = "SELECT COUNT(*) FROM Comment C WHERE C.Gallery_ID = '" + galleryID + "'";
            con.Open();
            SqlCommand cmdGetCountComment = new SqlCommand(getCountComment, con);
            string countComment = Convert.ToString(cmdGetCountComment.ExecuteScalar());
            con.Close();
            (e.Item.FindControl("numComment") as Label).Text = countComment;
            
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string customer = "";
            string seller = "";

            string userID = (e.Item.FindControl("hdn_cmt_userID") as HiddenField).Value;
            string custName = "SELECT CU.Cust_Name FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string sellName = "Select S.Seller_Name FROM Seller S WHERE S.Seller_ID = '" + userID + "'";

            con.Open();

            SqlCommand getCustName = new SqlCommand(custName, con);
            SqlCommand getSellName = new SqlCommand(sellName, con);

            customer = Convert.ToString(getCustName.ExecuteScalar());
            seller = Convert.ToString(getSellName.ExecuteScalar());

            if (customer != "")
            {
                (e.Item.FindControl("cmt_username") as Label).Text = customer;
            }
            else
            {
                (e.Item.FindControl("cmt_username") as Label).Text = seller;
            }

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            int updatedstatuslike = 0;

            int totalLike = Convert.ToInt32((Repeater1.Items[index].FindControl("numLikes") as Label).Text);
            string passIn = (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass;
            string galleryID = (Repeater1.Items[index].FindControl("hdn_galleryID") as HiddenField).Value;


            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string login_userID = hdn_loginUserID.Value;

            if (login_userID == "")
            {
                string str = "You need to login to proceed the action. Do you want to login now?";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Popup", "ConfirmApproval('" + str + "');", true);
            }

            else
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                if (passIn.Equals(unlike))
                {
                    updatedstatuslike = 1;
                    totalLike++;
                    (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = like;
                    (Repeater1.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);
                }
                else
                {
                    updatedstatuslike = -1;
                    totalLike--;
                    (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                    (Repeater1.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);
                }

                string updateStatusLike = "UPDATE [Like] set LikeStatus = '" + updatedstatuslike + "'WHERE Gallery_ID = '" + galleryID + "' AND User_ID = '" + login_userID + "'";
                string updateTotalLike = "UPDATE Gallery set TotalLikes = '" + totalLike + "' WHERE Gallery_ID = '" + galleryID + "'";

                con.Open();
                SqlCommand cmd1 = new SqlCommand(updateTotalLike, con);
                SqlCommand cmd2 = new SqlCommand(updateStatusLike, con);

                adapter.UpdateCommand = cmd1;
                cmd1.ExecuteNonQuery();

                adapter.UpdateCommand = cmd2;
                cmd2.ExecuteNonQuery();

                con.Close();

            }


        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            string login_userID = hdn_loginUserID.Value;
            if (login_userID == "")
            {
                string str = "You need to login to proceed the action. Do you want to login now?";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Popup", "ConfirmApproval('" + str + "');", true);
            }
            else
            {
                gallery_image_Command(sender, e);
            }
        }

        protected void enPost_LinkButton1_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(enPost_itemIndex.Value);

            LinkButton1_Command(sender, index);
        }

        protected void LinkButton1_Command(object sender, int index)
        {

            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            int updatedstatuslike = 0;

            int totalLike = Convert.ToInt32((Repeater1.Items[index].FindControl("numLikes") as Label).Text);
            string passIn = (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass;
            string galleryID = (Repeater1.Items[index].FindControl("hdn_galleryID") as HiddenField).Value;
            string login_userID = hdn_loginUserID.Value;

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            if (login_userID == "")
            {
                string str = "You need to login to proceed the action. Do you want to login now?";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Popup", "ConfirmApproval('" + str + "');", true);
            }

            else
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                if (passIn.Equals(unlike))
                {
                    updatedstatuslike = 1;
                    totalLike++;
                    (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = like;
                    (Repeater1.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);
                    enPost_LinkButton1.CssClass = like;
                    enPost_numLikes.Text = Convert.ToString(totalLike);
                }
                else
                {
                    updatedstatuslike = -1;
                    totalLike--;
                    (Repeater1.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                    (Repeater1.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);
                    enPost_LinkButton1.CssClass = unlike;
                    enPost_numLikes.Text = Convert.ToString(totalLike);
                }

                string updateStatusLike = "UPDATE [Like] set LikeStatus = '" + updatedstatuslike + "'WHERE Gallery_ID = '" + galleryID + "' AND User_ID = '" + login_userID + "'";
                string updateTotalLike = "UPDATE Gallery set TotalLikes = '" + totalLike + "' WHERE Gallery_ID = '" + galleryID + "'";

                con.Open();
                SqlCommand cmd1 = new SqlCommand(updateTotalLike, con);
                SqlCommand cmd2 = new SqlCommand(updateStatusLike, con);

                adapter.UpdateCommand = cmd1;
                cmd1.ExecuteNonQuery();

                adapter.UpdateCommand = cmd2;
                cmd2.ExecuteNonQuery();

                con.Close();
                Repeater1.DataBind();
            }

            //Repeater1.DataBind();
        }
    

        protected void linkbtn_send_Click(object sender, EventArgs e)
        {
            int index;

            index = Convert.ToInt32(enPost_itemIndex.Value);

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string login_userID = hdn_loginUserID.Value;
            string comment = tbx_comment.Text;
            int noComment = Convert.ToInt32(enPost_numComment.Text);
            
            string galleryID = Convert.ToString(enPost_galleryID.Value);
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss");

            string addComment = "INSERT into Comment (Comment, Date, Time, Gallery_ID, User_ID) values (@comment, @date, @time, @galleryID, @userID)";

            con.Open();
            SqlCommand cmd1 = new SqlCommand(addComment, con);
            cmd1.Parameters.AddWithValue("@comment", comment);
            cmd1.Parameters.AddWithValue("@date", date);
            cmd1.Parameters.AddWithValue("@time", time);
            cmd1.Parameters.AddWithValue("@galleryID", galleryID);
            cmd1.Parameters.AddWithValue("@userID", login_userID);

            cmd1.ExecuteNonQuery();
            con.Close();

            Repeater2.DataBind();
            Repeater1.DataBind();

            noComment++;

            enPost_numComment.Text = Convert.ToString(noComment);
            (Repeater1.Items[index].FindControl("numComment")as Label).Text = Convert.ToString(noComment);

            tbx_comment.Text = null;
            enPost_LinkButton2.CssClass = "far fa-comment icon_comment";
            tbx_comment.Visible = false;
            username_comment.Visible = false;
            linkbtn_send.Visible = false;
            wrapper.Visible = false;

        }

        protected void enPost_LinkButton2_Click(object sender, EventArgs e)
        {
            int index;

            index = Convert.ToInt32(enPost_itemIndex.Value);

            string state1 = "far fa-comment icon_comment";
            string state2 = "far fa-comment-dots icon_comment";

            string passIn = enPost_LinkButton2.CssClass;
            string login_userID = hdn_loginUserID.Value;

            if (login_userID == "")
            {
                string str = "You need to login to proceed the action. Do you want to login now?";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Popup", "ConfirmApproval('" + str + "');", true);
            }
            else
            {
                if (passIn.Equals(state1))
                {
                    enPost_LinkButton2.CssClass = state2;
                    tbx_comment.Visible = true;
                    username_comment.Visible = true;
                    linkbtn_send.Visible = true;
                    wrapper.Visible = true;

                }
                else
                {
                    enPost_LinkButton2.CssClass = state1;
                    tbx_comment.Visible = false;
                    username_comment.Visible = false;
                    linkbtn_send.Visible = false;
                    wrapper.Visible = false;
                }
            }


        }
    }
}