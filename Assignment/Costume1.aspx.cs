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
    public partial class Costume1 : System.Web.UI.Page
    {
        public static string size;
        public static bool wish;
        public static int count, time = 0, stockleft;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnURL"] = "Costume1.aspx?productID=" + Request.QueryString["productID"];
          
        }

        protected void wishButton_Click(object sender, EventArgs e)
        {
            Button wishBtn = null;
            string sizeId = null;
            if(Request.Cookies["Wish_ID"] != null && Request.Cookies["customerName"] != null)
            {
                foreach (DataListItem item in DataList1.Items)
                {
                    wishBtn = item.FindControl("wishButton") as Button;
                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());
                string wish_ID = "";
                string prod_ID = Request.QueryString["productID"].ToString();
                wish_ID = Request.Cookies["Wish_ID"].Value;
                conn.Open();

                if (wish == false)
                {
                    if (size == null)
                    {
                        //set default size if size is null
                        SqlCommand selectDefaultsize = new SqlCommand("SELECT Size_ID from SizeDetails where Prod_ID=@prodid", conn);
                        selectDefaultsize.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prod_ID;
                        SqlDataReader drdefault = selectDefaultsize.ExecuteReader();
                        while (drdefault.Read())
                        {
                            sizeId = drdefault["Size_ID"].ToString();
                        }

                    }
                    else
                    {
                        //get size id
                        SqlCommand selectSize = new SqlCommand("SELECT Size_ID from SizeDetails where Prod_ID=@prodid and Size_Details=@size", conn);
                        selectSize.Parameters.Add("@size", SqlDbType.NVarChar).Value = size;
                        selectSize.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prod_ID;

                        SqlDataReader drsize = selectSize.ExecuteReader();
                        while (drsize.Read())
                        {
                            sizeId = drsize["Size_ID"].ToString();
                        }
                    }
                    //insert into wishlist
                    SqlCommand cmd = new SqlCommand("INSERT INTO Wishlist_list (Wish_ID,Prod_ID,Size_ID) VALUES (@wish_ID,@prod_ID,@size)", conn);
                    cmd.Parameters.Add("@wish_ID", SqlDbType.NVarChar).Value = wish_ID;
                    cmd.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prod_ID;
                    cmd.Parameters.Add("@size", SqlDbType.NVarChar).Value = sizeId;

                    cmd.Connection = conn;

                    int result = Convert.ToInt32(cmd.ExecuteNonQuery());
                    if (result == 1)
                    {
                        Response.Write("<script language=javascript>alert('The item had been added to wishlist.')</script>");
                    }
                    wish = true;

                    wishBtn.CssClass = "changewish";

                }
                else if (wish == true)
                {
                    SqlCommand cmd = new SqlCommand(@"Delete from Wishlist_list Where Prod_ID = @Prod_ID and Wish_ID=@wishid", conn);
                    cmd.Parameters.Add("@Prod_ID", SqlDbType.NVarChar).Value = prod_ID;
                    cmd.Parameters.Add("@wishid", SqlDbType.NVarChar).Value = wish_ID;
                    wishBtn.CssClass = "btn_wish";
                    wish = false;
                    int result = Convert.ToInt32(cmd.ExecuteNonQuery());

                }
                conn.Close();
                size = null;
            }
            else
            {
                string str = "You need to login to proceed the action. Do you want to login now ?";
                ClientScript.RegisterStartupScript(typeof(Page), "Popup", "ConfirmApproval('" + str + "');", true);
            }

        }

        protected void cartButton_Click(object sender, EventArgs e)
        {
            int qty = 0;
            int stockleft = 0;
            int cartCount = 0;
            string sizeid;
            if(Request.Cookies["Cart_ID"] != null && Request.Cookies["customerName"] != null)
            {
                string cart_ID = Request.Cookies["Cart_ID"].Value;
                bool checkcart = true;
                string prod_ID = Request.QueryString["productID"].ToString();
                foreach (DataListItem dli in DataList1.Items)
                {
                    TextBox txtqty = (TextBox)dli.FindControl("txtQty");
                    qty = Convert.ToInt32(txtqty.Text);

                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

                conn.Open();
                //get default size
                if (size == null)
                {
                    SqlCommand selectDefaultsize = new SqlCommand("SELECT S.Size_Details from Size S inner join SizeDetails SD on SD.Size_ID=S.Size_ID where SD.Prod_ID=@prodid", conn);
                    selectDefaultsize.Parameters.Add("@prodid", SqlDbType.NVarChar).Value = prod_ID;
                    SqlDataReader drdefault = selectDefaultsize.ExecuteReader();
                    while (drdefault.Read())
                    {
                        size = drdefault["Size_Details"].ToString();
                    }
                }

                //check the stock quantity
                SqlCommand selectCon = new SqlCommand("SELECT SD.Prod_Count from SizeDetails SD inner join Size S on SD.Size_ID=S.Size_ID where S.Size_Details=@size and SD.Prod_ID=@prod_id", conn);
                selectCon.Parameters.Add("@size", SqlDbType.NVarChar).Value = size;
                selectCon.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;


                SqlDataReader dr = selectCon.ExecuteReader();

                while (dr.Read())
                {
                    string stock = dr["Prod_Count"].ToString();
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

                //update the existing product quantity in the cart
                while (checkcart)
                {
                    SqlCommand selectCart = new SqlCommand("SELECT CA.Prod_ID, CA.Size_ID,CA.Qty from Cartlist CA join Size S on CA.Size_ID=S.Size_ID where S.Size_Details=@size and CA.Prod_ID=@prod_id and CA.Cart_ID=@cartid", conn);
                    selectCart.Parameters.Add("@size", SqlDbType.NVarChar).Value = size;
                    selectCart.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;
                    selectCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                    conn.Open();
                    SqlDataReader dr1 = selectCart.ExecuteReader();

                    while (dr1.Read())
                    {
                        cartCount = 1;
                        sizeid = dr1["Size_ID"].ToString();
                        string qtyProd = dr1["Qty"].ToString();
                        int qtyProd1 = Convert.ToInt32(qtyProd);
                        int totalQty = qty + qtyProd1;
                        if (qty <= stockleft)
                        {
                            SqlCommand updateCart = new SqlCommand("Update Cartlist Set Qty=@qty Where Prod_ID=@prod_id and Cart_ID=@cartid and Size_ID=@sizeid", conn);
                            updateCart.Parameters.Add("@qty", SqlDbType.Int).Value = totalQty;
                            updateCart.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;
                            updateCart.Parameters.Add("@cartid", SqlDbType.NVarChar).Value = cart_ID;
                            updateCart.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;

                            updateCart.ExecuteNonQuery();

                            int totalleft = stockleft - qty;
                            SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
                            updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
                            updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;
                            updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeid;
                            updateProdCount.ExecuteNonQuery();
                            checkcart = false;
                            Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");



                            foreach (DataListItem dli in DataList1.Items)
                            {
                                Label countProd = (Label)dli.FindControl("prodCount");
                                countProd.Text = "";
                            }
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('Stock not enough. Please try again.')</script>");
                            checkcart = false;
                        }
                    }


                    //or Insert new product into cart
                    if (cartCount == 0)
                    {
                        SqlCommand selectSize = new SqlCommand("SELECT Size_ID from Size where Size_Details=@size", conn);
                        selectSize.Parameters.Add("@size", SqlDbType.NVarChar).Value = size;

                        SqlDataReader drsize = selectSize.ExecuteReader();
                        while (drsize.Read())
                        {
                            string sizeId = drsize["Size_ID"].ToString();

                            SqlCommand insertCart = new SqlCommand("INSERT INTO Cartlist (Cart_ID,Prod_ID,Qty,Size_ID) VALUES (@cart_ID,@Prod_ID,@qty,@sizeid)", conn);
                            insertCart.Parameters.Add("@cart_ID", SqlDbType.NVarChar).Value = cart_ID;
                            insertCart.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prod_ID;
                            insertCart.Parameters.Add("@Qty", SqlDbType.Int).Value = qty;
                            insertCart.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeId;
                            insertCart.Connection = conn;


                            int totalleft = stockleft - qty;
                            SqlCommand updateProdCount = new SqlCommand("Update SizeDetails Set Prod_Count=@qty Where Prod_ID=@prod_id and Size_ID=@sizeid", conn);
                            updateProdCount.Parameters.Add("@qty", SqlDbType.Int).Value = totalleft;
                            updateProdCount.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;
                            updateProdCount.Parameters.Add("@sizeid", SqlDbType.NVarChar).Value = sizeId;
                            updateProdCount.ExecuteNonQuery();

                            int result = Convert.ToInt32(insertCart.ExecuteNonQuery());

                            if (result == 1)
                            {
                                Response.Write("<script language=javascript>alert('The item had been added to cartlist.')</script>");
                                foreach (DataListItem dli in DataList1.Items)
                                {
                                    Label countProd = (Label)dli.FindControl("prodCount");
                                    countProd.Text = "";
                                }
                            }
                        }

                        checkcart = false;
                        size = null;
                    }
                    conn.Close();
                }
            }
            else
            {
                string str = "You need to login to proceed the action. Do you want to login now ?";
                ClientScript.RegisterStartupScript(typeof(Page), "Popup", "ConfirmApproval('" + str + "');", true);
            }
            DataList1.DataBind();
        }

        protected void ButtonSize_Command(object sender, CommandEventArgs e)
        {
            bool isEmpty = false;
            int index = Convert.ToInt32(e.CommandArgument);
            Label countProd = null;
            Repeater repeater1 = null;
            string prod_ID = Request.QueryString["productID"].ToString();

            foreach (DataListItem dli in DataList1.Items)
            {
                repeater1 = (Repeater)dli.FindControl("Repeater1");
                countProd = (Label)dli.FindControl("prodCount");
                Button button = repeater1.Items[index].FindControl("ButtonSize") as Button;
                if (button.CssClass.Equals("changeButton"))
                    button.CssClass = "onChangeButton";
                else
                {
                    button.CssClass = "changeButton";
                    isEmpty = true;
                }
                if (time >= 1 && count != index)
                {
                    Button buttonChange = repeater1.Items[count].FindControl("ButtonSize") as Button;
                    if (!buttonChange.CssClass.Equals("changeButton"))
                        buttonChange.CssClass = "changeButton";
                }
                size = button.Text;
                count = index;
                time++;
            }

            if (isEmpty)
            {
                countProd.Text = "";
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

                SqlCommand selectCon = new SqlCommand("SELECT SD.Prod_Count from SizeDetails SD inner join Size S on SD.Size_ID=S.Size_ID where S.Size_Details=@size and SD.Prod_ID=@prod_id", conn);
                selectCon.Parameters.Add("@size", SqlDbType.NVarChar).Value = size;
                selectCon.Parameters.Add("@prod_id", SqlDbType.NVarChar).Value = prod_ID;

                conn.Open();
                SqlDataReader dr = selectCon.ExecuteReader();

                while (dr.Read())
                {
                    string stock = dr["Prod_Count"].ToString();
                    stockleft = Convert.ToInt32(stock);
                    countProd.Text = Convert.ToString(stockleft) + " stock left";
                }
                conn.Close();
            }
        }

        protected void Image_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imageButton = sender as ImageButton;
            if (!imageButton.ImageUrl.Equals("~/image/white.jpg"))
            {
                foreach(DataListItem item in DataList1.Items)
                {
                    Image image = (Image)item.FindControl("Image1");
                    image.ImageUrl = imageButton.ImageUrl;
                }
            }
        }

        protected void minus_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                if(quantity > 0)
                    textBox.Text = (quantity - 1).ToString();
            }
        }

        protected void add_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                if (quantity < stockleft)
                {
                    textBox.Text = (quantity + 1).ToString();
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int counter;
            Label label = (Label)e.Item.FindControl("starLabel");
            for (counter = 1; Int32.Parse(label.Text) >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star checked";
            }
            for(;5 >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star not-checked";
            }
            
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            Button wishB = null;
            string wish_ID = "";
            string prod_ID = Request.QueryString["productID"].ToString();
            int stockcount = 0;
            Label stock = e.Item.FindControl("Prod_stock") as Label;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["KosupureEntities"].ToString());

            if (Request.Cookies["Wish_ID"] != null && Request.Cookies["customerName"] != null)

            {
                wish_ID = Request.Cookies["Wish_ID"].Value;
                wishB = e.Item.FindControl("wishButton") as Button;


                //ImageButton wishButton = (ImageButton)sender;

                //change wishlist icon
                SqlCommand selectCon = new SqlCommand("SELECT Wish_ID, Prod_ID from Wishlist_list where Wish_ID=@wishid and Prod_ID=@prod_ID", conn);
                selectCon.Parameters.Add("@wishid", SqlDbType.NVarChar).Value = wish_ID;
                selectCon.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prod_ID;

                conn.Open();
                SqlDataReader dr = selectCon.ExecuteReader();

                while (dr.Read())
                {
                    string prod = dr["Prod_ID"].ToString();
                    wishB.CssClass = "changewish";
                    wish = true;

                }

                conn.Close();
            }

            //get total stock of the product
            SqlCommand addStock = new SqlCommand("SELECT Sum(Prod_Count) AS totalstock from SizeDetails where Prod_ID=@prod_ID", conn);
            addStock.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prod_ID;
            conn.Open();
            SqlDataReader dr1 = addStock.ExecuteReader();

            while (dr1.Read())
            {
                string stockC = dr1["totalstock"].ToString();
                stockcount = Convert.ToInt32(stockC);
                if (stockcount <= 0)
                {
                    stock.Text = "Out of Stock";
                }
                else
                {
                    stock.Text = "On Stock";
                }

            }

            conn.Close();

        }

        protected void commentButton_Click(object sender, EventArgs e)
        {
            string rateID = null, comment = null;
            int rateValue = Int32.Parse(hiddenStar.Value);
            
            if (Request["TextArea1"] != null)
            {
                comment = Request["TextArea1"];
            }
            

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
            {
                string stmt = "SELECT COUNT(*) FROM Rating";

                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmt, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                if (RecordCount < 10)
                    rateID = "E100" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    rateID = "E10" + Convert.ToString(RecordCount);

                else
                    rateID = "E1" + Convert.ToString(RecordCount);

                 string custID = null;
                string cust = Request.Cookies["customerName"].Value;
                SqlCommand cmdID = new SqlCommand("SELECT Cust_ID FROM Customer WHERE Cust_UserName = @CustomerName", con);
                cmdID.Parameters.Add("@CustomerName", SqlDbType.NVarChar).Value = cust;
               
                SqlDataReader dr = cmdID.ExecuteReader();
                while (dr.Read())
                {
                    custID = dr["Cust_ID"].ToString();
                }

                SqlCommand comInsert = new SqlCommand("INSERT INTO Rating(Rate_ID,Prod_ID,Rate_Comment,Rate_Star,Cust_ID) VALUES(@RatingID,@ProductID,@RatingComment,@Rating,@CustomerID)", con);
                SqlDataAdapter adapter = new SqlDataAdapter();
                
                comInsert.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = Request.QueryString["productID"].ToString();
                comInsert.Parameters.Add("@RatingID", SqlDbType.NVarChar).Value = rateID;
                comInsert.Parameters.Add("@RatingComment", SqlDbType.NVarChar).Value = comment;
                comInsert.Parameters.Add("@CustomerID", SqlDbType.NVarChar).Value = custID;
                comInsert.Parameters.Add("@Rating", SqlDbType.NVarChar).Value = rateValue;

                comInsert.ExecuteNonQuery();
            }

            Repeater2.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            starButton2.CssClass = "star2 fa fa-star not-checked";
            starButton3.CssClass = "star3 fa fa-star not-checked";
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "1";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            starButton3.CssClass = "star3 fa fa-star not-checked";
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "2";
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            starButton4.CssClass = "star4 fa fa-star not-checked";
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "3";
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            starButton5.CssClass = "star5 fa fa-star not-checked";
            hiddenStar.Value = "4";
        }

    }
}