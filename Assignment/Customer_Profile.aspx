<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Customer_Profile.aspx.cs" Inherits="CosplayWeb.Customer_Profile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

        .seller_table  {
            width: 80%;
            float: right;
            padding-top: 3%;
            padding-left: 5%;
            padding-right: 5%;
            margin-left: 5%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
        

        .btn {
            float:right;
            padding: 12px 25px 12px 25px;
            margin-right: 7%;
            margin-bottom: 2%;
        }

        .left {
            text-align:left;

        }

        .middle {
            text-align:center;
        }

        .background_img {
            opacity: 0.5;
            height: 300px;
        }

        .image {
            z-index:2;
        }

        .username {
            font-size: 18px;
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .profile_pic {
            border-radius: 50%;
            border: 2px solid white;
            height:200px;
            width:200px;
        }

        .profile_nav {
            padding: 2%;
            padding-left: 4%;
            padding-right: 4%;
        }

        .profile_nav_text {
            padding:0 4% 2% 4%;
        }

        .table th {
            
            margin-left: 5%;
        }

        .icon_editProfile {
            font-size: 34px;
            color: black; 
            cursor: pointer;
        }

        .icon_addPost, .icon_editAccount {
            font-size: 36px;
            color: black; 
            cursor: pointer;
            margin-left: 7%;
        }

        .icon_editProfile:hover, .icon_editProfile:focus, .icon_addPost:hover, .icon_addPost:focus, .icon_editAccount:hover, .icon_editAccount:focus {
            color:black;
            text-decoration:none;
        }

        .usernameBold {
            font-weight:bold;
        }

        .updatedcomment {
            word-break:break-all;
        }

        .wrapper {
            margin-left:2%;
            border:1.5px solid black;
            border-radius:10px 10px 10px 10px;
            display:inline-block;
        }
        .commentName {
            padding-top:2%;
            float:left;
        }

        .commentSubmit {
            border:0;
            display:inline-block;
            float:right;
            margin:3%;
            color:black;
        }

        .commentBox {
            border: 0;
            margin: 3%;
            width: 80%;
            height:24px;
            float:left;
            /*border-radius:10px 10px 10px 10px;
            border-color:grey;*/
        }

        .commentSubmit:hover, .commentSubmit:focus {
            color:black;
            text-decoration:none;
        }

        .icon_heart1 {
            font-size: 30px;
            color: black; 
            cursor: pointer; 
            margin-bottom:15px; 
            margin-top: 5px;
        }

        .icon_heart2 {
            font-size: 30px;
            color: red; 
            cursor: pointer; 
            margin-bottom:15px; 
            margin-top: 5px;
        }

        .icon_heart1:hover, .icon_heart1:focus {
            color:black;
            text-decoration:none;
        }

        .icon_heart2:hover, .icon_heart2:focus {
            color:red;
            text-decoration:none;
        }

        .icon_comment, .icon_delete {
            font-size: 30px; 
            color: black; 
            cursor: pointer; 
            margin-bottom:15px;
        }

        .icon_comment:hover, .icon_comment:focus, .icon_delete:hover, .icon_delete:focus {
            color: black;
            text-decoration:none;
        }

    </style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">My Profile</h2>
    </div>
    <div style="min-width: 950px;">

    <div class="space1" style="position:sticky; top:0;">
        <table class="seller_nav">
            <tr>
                <td class="seller_nav_onclick">My Profile</td>
            </tr>

            <tr>
                <td onclick="changePage('myCart')" id="myCart" style="cursor:pointer;">My Cart</td>
            </tr>

            <tr>
                <td onclick="changePage('myWishlist')" id="myWishlist" style="cursor:pointer;">My Wishlist</td>
            </tr>

            <tr>
                <td onclick="changePage('transHis')" id="transHis" style="cursor:pointer;">Transaction History</td>
            </tr>
        </table>
    </div>
        <asp:HiddenField ID="hdn_login_userID" runat="server" />
        <asp:HiddenField ID="hdn_confirmDelete" runat="server" Value="false" ClientIDMode="Static"/>

    <div class="space2">
        <div class="seller_table" style="height: auto; padding-bottom:5%;">
            
<%--            <div class="background_image" style="text-align:center; height: 300px;" >
                <asp:Image ID="Image2" ImageUrl="~/image/background.png" CssClass="background_img" runat="server"/>
            </div>--%>
            

            <!-- Profile -->
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="image" style="text-align:center; ">
                        <asp:Image ID="Image1" ImageUrl='<%# "~/image/" + DataBinder.Eval(Container.DataItem,"Cust_Image").ToString() %>' CssClass="profile_pic" runat="server" />
                    </div>

                    <div style="text-align:center; margin-top: 2%;" >
                        <asp:HiddenField ID="hdn_Cust_ID"  runat="server" Value='<%# Eval("Cust_ID") %>'/>
                        <asp:Label ID="Cust_NameLabel" runat="server" CssClass="username usernameBold" Text='<%# Eval("Cust_Name") %>' ></asp:Label>
                    </div>

                    <div style="width: 50%; margin-left: 25%; margin-top: 2%; margin-bottom:2%;">
                        Phone : <%# Eval("Cust_Phone") %><br />
                        Email : <%# Eval("Cust_Email") %><br />
                        <%# Eval("Cust_Details") %>
                    </div>

                    <div style="text-align:center; margin: 2%; margin-bottom: 0;">
                        <asp:LinkButton ID="editProfile" CssClass="fas fa-user-edit icon_editProfile" runat="server" ToolTip="Edit Profile" OnClick="editProfile_Click"></asp:LinkButton>
                        <asp:LinkButton ID="addPost" CssClass="fas fa-plus-square icon_addPost" runat="server" ToolTip="Add New Post" OnClick="addPost_Click"></asp:LinkButton>
                        <asp:LinkButton ID="editAccount" CssClass="fa fa-cog icon_editAccount" runat="server" ToolTip="Account Settings" OnClick="editAccount_Click"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


            <!-- Gallery Post -->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
        
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater3_ItemDataBound">
                        <ItemTemplate>
                    
                            <div style="width: 100%; float:left; min-width: 850px; margin-top: 7%; height: auto; border:2px solid #eee; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            
                                <asp:HiddenField ID="hidden_Gallery_ID" runat="server" Value='<%#Eval("Gallery_ID") %>'/>
                        
                                <div style="margin: 2%; padding-right:2%; padding-left:2%; float:left; width: 28%; min-width: 235px;">
                                    <asp:Image ID="Image2" Width="200px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Gallery_Image").ToString() %>' runat="server" />
                                </div>

                                <div style="margin: 2%; float:left; width: 55%; min-width: 465px;">
                                    <asp:Label ID="gallery_username" CssClass="usernameBold" runat="server"></asp:Label><br />
                                    <span>
                                        <%#DataBinder.Eval(Container.DataItem,"Gallery_Desc")%>
                                    </span><hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>

                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="Repeater4_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdn_userID" runat="server" Value='<%#Eval("User_ID") %>'/>
                                            <asp:Label ID="lbl_uname" runat="server" CssClass="usernameBold"></asp:Label>
                                            <asp:Label ID="lbl_comment" CssClass="updatedcomment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT CO.Comment, CO.User_ID FROM Comment CO where CO.Gallery_ID = @Gallery_ID">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hidden_Gallery_ID" PropertyName="Value" Name="Gallery_ID"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>

                                    <asp:Label ID="username_comment" runat="server" CssClass="usernameBold commentName" Visible="false" Text='<%#Eval("Cust_Username") %>' ></asp:Label>

                                    <div class="wrapper" id="wrapper" style="width: 70%;" runat="server" visible="false">
                                        <asp:TextBox ID="tbx_comment"  CssClass="commentBox wrapper" Placeholder="Comment..." runat="server"  TextMode="MultiLine" Visible="false" Rows="5"></asp:TextBox>
                                        <asp:LinkButton ID="linkbtn_send" CssClass="material-icons commentSubmit" Text="send" runat="server" Visible="false" OnCommand="linkbtn_send_Command" CommandArgument="<%# Container.ItemIndex %>"></asp:LinkButton>
                                    </div>
                                </div>

                                <div style="margin: 2%; float:left; width: 5%; min-width: 42px; text-align:center;">
                                    <%--<asp:HiddenField ID="hdn_likestatus" runat="server" Value='<%# Eval("LikeStatus") %>'/>--%>
                                    <%--<div style="">233</div>--%>
                                    <asp:Label ID="numLikes" runat="server" Text='<%# Eval("TotalLikes") %>'></asp:Label>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Like" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton1_Command">
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" CssClass="far fa-comment icon_comment" runat="server" ToolTip="Comment" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton2_Command">
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" CssClass="fa fa-trash-alt icon_delete" runat="server" ToolTip="Delete" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton3_Command" OnClientClick="AlertFunction();">
                                    </asp:LinkButton>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
            
                </ContentTemplate>
            </asp:UpdatePanel>                        

        </div>
        
    </div>


    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Customer] WHERE ([Cust_UserName] = @Cust_UserName)">
        <SelectParameters>
            <asp:CookieParameter CookieName="customerName" Name="Cust_UserName"></asp:CookieParameter>

        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT G.Gallery_ID, G.Gallery_Image, G.Gallery_Desc, G.Gallery_Date, G.Gallery_Tag, G.Gallery_Status, G.User_ID, G.TotalLikes, CU.Cust_UserName FROM Gallery AS G INNER JOIN Customer AS CU ON G.User_ID = CU.Cust_ID WHERE (CU.Cust_UserName = @CustName) AND (G.Gallery_Status = 1) ORDER BY G.Gallery_Date DESC">
        <SelectParameters>
            <asp:CookieParameter CookieName="customerName" Name="CustName"></asp:CookieParameter>
        </SelectParameters>
    </asp:SqlDataSource>


        <!-- Edit Profile modal -->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_editProfile" role="dialog" data-backdrop="static" >
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Edit Profile</h4>
            </div>


            <div class="modal-body" style="float:left; width:100%;">
                <table class="table_editProfile" style="width:63%; float:left;">

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_editProf_name" runat="server" Text="Name"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="editProf_name" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label3" runat="server" Text="IC Number"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="editProf_ic" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label1" runat="server" Text="Phone Number"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="editProf_phone" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="editProf_email" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="editProf_gender" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_editProf_userName" runat="server" Text="Description"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px; padding-top:5px;">
                            <textarea id="editProf_desc" runat="server" cols="35" rows="8"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label4" runat="server" Text="Profile Image"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="editProf_image" runat="server" onchange="readURL1(this)" />
                        </td>
                    </tr>
                </table>

                <table style="width:35%; float:left;">
                    <tr>
                        <td style="padding-bottom:2%;">
                            <div id="hdn_img1"><img id="editProf_oriImage" class="profile_pic" src="#" alt="Preview" runat="server"/></div>
                            <img id="edit_preview_img1" alt="Preview" src="#" class="profile_pic" style="display:none"/>
                        </td>
                    </tr>
                    
                </table>
              

            </div>
                      
            <div class="modal-footer" style="clear:both;">
                <asp:Button ID="Button1" CssClass="btn btn-default" data-dismiss="modal" runat="server" Text="Cancel" />
                <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" Text="Edit" CausesValidation="false" OnClick="Button2_Click"/>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>

        <!-- Account setting modal-->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_account" role="dialog" data-backdrop="static" >
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">New Post</h4>
            </div>

            <div class="modal-body" style="height:350px;">
                <table class="table_addPost" style="width:60%; float:left;">
                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label6" runat="server" Text="Gallery ID"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:Label ID="Label7" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label8" runat="server" Text="Description"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px; padding-top:5px;">
                            <textarea id="Textarea1" runat="server" cols="35" rows="8"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label9" runat="server" Text="Tag"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="Label10" runat="server" Text="Image"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="FileUpload1" runat="server"/>
                            <%--<asp:Button ID="Button1" runat="server" Text="Preview" OnCommand="Button1_Command"/>--%>
                        </td>
                    </tr>
                </table>

            </div>
                      
            <div class="modal-footer">
              <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                <asp:Button ID="Button3" CssClass="btn btn-default" data-dismiss="modal" runat="server" Text="Cancel" />
                <asp:Button ID="Button4" CssClass="btn btn-default" runat="server" Text="Done" OnClick="btn_addPost_Click" CausesValidation="false"/>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>



    
    <!-- Add New Post modal -->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_addPost" role="dialog" data-backdrop="static" >
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">New Post</h4>
            </div>

            <div class="modal-body" style="height:350px;">
                <table class="table_addPost" style="width:60%; float:left;">
                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addPost_id" runat="server" Text="Gallery ID"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:Label ID="res_addPost_id" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addPost_desc" runat="server" Text="Description"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px; padding-top:5px;">
                            <textarea id="res_addPost_desc" runat="server" cols="35" rows="8"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addPost_tag" runat="server" Text="Tag"></asp:Label>
                        </th>
                        <td style="padding-bottom:20px; padding-left:10px;">
                            <asp:TextBox ID="res_addPost_tag" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align:top;">
                            <asp:Label ID="lbl_addPost_image" runat="server" Text="Image"></asp:Label>
                        </th>
                        <td style="padding-bottom:10px; padding-left:10px;">
                            <asp:FileUpload ID="res_addPost_image" runat="server" onchange="readURL2(this)" />
                        </td>
                    </tr>
                </table>

                <table style="width:35%; float:left;">
                    <tr>
                        <td style="padding-bottom:2%;">
                            <img id="addPost_img" height="300" width="225" src="#" alt="Preview"/>
                        </td>
                    </tr>
                </table>
              

            </div>
                      
            <div class="modal-footer">
                <asp:Button ID="btn_cancel" CssClass="btn btn-default" data-dismiss="modal" runat="server" Text="Cancel" />
                <asp:Button ID="btn_addPost" CssClass="btn btn-default" runat="server" Text="Add Post" OnClick="btn_addPost_Click" CausesValidation="false"/>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Image] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2001" Name="Id" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <script>

        function changePage(id) {
            if (id == document.getElementById("myCart").id)
                window.location.href = "cartList.aspx";

            else if (id == document.getElementById("myWishlist").id)
                window.location.href = "Wishlist.aspx";

            else if (id == document.getElementById("transHis").id)
                window.location.href = "TransactionHistoryCus.aspx";
        }

        function open_addPost_Modal() {
            $('#modal_addPost').modal('show');
        }

        function open_modal_editProfile() {
            $('#modal_editProfile').modal('show');
        }

        function open_modal_account() {
            $('#modal_account').modal('show');
        }

        function AlertFunction() {
            if (confirm('Are you sure you want to delete this post?')) {
                $('#hdn_confirmDelete').val("True");
            } else {
                $('#hdn_confirmDelete').val("False");
            }
        }

        function ConfirmApproval(objMsg)
        {
            if(confirm(objMsg))
            {
                $("hdn_confirmDelete").val("true");
                return true;
            }    
            else
                return false;    
        }

        function readURL1(input) {
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
    
        $("#editProf_image").change(function(){
            readURL1(this);
        });

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
            
                reader.onload = function (e) {
                    $('#addPost_img').attr('src', e.target.result);
                }
            
                reader.readAsDataURL(input.files[0]);
            }
        }
    
        $("#res_addPost_image").change(function(){
            readURL2(this);
        });

    </script>

</asp:Content>
