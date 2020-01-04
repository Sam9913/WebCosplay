using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CosplayWeb
{
    public partial class Seller_Product : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Generate new Product ID
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string stmt = "SELECT COUNT(*) FROM Product";
            
            try
            {
                con.Open();
                SqlCommand cmdCount = new SqlCommand(stmt, con);
                int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                if (RecordCount < 10)
                    res_addProd_id.Text = "P100" + Convert.ToString(RecordCount);

                else if (RecordCount < 100)
                    res_addProd_id.Text = "P10" + Convert.ToString(RecordCount);

                else
                    res_addProd_id.Text = "P1" + Convert.ToString(RecordCount);

                con.Close();

            }
            catch (Exception ex)
            {
                res_addProd_id.Text = "Error in execution " + ex.ToString();
            }

            //Initialise the dropdownlist as the first one and with the textbox
            if (DropDownList1.SelectedValue == "" || DropDownList1.SelectedValue == "C1000" || DropDownList1.SelectedValue == "C1002" || DropDownList1.SelectedValue == "C1005" || DropDownList1.SelectedValue == "C1006")
            {
                CheckBoxList1.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                TextBox3.Visible = false;
                TextBox4.Visible = true;

                TextBox1.Text = null;
                TextBox2.Text = null;
                TextBox3.Text = null;
            }
            else
            {
                TextBox4.Text = null;
            }

            if (Request.Cookies["sellerName"] != null)
            {
                HttpCookie cookie = Request.Cookies["sellerName"];

                string username = Server.HtmlEncode(cookie.Value);
                string getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + username + "'";

                con.Open();
                SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
                string userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
                con.Close();

                hdn_login_userID.Value = userID;
            }



        }

        //Add Product
        protected void AddProdBtn_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator4.Enabled = true;
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string userID = hdn_login_userID.Value;
            string image1Name = "", image2Name = "", image3Name = "";

            //try
            //{
            //    image1Name = FileUpload1.FileName.ToString();
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + image1Name);
            //}
            //catch(Exception ex)
            //{
            //    string err = "An error occured.<br/>" + ex.Message;
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + err + "')", true);
            //}

            if (FileUpload1.HasFile)
            {
                image1Name = FileUpload1.FileName.ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + image1Name);
                
                if (FileUpload2.HasFile)
                {
                    image2Name = FileUpload2.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + image2Name);
                }
                else
                {
                    image2Name = "~/image/white.jpg";
                }

                if (FileUpload3.HasFile)
                {
                    image3Name = FileUpload3.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + image3Name);
                }
                else
                {
                    image3Name = "~/image/white.jpg";
                }


                //SqlDataAdapter adapter = new SqlDataAdapter();
                string sql1 = "INSERT into Product (Prod_ID, Prod_Name, Prod_Price, Prod_Details, Prod_Image1, Prod_Image2, Prod_Image3, Prod_Status, Cat_ID, Seller_ID, Sort_ID, Prod_Tag, Add_Date) " +
                        "values (@id, @name, @price, @details, @image1, @image2, @image3, @status, @cat_ID, @seller_ID, @sort_ID, @tag, @date)";

                con.Open();
                SqlCommand cmd1 = new SqlCommand(sql1, con);

                cmd1.Parameters.AddWithValue("@id", res_addProd_id.Text);
                cmd1.Parameters.AddWithValue("@name", tbx_addProd_name.Text);
                cmd1.Parameters.AddWithValue("@price", tbx_addProd_Price.Text);
                cmd1.Parameters.AddWithValue("@details", tbx_addProd_Desc.Value);
                cmd1.Parameters.AddWithValue("@image1", image1Name);
                cmd1.Parameters.AddWithValue("@image2", image2Name);
                cmd1.Parameters.AddWithValue("@image3", image3Name);
                cmd1.Parameters.AddWithValue("@status", "On Stock");
                cmd1.Parameters.AddWithValue("@cat_ID", DropDownList1.SelectedValue);
                cmd1.Parameters.AddWithValue("@seller_ID", userID);
                cmd1.Parameters.AddWithValue("@sort_ID", DropDownList2.SelectedValue);
                cmd1.Parameters.AddWithValue("@tag", tbx_addProd_Tag.Text);
                cmd1.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                
                cmd1.ExecuteNonQuery();
                con.Close();
                
                string sql2 = "INSERT into SizeDetails (Size_ID, Prod_ID, Prod_Count) values (@sizeID, @prodID, @prodCount)";
            
                if(DropDownList1.SelectedValue == "" || DropDownList1.SelectedValue == "C1000" || DropDownList1.SelectedValue == "C1002" || DropDownList1.SelectedValue == "C1005" || DropDownList1.SelectedValue == "C1006")
                {
                    if (TextBox4.Text != "")
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", "Z1000");
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", TextBox4.Text);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }
                }
                else
                {
                    if (TextBox1.Text != "")
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[0].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", TextBox1.Text);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[0].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", 0);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }

                    if (TextBox2.Text != "")
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[1].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", TextBox2.Text);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[1].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", 0);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }

                    if (TextBox3.Text != "")
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[2].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", TextBox3.Text);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@sizeID", CheckBoxList1.Items[2].Value);
                        cmd2.Parameters.AddWithValue("@prodID", res_addProd_id.Text);
                        cmd2.Parameters.AddWithValue("@prodCount", 0);
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }

                }
                
                Repeater1.DataBind();
                Response.Redirect("Seller_Product.aspx", false);

            }
            else
            {
                string err = "An error occured.<br/>";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + err + "')", true);
            }
        }

        protected void Button_Cancel(object sender, EventArgs e) //for reset textfield
        {

            tbx_addProd_name.Text = null;
            tbx_addProd_Price.Text = null;
            tbx_addProd_Desc.Value = null;
            tbx_addProd_Tag.Text = null;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;

            TextBox1.Text = null;
            TextBox2.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;

            FileUpload1.Attributes.Clear();
            
        }

        
        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CheckBoxList1.Items[0].Selected == true)
            {
                TextBox1.Enabled = true;
            }
            else
            {
                TextBox1.Enabled = false;
                TextBox1.Text = null;
            }

            if (CheckBoxList1.Items[1].Selected == true)
            {
                TextBox2.Enabled = true;
            }
            else
            {
                TextBox2.Enabled = false;
                TextBox2.Text = null;
            }

            if (CheckBoxList1.Items[2].Selected == true)
            {
                TextBox3.Enabled = true;
            }
            else
            {
                TextBox3.Enabled = false;
                TextBox3.Text = null;
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedValue == "C1001" || DropDownList1.SelectedValue == "C1003" || DropDownList1.SelectedValue == "C1004")
            {
                TextBox4.Visible = false;

                CheckBoxList1.Visible = true;
                TextBox1.Visible = true;
                TextBox2.Visible = true;
                TextBox3.Visible = true;

                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
            }
            
        }


        //Set all data into modal of Edit Product when chosen 1 product
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            
            int index = Convert.ToInt32(e.CommandArgument);
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string str1 = "SELECT Cat_Type FROM Category WHERE Cat_ID = '" + (Repeater1.Items[index].FindControl("hdn_prod_catID") as HiddenField).Value + "'";
            string str2 = "SELECT Sort_Type FROM Sort WHERE Sort_ID = '" + (Repeater1.Items[index].FindControl("hdn_prod_sortID") as HiddenField).Value + "'";

            string cat, sort;

            con.Open();
            SqlCommand sqlCat = new SqlCommand(str1, con);
            SqlCommand sqlSort = new SqlCommand(str2, con);

            cat = Convert.ToString(sqlCat.ExecuteScalar());
            sort = Convert.ToString(sqlSort.ExecuteScalar());
            con.Close();

            edit_prodID.Text = (Repeater1.Items[index].FindControl("prod_ID") as Label).Text;
            edit_prodName.Text = (Repeater1.Items[index].FindControl("prod_Name") as Label).Text;
            edit_prodPrice.Text = (Repeater1.Items[index].FindControl("prod_Price") as Label).Text;
            edit_prodDesc.Value = (Repeater1.Items[index].FindControl("prod_Details") as Label).Text;
            edit_prodTag.Text = (Repeater1.Items[index].FindControl("prod_Tag") as Label).Text;

            edit_catID.Text = cat;
            edit_sortID.Text = sort;

            //edit_catID.Text = (Repeater1.Items[index].FindControl("hdn_prod_catID") as HiddenField).Value;
            //edit_sortID.Text = (Repeater1.Items[index].FindControl("hdn_prod_sortID") as HiddenField).Value;

            edit_prodImg1.Src = (Repeater1.Items[index].FindControl("Prod_Image1") as Image).ImageUrl;
            edit_prodImg2.Src = (Repeater1.Items[index].FindControl("Prod_Image2") as Image).ImageUrl;
            edit_prodImg3.Src = (Repeater1.Items[index].FindControl("Prod_Image3") as Image).ImageUrl;
            //edit_prodImg1.ImageUrl = (Repeater1.Items[index].FindControl("Prod_Image1") as Image).ImageUrl;
            //edit_prodImg2.ImageUrl = (Repeater1.Items[index].FindControl("Prod_Image2") as Image).ImageUrl;
            //edit_prodImg3.ImageUrl = (Repeater1.Items[index].FindControl("Prod_Image3") as Image).ImageUrl;
            DropDownList3.SelectedValue = (Repeater1.Items[index].FindControl("hdn_prod_status") as HiddenField).Value;
            

        }

        //Check display size, if is "-" then null
        public string CheckSize(Object myValue)
        {
            string result = "";
            if(Convert.ToString(myValue) != "-")
            {
                result = myValue.ToString() + " = ";
                return result;
            }
            else
            {
                return result;
            }
        }

        public string CheckEditSize(Object myValue)
        {
            string result = "";
            if (Convert.ToString(myValue) != "-")
            {
                
                result = myValue.ToString();
                return result;
            }
            else
            {
                CheckBox checkBox = (Repeater3.FindControl("cbx1") as CheckBox);
                //Repeater3.Items.FindControl("cbx1").Visible = false;
                return result;
            }
        }

        public bool CheckSizeVis(Object myValue)
        {
            Boolean result = true;
            if (Convert.ToString(myValue) != "-")
            {
                return result;
            }
            else
            {
                result = false;
                return result;
            }
        }

        protected void Edit_Button_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["KosupureEntities"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            
            HttpCookie cookie = Request.Cookies["sellerName"];
            string username = Server.HtmlEncode(cookie.Value);
            string getUserID = "SELECT S.Seller_ID FROM Seller S WHERE S.Seller_Username = '" + username + "'";

            con.Open();
            SqlCommand sqlGetUserID = new SqlCommand(getUserID, con);
            string userID = Convert.ToString(sqlGetUserID.ExecuteScalar());
            con.Close();

            string image1Name, image2Name, image3Name;

            if (FileUpload4.HasFile)
            {
                image1Name = FileUpload4.FileName.ToString();
                FileUpload4.PostedFile.SaveAs(Server.MapPath("~/image/") + image1Name);
            }
            else
            {
                image1Name = edit_prodImg1.Src;
                image1Name = image1Name.Remove(0, 8);

            }

            if (FileUpload5.HasFile)
            {
                image2Name = FileUpload5.FileName.ToString();
                FileUpload5.PostedFile.SaveAs(Server.MapPath("~/image/") + image2Name);
            }
            else
            {
                image2Name = edit_prodImg2.Src;
                image2Name = image2Name.Remove(0, 8);
            }

            if (FileUpload6.HasFile)
            {
                image3Name = FileUpload6.FileName.ToString();
                FileUpload6.PostedFile.SaveAs(Server.MapPath("~/image/") + image3Name);
            }
            else
            {
                image3Name = edit_prodImg3.Src;
                image3Name = image3Name.Remove(0, 8);
            }
            
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql1 = "UPDATE Product set Prod_Name = '" + edit_prodName.Text + "', Prod_Price = '" + edit_prodPrice.Text +
                    "', Prod_Details = '" + edit_prodDesc.Value + "', Prod_Image1 = '" + image1Name + "', Prod_Image2 = '" + image2Name +
                    "', Prod_Image3 = '" + image3Name + "', Prod_Status = '" + DropDownList3.SelectedValue + "', Prod_Tag = '" + edit_prodTag.Text +
                    "' WHERE Prod_ID = '" + edit_prodID.Text + "'";

            con.Open();
            SqlCommand cmd1 = new SqlCommand(sql1, con);
            adapter.UpdateCommand = cmd1;
            cmd1.ExecuteNonQuery();
            con.Close();

            string size1, size2, size3, size4;
            string sizeID1, sizeID2, sizeID3, sizeID4;
            //string sql2 = "INSERT into SizeDetails (Size_ID, Prod_ID, Prod_Count) values (@sizeID, @prodID, @prodCount)";

            if(edit_catID.Text == "Costume   " || edit_catID.Text == "Shoes     " || edit_catID.Text == "Set       ")
            {
                size1 = (Repeater3.Items[0].FindControl("tbx1") as TextBox).Text;
                size2 = (Repeater3.Items[1].FindControl("tbx1") as TextBox).Text;
                size3 = (Repeater3.Items[2].FindControl("tbx1") as TextBox).Text;

                if(edit_catID.Text == "Shoes     ")
                {
                    sizeID1 = "Z1004";
                    sizeID2 = "Z1005";
                    sizeID3 = "Z1006";
                }
                else
                {
                    sizeID1 = "Z1001";
                    sizeID2 = "Z1002";
                    sizeID3 = "Z1003";
                }

                string strSize1 = "UPDATE SizeDetails set Prod_Count = '" + size1 +"' WHERE (Prod_ID = '" + edit_prodID.Text + "' AND Size_ID = '" + sizeID1 + "')";
                string strSize2 = "UPDATE SizeDetails set Prod_Count = '" + size2 + "' WHERE (Prod_ID = '" + edit_prodID.Text + "' AND Size_ID = '" + sizeID2 + "')";
                string strSize3 = "UPDATE SizeDetails set Prod_Count = '" + size3 + "' WHERE (Prod_ID = '" + edit_prodID.Text + "' AND Size_ID = '" + sizeID3 + "')";

                con.Open();

                SqlCommand cmdss1 = new SqlCommand(strSize1, con);
                adapter.UpdateCommand = cmdss1;
                cmdss1.ExecuteNonQuery();

                SqlCommand cmdss2 = new SqlCommand(strSize2, con);
                adapter.UpdateCommand = cmdss2;
                cmdss2.ExecuteNonQuery();

                SqlCommand cmdss3 = new SqlCommand(strSize3, con);
                adapter.UpdateCommand = cmdss3;
                cmdss3.ExecuteNonQuery();

                con.Close();

            }
            else
            {
                size4 = (Repeater3.Items[0].FindControl("tbx1") as TextBox).Text;

                string strSize4 = "UPDATE SizeDetails set Prod_Count = '" + size4 + "' WHERE (Prod_ID = '" + edit_prodID.Text + "' AND Size_ID = 'Z1000')";

                con.Open();
                SqlCommand cmdss4 = new SqlCommand(strSize4, con);
                adapter.UpdateCommand = cmdss4;
                cmdss4.ExecuteNonQuery();
                con.Close();

            }


            Response.Redirect("Seller_Product.aspx", false);
        }

      

        //protected void Button4_Click(object sender, EventArgs e)
        //{
        //    Session["Image"] = FileUpload1.PostedFile;
        //    Stream fs = FileUpload1.PostedFile.InputStream;
        //    BinaryReader br = new BinaryReader(fs);
        //    byte[] bytes = br.ReadBytes((Int32)fs.Length);
        //    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        //    Image1.ImageUrl = "data:image/png;base64" + base64String;



        //    //if (FileUpload1.HasFile)
        //    //{
        //    //    string imageName = FileUpload1.FileName.ToString();
        //    //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + imageName);

        //    //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    //    string str = "UPDATE ";


        //    //}



        //}





        //protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        if ((e.Item.FindControl("Size_Details")as CheckBox).Text == "-")
        //        {
        //            e.Item.FindControl("Size_Details").Visible = false;
        //        }

        //    }

        //}
        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        //public IQueryable GridView1_GetData()
        //{
        //    KosupureEntities1 _db = new KosupureEntities1();
        //    return _db.Products;
        //}
    }
}