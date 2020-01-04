using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Assignment
{
    public partial class placeOrder : System.Web.UI.Page
    {
        public static double cart_total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //retrieve custoer details
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());
                SqlCommand selectCust = new SqlCommand("SELECT * from Customer where Cust_UserName=@username", conn);
                selectCust.Parameters.Add("@username", SqlDbType.NVarChar).Value = Request.Cookies["customerName"].Value;
                conn.Open();
                SqlDataReader drcust = selectCust.ExecuteReader();
                while (drcust.Read())
                {
                    string phone = drcust["Cust_Phone"].ToString();
                    string mail = drcust["Cust_Email"].ToString();
                    string adds = drcust["Cust_Address"].ToString();
                    TxtAddress.InnerText = adds;
                    TxtPhone.Text = phone;
                    TxtEmail.Text = mail;

                }

                conn.Close();
            }
        }



        protected void btnplaceOrder_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            //add requredfield
            RequiredFieldValidator1.Enabled = true;
            RequiredFieldValidator2.Enabled = true;
            RequiredFieldValidator3.Enabled = true;
            RequiredFieldValidator4.Enabled = true;

            TxtCardName.Attributes["required"] = "true";
            TxtExpiry.Attributes["required"] = "true";
            TxtCreditCard.Attributes["required"] = "true";
            TxtCvv.Attributes["required"] = "true";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string newPayID = null;
            string newTransID = null;
            string payType = null;
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            //Generate new Product ID
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string stmt = "SELECT COUNT(*) FROM Payment";


            try
            {
                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmt, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar()) + 1;

                if (RecordCount < 10)
                    newPayID = "PA100" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    newPayID = "PA10" + Convert.ToString(RecordCount);

                else
                    newPayID = "PA1" + Convert.ToString(RecordCount);

                con.Close();

            }
            catch (Exception ex)
            {
                newPayID = "Error in execution " + ex.ToString();
            }

            //Generate new Transaction ID
            string stmts = "SELECT COUNT(*) FROM [Transaction]";


            try
            {
                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmts, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar()) + 1;

                if (RecordCount < 10)
                    newTransID = "T000" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    newTransID = "T00" + Convert.ToString(RecordCount);

                else
                    newTransID = "T0" + Convert.ToString(RecordCount);

                con.Close();

            }
            catch (Exception ex)
            {
                newTransID = "Error in execution " + ex.ToString();
            }



            //get Pay type
            string type = TxtCreditCard.Text.Substring(0, 1);
            if (type == "4")
            {
                payType = "Visa";
            }
            else if (type == "5")
            {
                payType = "Master";
            }
            //get customer ID
            string custID = null;
            SqlCommand cmdID = new SqlCommand("SELECT Cust_ID FROM Customer WHERE Cust_UserName = @CustomerName", con);
            con.Open();
            cmdID.Parameters.Add("@CustomerName", SqlDbType.NVarChar).Value = Request.Cookies["customerName"].Value;

            SqlDataReader dr = cmdID.ExecuteReader();
            while (dr.Read())
            {
                custID = dr["Cust_ID"].ToString();
            }

            //Insert to Payment table
            SqlCommand insertPayment = new SqlCommand("INSERT INTO Payment (Pay_ID,Pay_Type,Pay_Date,Pay_Amount,Cart_ID,Cust_ID,Shipping_Adds,Shipping_PhoneNo) VALUES (@payID,@payType,GETDate(),@payAmount,@cartid,@custid,@adds,@phone)", con);
            insertPayment.Parameters.Add("@payID", SqlDbType.NVarChar).Value = newPayID;
            insertPayment.Parameters.Add("@payType", SqlDbType.NVarChar).Value = payType;
            insertPayment.Parameters.Add("@payAmount", SqlDbType.NVarChar).Value = cart_total;
            insertPayment.Parameters.Add("cartid", SqlDbType.NVarChar).Value = Request.Cookies["Cart_ID"].Value;
            insertPayment.Parameters.Add("@custid", SqlDbType.NVarChar).Value = custID;
            insertPayment.Parameters.Add("@adds", SqlDbType.NVarChar).Value = TxtAddress.InnerText;
            insertPayment.Parameters.Add("@phone", SqlDbType.NVarChar).Value = TxtPhone.Text;

            insertPayment.ExecuteNonQuery();

            //cart item insert into payment details
            int count = Repeater1.Controls.Count - 1;
            for (int i = 0; i < count + 1; i++)
            {
                Label qty1 = Repeater1.Items[i].FindControl("LabelQty") as Label;
                int qty = Convert.ToInt32(qty1.Text);
                Label prodID = Repeater1.Items[i].FindControl("LabelProdID") as Label;
                Label size = Repeater1.Items[i].FindControl("LabelSizeID") as Label;

                SqlCommand insertPaymentDetail = new SqlCommand("INSERT INTO Payment_Detail (Pay_ID,Prod_ID,Qty,Size_ID) VALUES (@payID,@prodid,@qty,@sizeid)", con);
                insertPaymentDetail.Parameters.Add("@payID", SqlDbType.NVarChar).Value = newPayID;
                insertPaymentDetail.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prodID.Text;
                insertPaymentDetail.Parameters.Add("@qty", SqlDbType.NVarChar).Value = qty;
                insertPaymentDetail.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = size.Text;

                insertPaymentDetail.ExecuteNonQuery();

            }


            //add new transaction
            SqlCommand insertTrans = new SqlCommand("INSERT INTO [TRANSACTION] (Trans_ID,pay_ID) VALUES (@transid,@payID)", con);
            insertTrans.Parameters.Add("@transid", SqlDbType.NVarChar).Value = newTransID;
            insertTrans.Parameters.Add("@payID", SqlDbType.NVarChar).Value = newPayID;


            insertTrans.ExecuteNonQuery();

            //clear cartlist
            SqlCommand deleteCartlist = new SqlCommand("Delete from Cartlist Where Cart_ID=@cartid", con);
            deleteCartlist.Parameters.Add("cartid", SqlDbType.NVarChar).Value = Request.Cookies["Cart_ID"].Value;

            int result = Convert.ToInt32(deleteCartlist.ExecuteNonQuery());

            //Update cart
            SqlCommand updateCart = new SqlCommand("Update Cart Set Cart_Total=@cartTotal Where Cart_ID=@cartid and Cust_ID=@custid", con);
            updateCart.Parameters.Add("@cartTotal", SqlDbType.Decimal).Value = Convert.ToDecimal("0");
            updateCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = Request.Cookies["Cart_ID"].Value;
            updateCart.Parameters.Add("@custid", SqlDbType.NVarChar).Value = custID;
            updateCart.ExecuteNonQuery();

            payID.Text = newPayID;
            trans.Text = newTransID;
            date1.Text = date;
            adds1.Text = TxtAddress.InnerText;
            phone1.Text = TxtPhone.Text;


            //ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "Pop", "Closepopup();", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openReceipt()", true);

        }


        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //get total amount
            double sub = 0;
            double fee = 3.80;

            Label amount = e.Item.FindControl("LabelTotal") as Label;

            cart_total = Convert.ToDouble(amount.Text);
            amountT.Text = "RM " + string.Format("{0:#,#.00}", amount.Text);
            LabelTotal.Text = "RM " + string.Format("{0:#,#.00}", amount.Text);
            sub = (Convert.ToDouble(amount.Text) - fee);
            subtotal.Text = "RM " + " " + string.Format("{0:#,#.00}", sub);
            LabelsTotal.Text = "RM " + " " + string.Format("{0:#,#.00}", sub);
            shipping.Text = "RM" + string.Format("{0:#,#.00}", fee);
        }



        protected void ButtonClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/TransactionHistoryCus.aspx");
        }
    }
}