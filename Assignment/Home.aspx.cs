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
            i = Int32.Parse(HiddenField1.Value.ToString()) + 1;
            if (i > 3)
            {
                i = 1;
            }
            HiddenField1.Value = i.ToString();
            Image1.ImageUrl = "~/image/h" + i.ToString() + ".jpg";
        }

        protected void buttonLeft_Click(object sender, ImageClickEventArgs e)
        {
            i = Int32.Parse(HiddenField1.Value.ToString()) - 1;
            if (i < 1)
            {
                i = 3;
            }
            HiddenField1.Value = i.ToString();
            Image1.ImageUrl = "~/image/h" + i.ToString() + ".jpg";
        }
    }
}