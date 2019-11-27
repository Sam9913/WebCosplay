<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="WebForm1.aspx.cs" Inherits="Assignment.WebForm1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        /*.home{
            float:left;
            margin-top:5%;
            margin-left:10%;
            margin-bottom:5%;
            display:block;
            width:10%;
        }*/

        /*.homeButton, .loginButton{
            display:none;
            position: absolute;
            margin-top: 25%;
            margin-left: 25%;
        }*/

        /*.home:hover .homeButton, .login:hover .loginButton{
            display:inline-block;
        }*/

        /*.login{
            position:initial;
            float:left;
            display:block;
            width:10%;
            margin-top:5%;
            margin-left:50%;
            margin-bottom:5%;
        }*/


    </style>

    <div style="width:100%;">
        <div class="home" style="float: left; width: 50%;">
            <asp:Button ID="homeButton" runat="server" Text="Home" CssClass="homeButton" OnClick="homeButton_Click"/>
            <%--<asp:Image ID="Image1" runat="server" ImageUrl="https://imgix.ranker.com/user_node_img/50064/1001279286/original/eevee-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces" Width="100%"/>--%>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/homescreen1.jpg" Width="100%" CssClass="imagebtn1"/>
        
        </div>

        <div class="login" style="width: 50%;">
            <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="loginButton" OnClick="loginButton_Click"/>
            <%--<asp:Image ID="Image" runat="server" ImageUrl="https://www.lolwhy.com/javascript/uploads/2019/10/D99HYFPVUAACtMz-561x842.jpg" Width="100%" />--%>
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/homescreen2.jpg" Width="100%"/>
        </div>
    </div>
   
</asp:Content>


