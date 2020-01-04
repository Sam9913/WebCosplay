<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Seller_Product.aspx.cs" Inherits="CosplayWeb.Seller_Product" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>


    <style>

        .space1 {
            width: 20%;
            float: left;
        }

        .space2 {
            width: 80%;
            float: left;
        }

        .seller_nav {
            width: 80%;
            padding-left: 5%;
            padding-right: 5%;
            margin: 0 0 5% 20%;
            border-collapse: collapse;
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
        }

        .seller_nav td {
            padding: 5%;
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
        }

        .seller_nav td:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .seller_nav_onclick {
            background-color: #333;
            color: white;

        }

        .table-space {
            width: 80%;
            float: right;
            padding-top: 3%;
            padding-left: 5%;
            padding-right: 5%;
            margin-left: 5%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;
            height: auto; 
            padding-bottom:5%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .seller_table  {
            width: 100%;
            padding-left: 5%;
            padding-right: 5%;
            border-collapse: collapse;
        }
        
        .seller_table_header {
            /*height: 100px;*/
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
        }

        .seller_table th {
            padding: 2% 2% 2% 2%;
            border-bottom: 2px solid black;
            border-top: 2px solid black;
        }

        .seller_table td {
            padding: 2% 2% 2% 2%;
            border-bottom: 1px solid black;
            
        }

        .btn {
            float:right;
            padding: 12px 25px 12px 25px;
            margin-bottom: 4%;
            background-color: white;
        }

        .addBtn:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .left {
            text-align:left;

        }

        .middle {
            text-align:center;
        }

        .image1 {
            float:left;
        }

        .image2 .image3 {
            vertical-align:top;
            float:left;
        }
        
        .tbxCount {
            margin-left:10px;
        }

        .cblist label {
            padding-right: 10px;
            padding-left: 8px;
        }

        .cblist input {
            margin-left:17px;
            margin-bottom:5px;
        }

        .cblist table {
             float:left;
         }

        .ddlist {
            float:left;
        }

        .tbx4size1 {
            position:absolute;
            left:320px;
            top:268px;
        }

        .tbx4size2 {
            position:absolute;
            left:320px;
            top:297px;
        }

        .tbx4size3 {
            position:absolute;
            left:320px;
            top:326px;
        }

        .cblist2 label {
            padding-right: 10px;
            padding-left: 8px;
            width:30px;
        }

        .cblist2 input {
            display:none;
            margin-bottom:5px;
        }

        input[type=file]{
            display:inline;

        }

        .upload_image {
            display:inline;
        }

    </style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">My Product</h2>
    </div>

    <div style="min-width: 950px;">

        <asp:Label ID="Label4" runat="server"></asp:Label>

        <div class="space1">
            <table class="seller_nav">
                <tr>
                    <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
                </tr>

                <tr>
                    <td class="seller_nav_onclick">My Product</td>
                </tr>

                <tr>
                    <td onclick="changePage('transHis')" id="transHis" style="cursor:pointer;">Transaction History</td>
                </tr>
            </table>
        </div>

        <asp:HiddenField ID="hdn_login_userID" runat="server" />

        <div class="space2">
            <div class="table-space">

                <button type="button" id="addBtn" runat="server" class="btn addBtn" style="margin-right:5%; border: 1.5px solid #333; font-weight:500; font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" data-toggle="modal" data-target="#modal_addProduct">Add Product</button>

                <table class="seller_table">
                    <tr class="seller_table_header">
                        <th class="left" style="width:25%;">
                            <asp:Label ID="lbl_prod" runat="server" Text="Product" Width="140px"></asp:Label>
                        </th>
                        <th class="left" style="width:40%;">
                            <asp:Label ID="lbl_details" runat="server" Text="Details"></asp:Label> 

                        </th>
                        <th class="middle" style="width:15%;">
                            <asp:Label ID="lbl_stockCount" runat="server" Text="Stock Count"></asp:Label>
                        </th>
                        <th class="middle" style="width:15%;">
                            <asp:Label ID="lbl_status" runat="server" Text="Status" Width="100px"></asp:Label>
                        </th>
                        <th class="middle" style="width:5%;">
                            &nbsp;
                        </th>
                    </tr>
                </table>

                <table class="seller_table">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                    <tr>
                        <td style="width:25%;">
                            <asp:Image ID="prod_Image1" runat="server" CssClass="image1" Height="124px" Width="116px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString() %>' />
                            <asp:Image ID="prod_Image2" runat="server" CssClass="image2" Height="62px" Width="58px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image2").ToString() %>' />
                            <asp:Image ID="prod_Image3" runat="server" CssClass="image3" Height="62px" Width="58px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image3").ToString() %>' />
                        </td>

                        <asp:HiddenField ID="hdn_prod_catID" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"Cat_ID") %>' />
                        <asp:HiddenField ID="hdn_prod_sortID" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"Sort_ID") %>' />
                        <asp:HiddenField ID="hdn_prod_status" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"Prod_Status") %>' />

                        <td style="width:40%;">
                            <table style="width:100%;">
                                <tr>
                                    <td style="border:none; width:30%; vertical-align:top;">Product ID</td><td style="border:none; width:5%; vertical-align:top;">:</td>
                                    <td style="border:none; vertical-align:top;"><asp:Label ID="prod_ID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border:none; width:30%; vertical-align:top;">Name</td><td style="border:none; width:5%; vertical-align:top;">:</td>
                                    <td style="border:none; vertical-align:top;"><asp:Label ID="prod_Name" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Name") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border:none; width:30%; vertical-align:top;">Description</td><td style="border:none; width:5%; vertical-align:top;">:</td>
                                    <td style="border:none; vertical-align:top;"><asp:Label ID="prod_Details" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Details") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border:none; width:30%; vertical-align:top;">Tag</td><td style="border:none; width:5%; vertical-align:top;">:</td>
                                    <td style="border:none; vertical-align:top;"><asp:Label ID="prod_Tag" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Tag") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border:none; width:30%; vertical-align:top;">Price</td><td style="border:none; width:5%; vertical-align:top;">:</td>
                                    <td style="border:none; vertical-align:top;">RM <asp:Label ID="prod_Price" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Price","{0:0.00}") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </td>

                        <td class="middle" style="width:15%;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6">
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# CheckSize(Eval("Size_Details")) %>'></asp:Label>
                                    <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Count") %>'></asp:Label><br />
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT SD.Size_ID, SD.Prod_ID, SD.Prod_Count, S.Size_Details FROM SizeDetails SD join Size S on SD.Size_ID = S.Size_ID WHERE SD.Prod_ID = @Prod_ID">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="prod_ID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td class="middle" style="width:15%;">
                            <%#DataBinder.Eval(Container.DataItem,"Prod_Status") %><br />
                        </td>

                        <td class="middle" style="width:5%; padding-left:1%;">
                            <asp:LinkButton ID="LinkButton1" Text='<i id="icon_edit" class="fas fa-edit" style="font-size: 18px; color: black; cursor: pointer; margin-bottom:2px; margin-top: 5px;"></i>' 
                                runat="server" ToolTip="Edit" CausesValidation="false" CommandArgument='<%#Container.ItemIndex%>' OnCommand="LinkButton1_Command">
                            </asp:LinkButton>
                        </td>
                    </tr>

                    </ItemTemplate>
                </asp:Repeater>

                </table>
            </div>
        </div>


    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
        SelectCommand="SELECT P.Prod_ID, P.Prod_Name, P.Prod_Price, P.Prod_Details, P.Prod_Rate, P.Prod_Image1, P.Prod_Image2, P.Prod_Image3, P.Prod_Status, P.Prod_Tag, P.Add_Date, P.Sales_Count, P.Cat_ID, P.Sort_ID, S.Seller_ID FROM Product AS P INNER JOIN Seller AS S ON P.Seller_ID = S.Seller_ID WHERE (S.Seller_UserName = @sellerName) ORDER BY P.Add_Date DESC">
        <SelectParameters>
            <asp:CookieParameter CookieName="sellerName" Name="sellerName"></asp:CookieParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Seller] WHERE ([Seller_UserName] = @Seller_UserName)">
        <SelectParameters>
            <asp:CookieParameter CookieName="sellerName" Name="Seller_UserName" Type="String"></asp:CookieParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    

    <!-- Add product modal -->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_addProduct" role="dialog" data-backdrop="static">
        <div class="modal-dialog" style="width:70%;">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Add Product</h4>
            </div>
            
            

            <div class="modal-body">
                <table class="table_addProd" style="float:left; width:55%;">
                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addProd_id" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:Label ID="res_addProd_id" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addProd_name" runat="server" Text="Name"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="tbx_addProd_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_addProd_name" ErrorMessage="Please enter product name." ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label5" runat="server" Text="Product Price"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="tbx_addProd_Price" Placeholder="Eg. 100.00" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_addProd_Price" ErrorMessage="Please enter product price." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ControlToValidate="tbx_addProd_Price" ErrorMessage="Invalid input. Eg. 100.00" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label3" runat="server" Text="Product Description"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <textarea id="tbx_addProd_Desc" runat="server" cols="30" rows="5"></textarea>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbx_addProd_Desc" ErrorMessage="Please enter product description." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label9" runat="server" Text="Tag"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="tbx_addProd_Tag" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbx_addProd_Tag" Enabled="true" ErrorMessage="Please enter product tag" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label6" runat="server" Text="Category"></asp:Label>
                        </th>    
                            
                        <td style="padding-left:10px;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="DropDownList1" CssClass="ddlist" runat="server" OnRender="DropDownList1_SelectedIndexChanged" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Cat_Type" DataValueField="Cat_ID" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBoxList ID="CheckBoxList1" CssClass="cblist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="Size_Details" DataValueField="Size_ID" RepeatDirection="Vertical" RepeatLayout="Table" TextAlign="Right"></asp:CheckBoxList>    
                                    
                                    <asp:TextBox ID="TextBox4" Placeholder="Eg. 1" CssClass="tbxCount" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" Placeholder="Eg. 1" CssClass="tbx4size1" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox2" Placeholder="Eg. 1" CssClass="tbx4size2" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox3" Placeholder="Eg. 1" CssClass="tbx4size3" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>        
                    </tr>
                            
                    <tr>
                        <th style="padding-top:10px; vertical-align:top;">
                            <asp:Label ID="Label7" runat="server" Text="Sort"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-top:10px; padding-left:10px;">
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Sort_Type" DataValueField="Sort_ID"></asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <th style="vertical-align:top; padding-top:3%;">
                            <asp:Label ID="Label1" runat="server" Text="Image1"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL1(this)"/>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top; padding-top:3%;">
                            <asp:Label ID="Label2" runat="server" Text="Image2"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload2" runat="server" onchange="readURL2(this)"/>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top; padding-top:3%;">
                            <asp:Label ID="Label15" runat="server" Text="Image3"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload3" runat="server" onchange="readURL3(this)"/>
                        </td>
                    </tr>
                </table>

                <table style="width:35%; float:left;">
                    <tr>
                        <td>Image 1:</td>
                        <td style="padding-left:2%;">Image 2:</td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:2%;"><img id="Image1" alt="Preview" src="/image/empty_image.jpg" height="300" width="225"/></td>
                        <td style="padding-bottom:2%; padding-left:2%;"><img id="Image2" alt="Preview" src="/image/empty_image.jpg" height="300" width="225"/></td>
                    </tr>
                    <tr>
                        <td>Image 3:</td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:2%;"><img id="Image3" alt="Preview" src="/image/empty_image.jpg" height="300" width="225"/></td>
                    </tr>
                </table>
            </div>

            <div class="modal-footer" style="clear:both;">
                <asp:Button ID="Button2" CssClass="btn btn-default" data-dismiss="modal" runat="server" Text="Cancel"/>
                <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Submit" OnClick="AddProdBtn_Click"/>
                <%--<button type="reset" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>


    <!-- Edit product modal -->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_editProduct" role="dialog" data-backdrop="static">
        <div class="modal-dialog" style="width:70%;">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Edit Product</h4>
            </div>
            
            <div class="modal-body" style="width:100%; height:550px;">

                <table class="table_addProd" style="width:55%; float:left;">
                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label16" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:Label ID="edit_prodID" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label18" runat="server" Text="Name"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="edit_prodName" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label19" runat="server" Text="Product Price"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="edit_prodPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label20" runat="server" Text="Product Description"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <textarea id="edit_prodDesc" runat="server" cols="30" rows="5"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label21" runat="server" Text="Tag"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:TextBox ID="edit_prodTag" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label22" runat="server" Text="Category"></asp:Label>
                        </th>    
                            
                        <td style="padding-left:10px;">
                            <asp:Label ID="edit_catID" runat="server" Text="Label"></asp:Label>
                        </td>        
                    </tr>
                    <tr>
                        <th style="vertical-align:top; padding-top:10px;">
                            <asp:Label ID="Label8" runat="server" Text="Stock Count"></asp:Label>
                        </th>
                        <td style="padding-left:10px; padding-top:12px;">
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource9">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbx1" CssClass="cblist2" Text='<%# CheckEditSize(Eval("Size_Details")) %>' Checked="true" runat="server" Visible='<%# CheckSizeVis(Eval("Size_Details")) %>'/>
                                    <asp:TextBox ID="tbx1" runat="server" Text='<%# Eval("Prod_Count") %>' Visible="true"></asp:TextBox><br />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT SD.Size_ID, SD.Prod_ID, SD.Prod_Count, S.Size_Details FROM SizeDetails SD join Size S on SD.Size_ID = S.Size_ID WHERE SD.Prod_ID = @Prod_ID">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="edit_prodID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                        
                    <tr>
                        <th style="padding-top:10px; vertical-align:top;">
                            <asp:Label ID="Label23" runat="server" Text="Sort"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-top:10px; padding-left:10px;">
                            <asp:Label ID="edit_sortID" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label24" runat="server" Text="Image1"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload4" runat="server" onchange="readURL4(this)"/>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label25" runat="server" Text="Image2"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload5" runat="server" onchange="readURL5(this)" />
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label26" runat="server" Text="Image3"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload6" runat="server" onchange="readURL6(this)" />
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label10" runat="server" Text="Product Status"></asp:Label>
                        </th>
                        <td style="padding-left:10px; vertical-align:top;">
                            <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>On Stock</asp:ListItem>
                            <asp:ListItem>Out of Stock</asp:ListItem>
                            <asp:ListItem>Not Available</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>

                <table style="width:35%; float:left;">
                    <tr>
                        <td>Image 1:</td>
                        <td style="padding-left:2%;">Image 2:</td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:2%;">
                            <div id="hdn_img1"><img id="edit_prodImg1" src="#" alt="Preview" height="300" width="225" runat="server"/></div>
                            <img id="edit_preview_img1" alt="Preview" height="300" width="225" src="#" style="display:none" />
                        </td>
                        <td style="padding-bottom:2%; padding-left:2%;">
                            <div id="hdn_img2"><img id="edit_prodImg2" src="#" alt="Preview" height="300" width="225" runat="server"/></div>
                            <img id="edit_preview_img2" alt="Preview" src="#" height="300" width="225" style="display:none"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Image 3:</td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:2%;">
                            <div id="hdn_img3"><img id="edit_prodImg3" src="#" alt="Preview" height="300" width="225" runat="server"/></div>
                            <img id="edit_preview_img3" alt="Preview" src="#" height="300" width="225" style="display:none"  />
                        </td>
                    </tr>
                </table>

