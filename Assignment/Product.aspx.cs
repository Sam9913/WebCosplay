using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            DataListItem item = (DataListItem)button.NamingContainer;
            HiddenField idLabel = (HiddenField)item.FindControl("hidden");
            
            Response.Redirect("~/Costume1.aspx?productID=" + idLabel.Value.ToString());
        }

        protected void sortButton_Click(object sender, EventArgs e)
        {

        }
    }
}