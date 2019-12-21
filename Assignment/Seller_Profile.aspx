<%@ Page Language="C#" ClassName="AutoID" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Seller_Profile.aspx.cs" Inherits="CosplayWeb.Seller_Profile" %>

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

        .usernameBold {
            font-weight:bold;
        }

        .commentBox {
            border-radius:10px 10px 10px 10px;
            border-color:grey;
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

        .icon_comment {
            font-size: 30px; 
            color: black; 
            cursor: pointer; 
            margin-bottom:15px;
        }

        .icon_comment:hover, .icon_comment:focus {
            color: black;
            text-decoration:none;
        }


        .icon_delete {
            font-size: 30px; 
            color: black; 
            cursor: pointer; 
            margin-bottom:15px;
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
                <td onclick="changePage('myProd')" id="myProd" style="cursor:pointer;">My Product</td>
            </tr>

            <tr>
                <td onclick="changePage('transHis')" id="transHis" style="cursor:pointer;">Transaction History</td>
            </tr>
            <tr>
                <td onclick="changePage('changePass')" id="changePass" style="cursor:pointer;">Change Password</td>
            </tr>
        </table>
    </div>

    <div class="space2">
        <div class="seller_table" style="height: auto; padding-bottom:5%;">
            
<%--            <div class="background_image" style="text-align:center; height: 300px;" >
                <asp:Image ID="Image2" ImageUrl="~/image/background.png" CssClass="background_img" runat="server"/>
            </div>--%>
       

            <!-- Profile -->
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                        <div class="image" style="text-align:center; ">
                        <asp:Image ID="Image1" ImageUrl='<%# "~/image/" + DataBinder.Eval(Container.DataItem,"Seller_Image").ToString() %>' CssClass="profile_pic" runat="server" />
                    </div>

                    <div style="text-align:center; margin-top: 2%;" >
                        <asp:HiddenField ID="hdn_Seller_ID"  runat="server" Value='<%# Eval("Seller_ID") %>'/>
                        <asp:Label ID="Seller_NameLabel" runat="server" CssClass="username" Text='<%# Eval("Seller_Name") %>' ></asp:Label>
                    </div>

                    <div style="width: 50%; margin-left: 25%; margin-top: 2%; margin-bottom:2%;">
                        Phone : <%# Eval("Seller_Phone") %><br />
                        Email : <%# Eval("Seller_Email") %><br />
                        <%# Eval("Seller_Details") %>
                    </div>

                    <div style="text-align:center; margin: 2%; margin-bottom: 0;">
                        <asp:ImageButton ID="editProfile" ToolTip="Edit Profile" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
                        <asp:ImageButton ID="ImageButton2" ToolTip="Account Settings" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
                        <asp:ImageButton ID="ImageButton3" ToolTip="Add new Post" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <!-- Gallery Post -->
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
        
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater3_ItemDataBound">
                        <ItemTemplate>
                    
                            <div style="width: 100%; float:left; min-width: 850px; margin-top: 7%; height: auto; border:2px solid #eee; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            
                                <asp:HiddenField ID="hidden_Gallery_ID" runat="server" Value='<%#Eval("Gallery_ID") %>'/>
                        
                                <div style="margin: 2%; padding-right:2%; padding-left:2%; float:left; width: 28%; min-width: 235px;">
                                    <asp:Image ID="Image2" Width="200px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Gallery_Image").ToString() %>' runat="server" />
                                </div>

                                <div style="margin: 2%; float:left; width: 55%; min-width: 465px;">
                                    <span>
                                        <%#DataBinder.Eval(Container.DataItem,"Gallery_Desc")%>
                                    </span><hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>
                                    <a href="#" style="text-decoration:none; color: navy; font-size: 12px;">View All 123 Comments</a><br />

                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="Repeater4_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdn_userID" runat="server" Value='<%#Eval("User_ID") %>'/>
                                            <asp:Label ID="lbl_uname" runat="server" CssClass="usernameBold"></asp:Label>
                                            <asp:Label ID="lbl_comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT CO.Comment, CO.User_ID FROM Comment CO where CO.Gallery_ID = @Gallery_ID">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hidden_Gallery_ID" PropertyName="Value" Name="Gallery_ID"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    
                                    <asp:Label ID="username_comment" runat="server" CssClass="usernameBold" Visible="false" Text='<%#Eval("Seller_Username") %>' ></asp:Label>
                                    <asp:TextBox ID="tbx_comment"  CssClass="commentBox" Placeholder=" Comment..." runat="server" Visible="false"></asp:TextBox>
                                    <asp:LinkButton ID="linkbtn_send" CssClass="material-icons" Text="send" runat="server"></asp:LinkButton>
                                </div>

                                <div style="margin: 2%; float:left; width: 5%; min-width: 42px; text-align:center;">
                                   
                                    <asp:Label ID="numLikes" runat="server" Text='<%# Eval("TotalLikes") %>'></asp:Label>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Like" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton1_Command">
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" CssClass="far fa-comment icon_comment" runat="server" ToolTip="Comment" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton2_Command">
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" CssClass="fa fa-trash-alt icon_delete" runat="server" ToolTip="Delete" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton3_Command">
                                    </asp:LinkButton>

                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
            
                </ContentTemplate>
            </asp:UpdatePanel>   --%>                     
                                    

        </div>
        
    </div>

    </div>







    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Seller_ID], [Seller_Name], [Seller_Phone], [Seller_Email], [Seller_IC], [Seller_Details], [Seller_Gender], [Seller_UserName], [Seller_Pass], [Seller_Image] FROM [Seller] WHERE ([Seller_UserName] = @SellerName)">
        <SelectParameters>
            <asp:CookieParameter CookieName="sellerName" Name="SellerName"></asp:CookieParameter>

        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT G.Gallery_ID, G.Gallery_Image, G.Gallery_Desc, G.Gallery_Date, G.Gallery_Tag, G.Gallery_Status, G.User_ID, G.TotalLikes, S.Seller_UserName FROM Gallery G join Seller S on G.User_ID = S.Seller_ID WHERE S.Seller_UserName = @SellerName">
        <SelectParameters>
            <asp:CookieParameter CookieName="sellerName" Name="SellerName"></asp:CookieParameter>

        </SelectParameters>
    </asp:SqlDataSource>




    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_addProduct" role="dialog" >
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Add Product</h4>
            </div>

            <div class="modal-body">
                <table class="table_addProd">
                    <tr>
                        <th>
                            <asp:Label ID="lbl_addProd_id" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="res_addProd_id" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label1" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="lbl_addProd_name" runat="server" Text="Name"></asp:Label>
                        </th>
                        <td>
                            <asp:TextBox ID="tbx_addProd_name" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>

    <script>
        
        function changePage(id) {
            if (id == document.getElementById("myProd").id)
                window.location.href = "Seller_Product.aspx";

            else if (id == document.getElementById("transHis").id)
                window.location.href = "TransactionHistorySell.aspx";
            else if (id == document.getElementById("changePass").id)
                window.location.href = "changePassword.aspx";

        }

        //function openModal(id) {
        //    if (id == document.getElementById("editProfile").id)
        //        //window.location
        //}

        function changeIcon() {
            if (document.getElementById("icon_heart").className == "far fa-heart icon_heart") {
                document.getElementById("icon_heart").className = "fas fa-heart icon_heart";
                document.getElementById("icon_heart").style.color = "red icon_heart";
            } else {
                document.getElementById("icon_heart").className = "far fa-heart";
                document.getElementById("icon_heart").style.color = "black";
            }
        }

        function addComment() {
            
            if (document.getElementById("icon_comment").className == "far fa-comment") {
                document.getElementById("icon_comment").className = "far fa-comment-dots";



                document.getElementById("tbx_comment").style.visibility = "visible";
<%--                if (document.getElementById('<%=tbx_comment.ClientID%>').)
                    document.getElementById("#tbx_comment").style.visibility = "visible";

                else
                    document.getElementById("#tbx_comment").style.visibility = "hidden";
            --%>
            } else {
                document.getElementById("icon_comment").className = "far fa-comment";

                

            }
        }

    </script>

</asp:Content>
