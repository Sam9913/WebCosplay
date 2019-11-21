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
            Response.Write("<script language=javascript>alert('The item had been added to wishlist.')</script>");
            if (wishButton.ImageUrl.Equals("~/image/wish_blank.svg"))
            {
                wishButton.ImageUrl = "~/image/wish.svg";
            }
            else
            {
                wishButton.ImageUrl = "~/image/wish_blank.svg";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Button1.CssClass.Equals("changeButton"))
                Button1.CssClass = "onChangeButton";
            else
                Button1.CssClass = "changeButton";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Button2.CssClass.Equals("changeButton"))
                Button2.CssClass = "onChangeButton";
            else
                Button2.CssClass = "changeButton";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Button3.CssClass.Equals("changeButton"))
                Button3.CssClass = "onChangeButton";
            else
                Button3.CssClass = "changeButton";
        }

        protected void cartButton_Click(object sender, EventArgs e)
        {
            if(Int32.Parse(txtQty.Text) > 1)
                Response.Write("<script language=javascript>alert('Stock not enough. Please try again.')</script>");
            else
                Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");
        }
    }
}