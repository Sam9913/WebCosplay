using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Home : System.Web.UI.Page
    {
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void buttonRight_Click(object sender, ImageClickEventArgs e)
        {
            i = Int32.Parse(hiddenField.Value.ToString()) + 1;
            if (i > 4)
            {
                i = 1;
            }
            hiddenField.Value = i.ToString();
            Image1.ImageUrl = "~/image/header_" + i.ToString() + ".jpg";
        }

        protected void buttonLeft_Click(object sender, ImageClickEventArgs e)
        {
            i = Int32.Parse(hiddenField.Value.ToString()) - 1;
            if (i < 1)
            {
                i = 4;
            }
            hiddenField.Value = i.ToString();
            Image1.ImageUrl = "~/image/header_" + i.ToString() + ".jpg";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            i = Int32.Parse(hiddenField.Value.ToString()) + 1;
            if (i > 4)
            {
                i = 1;
            }
            hiddenField.Value = i.ToString();
            Image1.ImageUrl = "~/image/header_" + i.ToString() + ".jpg";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/hotSales.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/newArrival.aspx");
        }
    }
}