using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{

    public partial class cartlist : System.Web.UI.Page
    {

        double totalPrice, subTotal;
        string q1;
        int qty;
        double priceperItem;


        protected void Page_Load(object sender, EventArgs e)
        {
            
            totalPrice = 0.0;
            subTotal = 0.0;
            string shippingFee = shippingfee.Text;
            double sf = Convert.ToDouble(shippingFee);
            totalPrice = sf;
        }




        protected void ImageButtonMinus_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label price = Repeater1.Items[index].FindControl("Prod_PriceLabel") as Label;
            Label qty1 = Repeater1.Items[index].FindControl("LabelQty") as Label;
            Label totalItem = Repeater1.Items[index].FindControl("totalPerItem") as Label;
            q1 = qty1.Text;

            qty = Convert.ToInt32(q1);
            if (qty <= 1)
            {
                qty = 1;
            }
            else
            {
                qty -= 1;
                qty1.Text = Convert.ToString(qty);
                priceperItem = Convert.ToDouble(price.Text) * Convert.ToDouble(qty);
                totalItem.Text = string.Format("{0:#,#.00}", priceperItem);
                double p2 = (Convert.ToDouble(totalAmount.Text) - Convert.ToDouble(price.Text));
                double p3 = (Convert.ToDouble(subTotalPrice.Text) - Convert.ToDouble(price.Text));
                totalAmount.Text = string.Format("{0:#,#.00}", p2);
                subTotalPrice.Text = string.Format("{0:#,#.00}", p3);


            }


        }

        protected void ImageButtonPlus_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label price = Repeater1.Items[index].FindControl("Prod_PriceLabel") as Label;
            Label qty1 = Repeater1.Items[index].FindControl("LabelQty") as Label;
            Label totalItem = Repeater1.Items[index].FindControl("totalPerItem") as Label;
            Label size = Repeater1.Items[index].FindControl("SizeDetails") as Label;
            Label prod_ID = Repeater1.Items[index].FindControl("ProdID") as Label;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

            qty = Convert.ToInt32(qty1.Text);
            //check the stock quantity
            SqlCommand selectCon = new SqlCommand("SELECT SD.Prod_Count from SizeDetails SD inner join Size S on SD.Size_ID=S.Size_ID where S.Size_Details=@size and SD.Prod_ID=@prod_id", conn);
            selectCon.Parameters.Add("@size", SqlDbType.NVarChar).Value = size.Text;
            selectCon.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID.Text;

            conn.Open();
            SqlDataReader dr = selectCon.ExecuteReader();

            while (dr.Read())
            {
                string stock = dr["Prod_Count"].ToString();
                int stockleft = Convert.ToInt32(stock);

                if (qty > stockleft)
                {
                    qty = stockleft;
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Stock not enough');", true);
                }
                else if (qty <= stockleft)
                {
                     qty += 1;
                    qty1.Text = Convert.ToString(qty);
                    priceperItem = Convert.ToDouble(price.Text) * Convert.ToDouble(qty);
                    totalItem.Text = string.Format("{0:#,#.00}", priceperItem);
                    double p2 = (Convert.ToDouble(totalAmount.Text) + Convert.ToDouble(price.Text));
                    double p3 = (Convert.ToDouble(subTotalPrice.Text) + Convert.ToDouble(price.Text));
                    totalAmount.Text = string.Format("{0:#,#.00}", p2);
                    subTotalPrice.Text = string.Format("{0:#,#.00}", p3);


                }
            }
            conn.Close();

        }

        protected void ButtonCheckout_Click(object sender, EventArgs e)
        {
            string cart_ID = Request.Cookies["Cart_ID"].Value;
            string custname= Request.Cookies["customerName"].Value;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

            //Select Customer
            SqlCommand selectCust = new SqlCommand("SELECT Cust_ID from Customer where Cust_UserName=@username", conn);
            selectCust.Parameters.Add("@username", SqlDbType.NVarChar).Value = custname;
            conn.Open();
            SqlDataReader drCust = selectCust.ExecuteReader();

            while (drCust.Read())
            {
                string custID = drCust["Cust_ID"].ToString();
                     //Update totalAmount to Cart
                SqlCommand updateCart = new SqlCommand("Update Cart Set Cart_Total=@cartTotal Where Cart_ID=@cartid and Cust_ID=@custid", conn);
                updateCart.Parameters.Add("@cartTotal", SqlDbType.Decimal).Value = Convert.ToDecimal(totalAmount.Text);
               updateCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
               updateCart.Parameters.Add("@custid", SqlDbType.NVarChar).Value = custID;
                updateCart.ExecuteNonQuery();
               

            }
            conn.Close();
                Response.Redirect("/placeOrder.aspx");
        }

        protected void updateCart_Click(object sender, EventArgs e)
        {
            string cart_ID = Request.Cookies["Cart_ID"].Value;
            string sizeid = null;
            int count = Repeater1.Controls.Count - 1;
            int stockleft = 0;
            int stockIncart = 0;
            int totalleft = 0;
            int count1 = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());
            
           
           
            for (int i = 0; i < count+1; i++)
            {
                count1 += 1;
                Label qty1 = Repeater1.Items[i].FindControl("LabelQty") as Label;
                int qty = Convert.ToInt32(qty1.Text);
                Label prodID = Repeater1.Items[i].FindControl("prodID") as Label;
                string prodId = prodID.Text;
                Label size1= Repeater1.Items[i].FindControl("SizeDetails") as Label;
                string size=size1.Text;

                SqlCommand selectSize = new SqlCommand("SELECT SD.Prod_Count,S.Size_ID from Size S inner join SizeDetails SD on S.Size_ID=SD.Size_ID where SD.Prod_ID=@prodid and S.Size_Details=@size", conn);
                selectSize.Parameters.Add("@size", SqlDbType.NVarChar).Value = size1.Text;
                selectSize.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prodID.Text;
                conn.Open();
                SqlDataReader drsize = selectSize.ExecuteReader();
                while (drsize.Read())
                {
                    sizeid = drsize["Size_ID"].ToString();
                    string stock = drsize["Prod_Count"].ToString();
                    stockleft = Convert.ToInt32(stock);
                }
                SqlCommand getCartlistQty = new SqlCommand("SELECT Qty from Cartlist where Cart_ID=@cartid and Prod_ID=@prodid and Size_ID=@sizeid", conn);
                getCartlistQty.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                getCartlistQty.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prodId;
                getCartlistQty.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
                SqlDataReader drCartqty = getCartlistQty.ExecuteReader();
                while (drCartqty.Read())
                {
                    string stockCart = drCartqty["Qty"].ToString();
                    stockIncart = Convert.ToInt32(stockCart);
                }

                SqlCommand updateCartlist = new SqlCommand("Update Cartlist Set Qty=@qty Where Cart_ID=@cartid and Prod_ID=@prodid and Size_ID=@sizeid", conn);
                updateCartlist.Parameters.Add("@qty", SqlDbType.Int).Value = qty;
                updateCartlist.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                updateCartlist.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prodId;
                updateCartlist.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;

                updateCartlist.ExecuteNonQuery();

                //+
                if (stockIncart <= qty)
                {
                    totalleft = stockleft - (stockIncart - qty);
                }
                else  {
                    totalleft = stockleft + (stockIncart - qty);
                }
                 
                SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
                updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
                updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
                updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
                updateProdCount.ExecuteNonQuery();
                conn.Close();
                }
            
                Response.Write("<script language='javascript'>window.alert('Update Successfully!');</script>");
            
        }

        protected void deleteProduct_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string cart_ID = Request.Cookies["Cart_ID"].Value;
            string sizeid = null;
            int stockleft = 0;
            Label prodID = Repeater1.Items[index].FindControl("ProdID") as Label;
            Label qty= Repeater1.Items[index].FindControl("LabelQty") as Label;
            Label size1 = Repeater1.Items[index].FindControl("SizeDetails") as Label;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());
            SqlCommand selectSize = new SqlCommand("SELECT SD.Prod_Count,S.Size_ID from Size S inner join SizeDetails SD on S.Size_ID=SD.Size_ID where SD.Prod_ID=@prodid and S.Size_Details=@size", conn);
            selectSize.Parameters.Add("@size", SqlDbType.NVarChar).Value = size1.Text;
            selectSize.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prodID.Text;
            conn.Open();
            SqlDataReader drsize = selectSize.ExecuteReader();
            while (drsize.Read())
            {
                sizeid = drsize["Size_ID"].ToString();
                string stock = drsize["Prod_Count"].ToString();
                stockleft = Convert.ToInt32(stock);
            }
            SqlCommand deleteCartlist = new SqlCommand(@"Delete from Cartlist Where Prod_ID = @Prod_ID and Cart_ID=@cartid and Size_ID=@sizeid", conn);
            deleteCartlist.Parameters.Add("@Prod_ID", SqlDbType.NVarChar).Value = prodID.Text;
            deleteCartlist.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
            deleteCartlist.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;


            int totalleft = stockleft + Convert.ToInt32(qty.Text);
            SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
            updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
            updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
            updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
            updateProdCount.ExecuteNonQuery();

            int result = Convert.ToInt32(deleteCartlist.ExecuteNonQuery());
            conn.Close();
            if (result == 1)
            {
                Response.Write("<script language=javascript>alert('The item had been successfully delete.')</script>");
            }
            conn.Close();
            Repeater1.DataBind();
        }

        protected void Prod_NameLabel_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            Label prodID = (Label)item.FindControl("prodID");
            Label catID = (Label)item.FindControl("CatID");

            Session["Cat_ID"] = catID.Text;
             Response.Redirect("~/Costume1.aspx?productID=" + prodID.Text.ToString());
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label price1 = (Label)e.Item.FindControl("Prod_PriceLabel");
            Label qty1 = e.Item.FindControl("LabelQty") as Label;
            Label totalPerItem = e.Item.FindControl("totalPerItem") as Label;
            string price = price1.Text;
            double p1 = (Convert.ToDouble(price) * Convert.ToDouble(qty1.Text));
            totalPrice += p1;
            subTotal += p1;
            totalPerItem.Text = string.Format("{0:#,#.00}", p1);
            totalAmount.Text = string.Format("{0:#,#.00}", totalPrice);
            subTotalPrice.Text = string.Format("{0:#,#.00}", subTotal);
           
        }
 }

}

