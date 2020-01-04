using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class TransactionHistoryCus : System.Web.UI.Page
    {
        int countno = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewButton_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            double sub = 0;
            double fee = 3.80;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            Label transID = Repeater2.Items[index].FindControl("trans_ID") as Label;
            Label pay_ID = Repeater2.Items[index].FindControl("payID") as Label;
            Label amount = Repeater2.Items[index].FindControl("amount") as Label;
            Label pay_date = Repeater2.Items[index].FindControl("payDate") as Label;
            Label pay_adds = Repeater2.Items[index].FindControl("payAdds") as Label;
            Label pay_phone = Repeater2.Items[index].FindControl("payPhone") as Label;
            Button btn = Repeater2.Items[index].FindControl("ViewButton") as Button;
            payID.Text = pay_ID.Text;
            date.Text = pay_date.Text;
            trans.Text = transID.Text;
            adds1.Text = pay_adds.Text;
            phone1.Text = pay_phone.Text;

            amountT.Text = "RM " + string.Format("{0:#,#.00}", amount.Text);
            sub = (Convert.ToDouble(amount.Text) - fee);
            subtotal.Text = "RM " + " " + string.Format("{0:#,#.00}", sub);

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            Label no = e.Item.FindControl("count") as Label;
            no.Text = Convert.ToString(countno);

            countno++;
        }
    }
}