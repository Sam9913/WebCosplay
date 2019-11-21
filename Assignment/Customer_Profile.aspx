<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Customer_Profile.aspx.cs" Inherits="CosplayWeb.Customer_Profile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

        a:hover {
            text-decoration:none;
        }

        a:active {
            text-decoration:none;
        }


    </style>
    <div style="margin: 2%; padding: 2%; width: 100%;">
        <h2 style="margin:auto;">My Profile</h2>
    </div>
    <div style="min-width: 950px;">
<%--        <div style="width:100%; padding-bottom: 5%;">
            <button  type="button" id="btn_addProduct" runat="server" class="btn" data-toggle="modal" data-target="#modal_addProduct">Add Product</button>
        </div>--%>

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

    <div class="space2">
        <div class="seller_table" style="height: auto; padding-bottom:5%;">
            
<%--            <div class="background_image" style="text-align:center; height: 300px;" >
                <asp:Image ID="Image2" ImageUrl="~/image/background.png" CssClass="background_img" runat="server"/>
            </div>--%>
            

            <!-- Profile -->
            <div class="image" style="text-align:center; ">
                <asp:Image ID="Image1" ImageUrl="~/image/sasuke2.png" CssClass="profile_pic" runat="server" />
            </div>

            <div style="text-align:center; margin-top: 2%;" >
                <asp:Label ID="Label7" runat="server" CssClass="username" Text="Name of the user"></asp:Label>
            </div>

            <div style="width: 50%; margin-left: 25%; margin-top: 2%; margin-bottom:2%;">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
            </div>

            <div style="text-align:center; margin: 2%; margin-bottom: 0;">
                <asp:ImageButton ID="editProfile" ToolTip="Edit Profile" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
                <asp:ImageButton ID="ImageButton2" ToolTip="Account Settings" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
                <asp:ImageButton ID="ImageButton3" ToolTip="Add new Post" ImageUrl="~/image/login_black.png" runat="server" CssClass="profile_nav"/>
            </div>



            <!-- Gallery Post -->
            <%for (int i = 0; i < 3; i++) { %>
            <div style="width: 100%; float:left; min-width: 850px; margin-top: 7%; height: auto; border:2px solid #eee; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <div style="margin: 2%; padding-right:2%; padding-left:2%; float:left; width: 28%; min-width: 235px;">
                    <asp:Image ID="Image2" ImageUrl="~/image/sasuke.jpg" runat="server" />
                </div>

                <div style="margin: 2%; float:left; width: 55%; min-width: 465px;">
                    <span>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </span><hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>
                    <a href="#" style="text-decoration:none; color: navy; font-size: 12px;">View All 123 Comments</a><br />
                    <span><b>Username1</b></span>
                    <span>This is the comment of the user1</span><br />
                    <span><b>Username2</b></span>
                    <span>This is the comment of the user2. This is the comment of the user. This is the comment of the user.</span><br />
                    <asp:TextBox ID="tbx_comment" runat="server" style="width: 100%; visibility:hidden;"></asp:TextBox>
                </div>

                <div style="margin: 2%; float:left; width: 5%; min-width: 42px; text-align:center;">
                    <i id="icon_heart" onclick="changeIcon()" class="far fa-heart" style="font-size: 30px; color: black; cursor: pointer; margin-bottom:2px; margin-top: 5px;"></i>
                    <div style="margin-bottom:20px">233</div>
                    <i id="icon_comment" onclick="addComment()" class="far fa-comment" style="font-size: 30px; color: black; cursor: pointer; margin-bottom:2px;"></i>
                    <div style="margin-bottom:20px">125</div>
                    <i id="icon_delete" class="far fa-trash-alt" style="font-size: 30px; color: black; cursor: pointer; margin-bottom:20px;"></i>
                </div>
            </div>    
            <% } %>

        </div>
        
    </div>


    </div>






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
            if (id == document.getElementById("myCart").id)
                window.location.href = "#";

            else if (id == document.getElementById("myWishList").id)
                window.location.href = "#";

            else if (id == document.getElementById("transHis").id)
                window.location.href = "#";


        }

        //function openModal(id) {
        //    //if (id == document.getElementById("editProfile").id)
        //        //window.location
        //}

        function changeIcon() {
            if (document.getElementById("icon_heart").className == "far fa-heart") {
                document.getElementById("icon_heart").className = "fas fa-heart";
                document.getElementById("icon_heart").style.color = "red";
            } else {
                document.getElementById("icon_heart").className = "far fa-heart";
                document.getElementById("icon_heart").style.color = "black";
            }
        }

        function addComment() {
            
            if (document.getElementById("icon_comment").className == "far fa-comment") {
                document.getElementById("icon_comment").className = "far fa-comment-dots";

                document.getElementById("tbx_comment").style.visibility = "visible";
                //if (document.getElementById("tbx_comment".style.visibility == "hidden"))
                //    document.getElementById("tbx_comment").style.visibility = "visible";

                //else
                //    document.getElementById("tbx_comment").style.visibility = "hidden";
            
            } else {
                document.getElementById("icon_comment").className = "far fa-comment";

                

            }
        }

    </script>

</asp:Content>
