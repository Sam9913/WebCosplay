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
            }
            else if (Request.QueryString["catID"] != null)
            {
                ctlClassify = LoadControl("CategoryControl.ascx");
            }
            else
                ctlClassify = LoadControl("ProductControl.ascx");
            phdChange.Controls.Add(ctlClassify);
        }
    }
}