<%--                <table style="width:30%; float:left;">
                    <tr>
                        <td>Image 1:</td>
                        <td style="padding-bottom:2%;"><asp:Image ID="edit_prodImg1" runat="server" Height="124px" Width="116px"/></td>
                    </tr>
                    <tr>
                        <td>Image 2:</td>
                        <td style="padding-bottom:2%;"><asp:Image ID="edit_prodImg2" runat="server" Height="124px" Width="116px"/></td>
                    </tr>
                    <tr>
                        <td>Image 3:</td>
                        <td style="padding-bottom:2%;"><asp:Image ID="edit_prodImg3" runat="server" Height="124px" Width="116px"/></td>
                    </tr>
                    <tr>
                        <td>Product Status:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server">
                                <asp:ListItem>On Stock</asp:ListItem>
                                <asp:ListItem>Out of Stock</asp:ListItem>
                                <asp:ListItem>Not Available</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>--%>

            </div>

            <div class="modal-footer" style="height:80px; clear:both;">
                <asp:Button ID="Button3" CssClass="btn btn-default" data-dismiss="modal" runat="server" Text="Cancel"/>
                <asp:Button ID="Edit_Button" CssClass="btn btn-default" runat="server" Text="Edit" CausesValidation="false" OnClick="Edit_Button_Click"/>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>




    <%--<asp:ValidationSummary ID="ValidationSummary1" CssClass="error" runat="server" HeaderText="The following problems have been encountered" ShowMessageBox="true"/>--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Sort]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Size.Size_ID, Size.Size_Details, Size.Type, Category.Cat_ID, Category.Cat_Type, Category.WithSize FROM Size INNER JOIN Category ON Size.Type = Category.WithSize WHERE (Category.Cat_ID = @Cat_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Cat_ID"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>






    <script>
        
        function openModal() {
            $('#modal_editProduct').modal('show');
        }
        
        function showEdit() {
            document.getElementById("btnEdit").hidden = false;
        }

        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Seller_Profile.aspx";

            else if (id == document.getElementById("transHis").id)
                window.location.href = "TransactionHistorySell.aspx";

        }

        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#Image1').attr('src', e.target.result);
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }
    
        $("#FileUpload1").change(function(){
            readURL1(this);
        });

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#Image2').attr('src', e.target.result);
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#FileUpload2").change(function(){
            readURL2(this);
        });

        function readURL3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#Image3').attr('src', e.target.result);
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#FileUpload3").change(function(){
            readURL3(this);
        });

        function readURL4(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#edit_preview_img1').attr('src', e.target.result);
                    document.getElementById("edit_preview_img1").style.display = 'block';
                    document.getElementById("hdn_img1").setAttribute("style", "display:none");
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }
    
        $("#FileUpload4").change(function(){
            readURL4(this);
        });

        function readURL5(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#edit_preview_img2').attr('src', e.target.result);
                    document.getElementById("edit_preview_img2").style.display = 'block';
                    document.getElementById("hdn_img2").setAttribute("style", "display:none");
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }
    
        $("#FileUpload5").change(function(){
            readURL5(this);
        });

        function readURL6(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#edit_preview_img3').attr('src', e.target.result);
                    document.getElementById("edit_preview_img3").style.display = 'block';
                    document.getElementById("hdn_img3").setAttribute("style", "display:none");
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }
    
        $("#FileUpload6").change(function(){
            readURL6(this);
        });




        function resetField() {
            //document.getElementById('#tbx_addProd_name').te
            $("#tbx_addProd_name").attr('Text', null);
        }

                    //tbx_addProd_name.Text = null;
            //tbx_addProd_Price.Text = null;
            //tbx_addProd_Desc.Value = null;
            //tbx_addProd_Tag.Text = null;
            //FileUpload1.Dispose();
            //FileUpload2.Dispose();
            //FileUpload3.Dispose();

    </script>
   

</asp:Content>



