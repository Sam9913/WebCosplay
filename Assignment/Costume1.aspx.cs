using System;
using System.Collections.Generic;
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

        //protected void Image2_Click(object sender, ImageClickEventArgs e)
        //{
        //    Image1.ImageUrl = Image2.ImageUrl;
        //}

        //protected void Image3_Click(object sender, ImageClickEventArgs e)
        //{
        //    Image1.ImageUrl = Image3.ImageUrl;
        //}

        //protected void Image4_Click(object sender, ImageClickEventArgs e)
        //{
        //    Image1.ImageUrl = Image4.ImageUrl;
        //}
    }
}