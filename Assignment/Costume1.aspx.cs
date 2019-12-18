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
    public partial class Costume1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void wishButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton wishButton = (ImageButton)sender;
            if (wishButton.ImageUrl.Equals("~/image/wish_blank.svg"))
            {
                Response.Write("<script language=javascript>alert('The item had been added to wishlist.')</script>");
                wishButton.ImageUrl = "~/image/wish.svg";
            }
            else
            {
                wishButton.ImageUrl = "~/image/wish_blank.svg";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button1 = (Button)sender;
            if(button1.CssClass.Equals("changeButton"))
                button1.CssClass = "onChangeButton";
            else
                button1.CssClass = "changeButton";
        }

        protected void cartButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            DataListItem item = (DataListItem)button.NamingContainer;
            TextBox txtQty = (TextBox)item.FindControl("txtQty");

            if (Int32.Parse(txtQty.Text) > 1)
                Response.Write("<script language=javascript>alert('Stock not enough. Please try again.')</script>");
            else
                Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");
        }

        protected void Image_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imageButton = sender as ImageButton;
            if (!imageButton.ImageUrl.Equals("~/image/white.jpg"))
            {
                foreach(DataListItem item in DataList1.Items)
                {
                    Image image = (Image)item.FindControl("Image1");
                    image.ImageUrl = imageButton.ImageUrl;
                }
            }
        }

        protected void minus_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                if(quantity > 0)
                    textBox.Text = (quantity - 1).ToString();
            }
        }

        protected void add_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                textBox.Text = (quantity + 1).ToString();
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int counter;
            Label label = (Label)e.Item.FindControl("starLabel");
            for (counter = 1; Int32.Parse(label.Text) >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star checked";
            }
            for(;5 >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star not-checked";
            }
            
        }

        protected void commentButton_Click(object sender, EventArgs e)
        {
            string rateID = null, comment = null;
            int rateValue = Int32.Parse(hiddenStar.Value);
            
            if (Request["TextArea1"] != null)
            {
                comment = Request["TextArea1"];
            }
            

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                string stmt = "SELECT COUNT(*) FROM Rating";

                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmt, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                if (RecordCount < 10)
                    rateID = "E100" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    rateID = "E10" + Convert.ToString(RecordCount);

                else
                    rateID = "E1" + Convert.ToString(RecordCount);

                 string custID = null;
                string cust = Request.Cookies["customerName"].Value;
                SqlCommand cmdID = new SqlCommand("SELECT Cust_ID FROM Customer WHERE Cust_UserName = @CustomerName", con);
                cmdID.Parameters.Add("@CustomerName", SqlDbType.NVarChar).Value = cust;
               
                SqlDataReader dr = cmdID.ExecuteReader();
                while (dr.Read())
                {
                    custID = dr["Cust_ID"].ToString();
                }

                SqlCommand comInsert = new SqlCommand("INSERT INTO Rating(Rate_ID,Prod_ID,Rate_Comment,Rate_Star,Cust_ID) VALUES(@RatingID,@ProductID,@RatingComment,@Rating,@CustomerID)", con);
                SqlDataAdapter adapter = new SqlDataAdapter();
                
                comInsert.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = Request.QueryString["productID"].ToString();
                comInsert.Parameters.Add("@RatingID", SqlDbType.NVarChar).Value = rateID;
                comInsert.Parameters.Add("@RatingComment", SqlDbType.NVarChar).Value = comment;
                comInsert.Parameters.Add("@CustomerID", SqlDbType.NVarChar).Value = custID;
                comInsert.Parameters.Add("@Rating", SqlDbType.NVarChar).Value = rateValue;

                comInsert.ExecuteNonQuery();
            }

            Repeater2.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            starButton2.CssClass = "star2 fa fa-star not-checked";
            starButton3.CssClass = "star3 fa fa-star not-checked";
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "1";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            starButton3.CssClass = "star3 fa fa-star not-checked";
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "2";
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "3";
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "4";
        }

    }
}