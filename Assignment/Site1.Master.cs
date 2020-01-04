using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            
        }

        protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
        {
            Response.Redirect("~/Front.aspx");
        }

        protected void logoutLabel_Click(object sender, EventArgs e)
        {
            HttpCookie aCookie = null;
            if (Request.Cookies["customerName"] != null)
            {
                aCookie = Request.Cookies["customerName"];
            }
            else if (Request.Cookies["sellerName"] != null)
            {
                aCookie = Request.Cookies["sellerName"];
            }
            aCookie.Expires = DateTime.Now.AddDays(-10);
            aCookie.Value = "";
            Response.Cookies.Add(aCookie);
            Response.Redirect("~/Home.aspx");
        }
    }
}