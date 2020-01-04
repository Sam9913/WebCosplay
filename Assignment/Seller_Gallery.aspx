<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Seller_Gallery.aspx.cs" Inherits="CosplayWeb.Seller_Gallery" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%> <!-- so do this -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>


    <style>

        .space {
            min-width:950px;
            width: 94%;
            padding: 0 3% 0 3%;
            margin: 0 3% 0 3%;

        }

        .gallery {
            margin: 0.4%;
        }

        .post_content {
            width:25%;
            float:left;
            text-align:center;
            margin:0 4% 5% 4%;
            padding:2% 0 0 2.5%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .image_border {
            align-content:center;
        }

        .icon_heart1, .icon_comment {
            font-size:25px;
            color: black; 
            cursor: pointer; 
        }

        .icon_heart2 {
            color: red; 
            cursor: pointer; 
            font-size:25px;
        }

        .icon_heart1:hover, .icon_heart1:focus, .icon_comment:hover, .icon_comment:focus {
            color:black;
            text-decoration:none;
        }

        .icon_heart2:hover, .icon_heart2:focus {
            color:red;
            text-decoration:none;
        }

        .post_image {
            width:60%;
            float:left;
        }

        .profile_pic {
            border-radius: 50%;
            border: 2px solid white;
            width: 100%;
        }

        .icon_float {
            float:right;
            font-size:18px;
        }

        .usernameBold {
            font-weight:bold;
        }

        .username_css {
            padding-left: 2%;
            font-size: 20px;
        }

        .post_desc_css {
            font-size: 18px;
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

    </style>
    <div style="margin: 2%; padding: 2%; width: 96%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Gallery</h2>
    </div>
    <asp:HiddenField ID="hdn_loginUserID" runat="server" />
    <asp:HiddenField ID="hdn_isSeller" runat="server" />

            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
<%--                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="post_closed"/>
                </Triggers>--%>
                <ContentTemplate>
                    
        <div class="space">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="post_content">
                        <asp:HiddenField ID="hdn_galleryID" runat="server" Value='<%#Eval("Gallery_ID") %>'/>
                        <asp:HiddenField ID="hdn_userID" runat="server" Value='<%#Eval("User_ID") %>'/>
                        <asp:HiddenField ID="hdn_desc" runat="server" Value='<%#Eval("Gallery_Desc") %>'/>
                        <asp:HiddenField ID="hdn_date" runat="server" Value='<%#Eval("Gallery_Date") %>'/>
                        <asp:HiddenField ID="hdn_tag" runat="server" Value='<%#Eval("Gallery_Tag") %>'/>
                        <asp:HiddenField ID="hdn_userImg" runat="server" />
                        <asp:HiddenField ID="hdn_itemIndex" runat="server" Value='<%#Container.ItemIndex%>'/>

                        <table>
                            <tr class="image_border">
                                <td colspan="3">                                            <!--if can remove height n chg xia position-->
                                    <asp:ImageButton ID="gallery_image" CssClass="gallery" Height="300px" Width="260px" ImageUrl='<%#"~/image/" + Eval("Gallery_Image").ToString() %>' runat="server" CommandArgument='<%# Container.ItemIndex%>' OnCommand="gallery_image_Command"/>
                                </td>
                            </tr>
                            <tr class="image_border" style="text-align:right;">
                                <td style="text-align:left; padding:5% 0 5% 0;">
                                    <asp:Label ID="post_username" CssClass="usernameBold" runat="server"></asp:Label>
                                </td>
                                <td style="padding:5% 0 5% 0;">
                                    <asp:Label ID="numLikes" runat="server" Text='<%# Eval("TotalLikes") %>' Font-Size="18px"></asp:Label>                                            
                                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Like" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton1_Command">
                                    </asp:LinkButton>
                                </td>
                                <td style="padding:5% 0 5% 0; width:60px;">
                                    <asp:Label ID="numComment" runat="server" Text="2" Font-Size="18px"></asp:Label>
                                    <asp:LinkButton ID="LinkButton2" CssClass="far fa-comment icon_comment" runat="server" ToolTip="Comment" CommandArgument='<%# Container.ItemIndex%>' OnCommand="LinkButton2_Command">
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Gallery_ID, Gallery_Image, Gallery_Desc, Gallery_Date, Gallery_Tag, Gallery_Status, User_ID, TotalLikes FROM Gallery WHERE (Gallery_Status = 1) ORDER BY Gallery_Date DESC"></asp:SqlDataSource>


    <!-- Enlarge post details modal -->
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_postDetails" role="dialog"  >
        <div class="modal-dialog" style="width:80%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" id="post_closed" class="close" data-dismiss="modal">&times;</button>
              <%--<h4 class="modal-title">Add Product</h4>--%>
            </div>

            <div class="modal-body" style="float:left; width:100%;">
                <asp:HiddenField ID="enPost_galleryID" runat="server" />
                <asp:HiddenField ID="enPost_itemIndex" runat="server" />

                <asp:Image ID="enPost_image" CssClass="post_image" runat="server" />

                <table style="float:right; width:35%; margin:0 2% 0 2%;">
                    <tr>
                        <td rowspan="2" style="width:25%;">
                            <asp:Image ID="enPost_userImg" CssClass="profile_pic" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="enPost_username" CssClass="username_css usernameBold" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; padding-left:2%;">
                            <asp:Label ID="enPost_date" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:Label ID="enPost_desc" CssClass="post_desc_css" runat="server"></asp:Label>
                            <asp:Label ID="enPost_tag" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>
                        </td>
                    </tr>

                </table>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                <div style="float:left; margin-left:3%; width: 35%;">
                    <div style="float:right; margin-left:2%;">
                        <asp:LinkButton ID="enPost_LinkButton2" CssClass="far fa-comment icon_comment" runat="server" ToolTip="Comment" OnClick="enPost_LinkButton2_Click">
                        </asp:LinkButton>
                    </div>
                    <div style="float:right; margin-left:5%;">
                        <asp:Label ID="enPost_numComment" CssClass="icon_float" runat="server"></asp:Label>
                    </div>
                    <div style="float:right; margin-left:2%;">
                        <asp:LinkButton ID="enPost_LinkButton1" runat="server" ToolTip="Like" OnClick="enPost_LinkButton1_Click">
                        </asp:LinkButton>
                    </div>
                    <div style="float:right;">
                        <asp:Label ID="enPost_numLikes" CssClass="icon_float" runat="server"></asp:Label>
                    </div>
                </div>
                    <hr style="float:left; width: 35%; border:0; border-top: 2px solid #333; margin: 1% 0; margin-left:3%;"/>
                
                <div style="float:left; margin-left:3%; width:35%;">
                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdn_cmt_userID" runat="server" Value='<%#Eval("User_ID") %>'/>
                            <asp:Label ID="cmt_username" CssClass="usernameBold" runat="server"></asp:Label>
                            <asp:Label ID="cmt_comment" CssClass="updatedcomment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT CO.Comment, CO.User_ID FROM Comment CO where CO.Gallery_ID = @Gallery_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="enPost_galleryID" PropertyName="Value" Name="Gallery_ID"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>

                <div style="float:left; margin-left:3%; width:35%;">
                    <hr style="border:0; border-top: 2px solid #333; margin: 3% 0;"/>

                    <asp:Label ID="username_comment" runat="server" CssClass="usernameBold commentName" Visible="false" Text='<%#Eval("Seller_Username") %>' ></asp:Label>

                    <div class="wrapper" id="wrapper" style="width: 96%;" runat="server" visible="false">
                        <asp:TextBox ID="tbx_comment"  CssClass="commentBox wrapper" Placeholder="Comment..." runat="server"  TextMode="MultiLine" Visible="false" Rows="5"></asp:TextBox>
                        <asp:LinkButton ID="linkbtn_send" CssClass="material-icons commentSubmit" Text="send" runat="server" Visible="false" OnClick="linkbtn_send_Click"></asp:LinkButton>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>                
            </div>

            <div class="modal-footer" style="clear:both;">
              <%--<button type="button" id="post_closed" class="btn btn-default" data-dismiss="modal">Close</button>--%>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>
    
                </ContentTemplate>
            </asp:UpdatePanel>



    <script>

        function open_modal_postDetails() {
            $('#modal_postDetails').modal('show');
        }

        function ConfirmApproval(objMsg)
        {
            if(confirm(objMsg))
            {
                window.location.href = "Login.aspx";
                return true;
            }    
            else
                return false;    
        }

    </script>

</asp:Content>







