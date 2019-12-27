using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Assignment
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
       


        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
           
            bool checkcart=false;
            int cartCount = 0;
            int stockleft = 0;
            string sizeid = null;
            string  cart_ID = Request.Cookies["Cart_ID"].Value;
                int index = Convert.ToInt32(e.CommandArgument);
            Label prodID = Repeater1.Items[index].FindControl("ProdID") as Label;
            Label size = Repeater1.Items[index].FindControl("SizeDetails") as Label;
            int qty = 1;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

            //check the stock quantity
            SqlCommand selectCon = new SqlCommand("SELECT SD.Prod_Count,S.Size_ID from SizeDetails SD inner join Size S on SD.Size_ID=S.Size_ID where S.Size_Details=@size and SD.Prod_ID=@prod_id", conn);
            selectCon.Parameters.Add("@size", SqlDbType.NVarChar).Value = size.Text;
            selectCon.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;

            conn.Open();
            SqlDataReader dr = selectCon.ExecuteReader();

            while (dr.Read())
            {
                string stock = dr["Prod_Count"].ToString();
                sizeid= dr["Size_ID"].ToString();
                stockleft = Convert.ToInt32(stock);

                if (qty <= stockleft)
                {
                    checkcart = true;
                }
                else if (qty > stockleft)
                {
                    checkcart = false;

                }
            }
            conn.Close();
            if (!checkcart)
            {
                Response.Write("<script language=javascript>alert('Stock not enough. Please try again.')</script>");
            }

            while (checkcart)
            {
                SqlCommand selectCart = new SqlCommand("SELECT CA.Prod_ID, CA.Size_ID,CA.Qty from Cartlist CA join Size S on CA.Size_ID=S.Size_ID where S.Size_Details=@size and CA.Prod_ID=@prod_id and CA.Cart_ID=@cartid", conn);
                selectCart.Parameters.Add("@size", SqlDbType.NVarChar).Value = size.Text;
                selectCart.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
                selectCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                conn.Open();
                SqlDataReader dr1 = selectCart.ExecuteReader();

                while (dr1.Read())
                {
                    cartCount = 1;
                    string sizeId = dr1["Size_ID"].ToString();
                    string qtyProd = dr1["Qty"].ToString();
                    int qtyProd1 = Convert.ToInt32(qtyProd);
                    int totalQty = qty + qtyProd1;
                    SqlCommand updateCart = new SqlCommand("Update Cartlist Set Qty=@qty Where Prod_ID=@prod_id and Cart_ID=@cartid and Size_ID=@sizeid", conn);
                    updateCart.Parameters.Add("@qty", SqlDbType.Int).Value = totalQty;
                    updateCart.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
                    updateCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                    updateCart.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeId;

                    updateCart.ExecuteNonQuery();

                    int totalleft = stockleft - qty;
                    SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
                    updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
                    updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
                    updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
                    updateProdCount.ExecuteNonQuery();
                    checkcart = false;
                    Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");
                }

                if (cartCount == 0)
                {
                    //insert new
                    SqlCommand cmd = new SqlCommand("INSERT INTO Cartlist (Cart_ID,Prod_ID,Qty,Size_ID) VALUES (@cart_ID,@Prod_ID,@qty,@size)", conn);

                    cmd.Parameters.Add("@cart_ID", SqlDbType.NVarChar).Value = cart_ID;
                    cmd.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prodID.Text;
                    cmd.Parameters.Add("@Qty", SqlDbType.NVarChar).Value = qty;
                    cmd.Parameters.Add("@size", SqlDbType.NVarChar).Value = sizeid;
                    
                    int totalleft = stockleft - qty;
                    SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
                    updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
                    updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prodID.Text;
                    updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
                    updateProdCount.ExecuteNonQuery();
                    int result = Convert.ToInt32(cmd.ExecuteNonQuery());
                    conn.Close();
                    if (result == 1)
                    {
                        Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");
                    }
                    checkcart = false;
                }
            }
        }

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            string sizeid = null;
            int index = Convert.ToInt32(e.CommandArgument);
            string wish_ID = Request.Cookies["Wish_ID"].Value;
            Label prodID = Repeater1.Items[index].FindControl("ProdID") as Label;
            Label size1 = Repeater1.Items[index].FindControl("SizeDetails") as Label;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());
            
            SqlCommand selectSize = new SqlCommand("SELECT Size_ID from Size where Size_Details=@size", conn);
            selectSize.Parameters.Add("@size", SqlDbType.NVarChar).Value = size1.Text;
            conn.Open();
            SqlDataReader drsize = selectSize.ExecuteReader();
            while (drsize.Read())
            {
                sizeid = drsize["Size_ID"].ToString();
            }
            SqlCommand cmd = new SqlCommand(@"Delete from Wishlist_list Where Prod_ID = @Prod_ID and Wish_ID=@wishid and Size_ID=@sizeid", conn);
            cmd.Parameters.Add("@Prod_ID", SqlDbType.NVarChar).Value = prodID.Text;
            cmd.Parameters.Add("@wishid", SqlDbType.NVarChar).Value = wish_ID;
            cmd.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;

            int result = Convert.ToInt32(cmd.ExecuteNonQuery());
            conn.Close();
            if (result == 1)
            {
                Response.Write("<script language=javascript>alert('The item had been successfully delete.')</script>");
            }

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
    }


}