using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Sort : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control ctlClassify;
            if (Request.QueryString["sortID"] != null)
            {
                ctlClassify = LoadControl("SortControl.ascx");
                Session["ReturnURL"] = ("Classify.aspx?sortID=" + Request.QueryString["sortID"]);
                Session.Timeout = 300;
            }
            else if (Request.QueryString["catID"] != null)
            {
                ctlClassify = LoadControl("CategoryControl.ascx");
                Session["ReturnURL"] = ("Classify.aspx?catID=" + Request.QueryString["catID"]);
                Session.Timeout = 300;
            }
            else
            {
                ctlClassify = LoadControl("ProductControl.ascx");
                Session["ReturnURL"] = "Classify.aspx";
                Session.Timeout = 300;
            }
            phdChange.Controls.Add(ctlClassify);
        }
    }
}