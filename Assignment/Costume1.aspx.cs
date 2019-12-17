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
            Label label = (Label)e.Item.FindControl("starLabel");
            for (int counter = 1; Int32.Parse(label.Text) >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star checked";
            }
            
        }
    }
}