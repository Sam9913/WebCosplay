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
            if(wishButton.ImageUrl.Equals("~/image/wish_blank.svg"))
            {
                wishButton.ImageUrl = "~/image/wish.svg";
            }
            else
            {
                wishButton.ImageUrl = "~/image/wish_blank.svg";
            }
        }
    }
}