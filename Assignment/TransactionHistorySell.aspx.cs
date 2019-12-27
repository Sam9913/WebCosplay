using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class TransactionHistorySell : System.Web.UI.Page
    {
        int countno = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            countno = 1;
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label no = e.Item.FindControl("count") as Label;
            no.Text = Convert.ToString(countno)+".";

            countno++;
        }

       
    }
}