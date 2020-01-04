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
    public partial class Seller_Profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Generate new Gallery ID (Post)
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string stmt = "SELECT COUNT(*) FROM Gallery";
            
            try
            {
                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmt, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                if (RecordCount < 10)
                    res_addPost_id.Text = "G100" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    res_addPost_id.Text = "G10" + Convert.ToString(RecordCount);

                else
                    res_addPost_id.Text = "G1" + Convert.ToString(RecordCount);

                con.Close();

            }
            catch (Exception ex)
            {
                res_addPost_id.Text = "Error in execution " + ex.ToString();
            }

            if (Request.Cookies["sellerName"] != null)
            {
                HttpCookie cookie = Request.Cookies["sellerName"];

                string username = Server.HtmlEncode(cookie.Value);
                string getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + username + "'";

                con.Open();
                SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
                string userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
                con.Close();

                hdn_login_userID.Value = userID;
            }
        }

        //Like or dislike
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            
            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            int updatedstatuslike = 0;

            int totalLike = Convert.ToInt32((Repeater3.Items[index].FindControl("numLikes") as Label).Text);
            string passIn = (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass;
            string galleryID = (Repeater3.Items[index].FindControl("hidden_Gallery_ID") as HiddenField).Value;
            string login_userID = hdn_login_userID.Value;

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            SqlDataAdapter adapter = new SqlDataAdapter();
            if (passIn.Equals(unlike))
            {
                updatedstatuslike = 1;
                totalLike++;
                (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = like;
                (Repeater3.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);
            }
            else
            {
                updatedstatuslike = -1;
                totalLike--;
                (Repeater3.Items[index].FindControl("LinkButton1") as LinkButton).CssClass = unlike;
                (Repeater3.Items[index].FindControl("numLikes") as Label).Text = Convert.ToString(totalLike);

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

        //Show comment box or not
        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);


            string state1 = "far fa-comment icon_comment";
            string state2 = "far fa-comment-dots icon_comment";

            string passIn = (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass;

            if (passIn.Equals(state1))
            {
                (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass = state2;
                (Repeater3.Items[index].FindControl("tbx_comment") as TextBox).Visible = true;
                (Repeater3.Items[index].FindControl("username_comment") as Label).Visible = true;
                (Repeater3.Items[index].FindControl("linkbtn_send") as LinkButton).Visible = true;
                (Repeater3.Items[index].FindControl("wrapper") as HtmlGenericControl).Visible = true;

            }
            else
            {
                (Repeater3.Items[index].FindControl("LinkButton2") as LinkButton).CssClass = state1;
                (Repeater3.Items[index].FindControl("tbx_comment") as TextBox).Visible = false;
                (Repeater3.Items[index].FindControl("username_comment") as Label).Visible = false;
                (Repeater3.Items[index].FindControl("linkbtn_send") as LinkButton).Visible = false;
                (Repeater3.Items[index].FindControl("wrapper") as HtmlGenericControl).Visible = false;
            }

        }

        //Delete this post
        protected void LinkButton3_Command(object sender, CommandEventArgs e)
        {
            string str = "Are you sure to delete this post? Once action is done, you cannot retrieve back the post.";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "confirm", "ConfirmApproval('" + str + "');", true);

            Boolean isDelete = Convert.ToBoolean(hdn_confirmDelete.Value);

        }


        protected void Delete_Post(object sender, CommandEventArgs e, Boolean delete)
        {
            Boolean isDelete = Convert.ToBoolean(hdn_confirmDelete.Value);

            if (isDelete)
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
                SqlConnection con = new SqlConnection(conString);
            }
        }



        //initialise when first run the repeater
        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            int status;
            string unlike = "far fa-heart icon_heart1";
            string like = "fas fa-heart icon_heart2";
            string login_userID = hdn_login_userID.Value;
            string galleryID = (e.Item.FindControl("hidden_Gallery_ID") as HiddenField).Value;
            
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

        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string customer = "";
            string seller = "";

            string userID = (e.Item.FindControl("hdn_userID") as HiddenField).Value;
            //string uname = (e.Item.FindControl("lbl_uname") as Label).Text;
            string custName = "SELECT CU.Cust_Name FROM Customer CU WHERE CU.Cust_ID = '" + userID + "'";
            string sellName = "Select S.Seller_Name FROM Seller S WHERE S.Seller_ID = '" + userID + "'";

            con.Open();
            
            SqlCommand getCustName = new SqlCommand(custName, con);
            SqlCommand getSellName = new SqlCommand(sellName, con);

            customer = Convert.ToString(getCustName.ExecuteScalar());
            seller = Convert.ToString(getSellName.ExecuteScalar());

            con.Close();

            if(customer != "")
            {
                (e.Item.FindControl("lbl_uname") as Label).Text = customer;
            }
            else
            {
                (e.Item.FindControl("lbl_uname") as Label).Text = seller;
            }


        }
        
        protected void linkbtn_send_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string comment = (Repeater3.Items[index].FindControl("tbx_comment") as TextBox).Text;
            string galleryID = (Repeater3.Items[index].FindControl("hidden_Gallery_ID") as HiddenField).Value;
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("HH:mm:ss");
            string login_userID = hdn_login_userID.Value;

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

            Repeater3.DataBind();

        }

        //open add post modal
        protected void addPost_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "open_addPost_Modal();", true);
            
        }

        //add new post in database
        protected void btn_addPost_Click(object sender, EventArgs e)
        {
            if (res_addPost_image.HasFile)
            {
                string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
                SqlConnection con = new SqlConnection(conString);

                string imageName = res_addPost_image.FileName.ToString();
                res_addPost_image.PostedFile.SaveAs(Server.MapPath("~/image/") + imageName);

                string addPost = "INSERT into Gallery (Gallery_ID, Gallery_Image, Gallery_Desc, Gallery_Date, Gallery_Tag, Gallery_Status, User_ID, TotalLikes)" +
                    "values (@id, @image, @desc, @date, @tag, @status, @userID, @totalLikes)";

                con.Open();
                SqlCommand cmdAddPost = new SqlCommand(addPost, con);

                cmdAddPost.Parameters.AddWithValue("@id", res_addPost_id.Text);
                cmdAddPost.Parameters.AddWithValue("@image", imageName);
                cmdAddPost.Parameters.AddWithValue("@desc", res_addPost_desc.Value);
                cmdAddPost.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                cmdAddPost.Parameters.AddWithValue("@tag", res_addPost_tag.Text);
                cmdAddPost.Parameters.AddWithValue("@status", 1);
                cmdAddPost.Parameters.AddWithValue("@userID", hdn_login_userID.Value);
                cmdAddPost.Parameters.AddWithValue("@totalLikes", 0);

                cmdAddPost.ExecuteNonQuery();
                con.Close();

                Repeater1.DataBind();

                Response.Redirect("Seller_Profile.aspx", false);
            }
        }

        protected void editProfile_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "open_modal_editProfile();", true);

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string str = "SELECT * FROM Seller WHERE Seller_ID = '" + hdn_login_userID.Value + "'";
            SqlCommand getSellerData = new SqlCommand(str, con);


            con.Open();
            SqlDataReader dr = getSellerData.ExecuteReader();
            while (dr.Read())
            {
                editProf_name.Text = dr["Seller_Name"].ToString();
                editProf_phone.Text = dr["Seller_Phone"].ToString();
                editProf_email.Text = dr["Seller_Email"].ToString();
                editProf_ic.Text = dr["Seller_IC"].ToString();
                editProf_gender.Text = dr["Seller_Gender"].ToString();
                editProf_desc.Value = dr["Seller_Details"].ToString();
                editProf_oriImage.ImageUrl = "~/image/" + dr["Seller_Image"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string imageName;

            if (editProf_image.HasFile)
            {
                imageName = editProf_image.FileName.ToString();
                editProf_image.PostedFile.SaveAs(Server.MapPath("~/image/") + imageName);
            }
            else
            {
                imageName = editProf_oriImage.ImageUrl;
                imageName = imageName.Remove(0, 8);
            }

            SqlDataAdapter adapter = new SqlDataAdapter();
            string str = "UPDATE Seller set Seller_Name = '" + editProf_name.Text + "', Seller_IC = '" + editProf_ic.Text +
                "', Seller_Phone = '" + editProf_phone.Text + "', Seller_Email = '" + editProf_email.Text + "', Seller_Gender = '" +
                editProf_gender.Text + "', Seller_Details = '" + editProf_desc.Value + "', Seller_Image = '" + imageName + "'";

            con.Open();
            SqlCommand cmd1 = new SqlCommand(str, con);
            adapter.UpdateCommand = cmd1;
            cmd1.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Seller_Profile.aspx", false);

        }

        protected void editAccount_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "open_modal_account();", true);
        }
    }
}