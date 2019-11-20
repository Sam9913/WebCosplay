<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Front.aspx.cs" Inherits="Assignment.Front" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .home{
            float:left;
            margin-top:5%;
            margin-left:10%;
            margin-bottom:5%;
            display:block;
            width:10%;
        }

        .homeButton, .loginButton{
            display:none;
            position: absolute;
            margin-top: 15%;
            margin-left: 7%;
        }

        .home:hover .homeButton, .login:hover .loginButton{
            display:inline-block;
        }

        .login{
            position:initial;
            float:left;
            display:block;
            width:10%;
            margin-top:5%;
            margin-left:50%;
            margin-bottom:5%;
        }
    </style>

    <div style="float:left;">
        <div class="home">
            <asp:Button ID="homeButton" runat="server" Text="Home" CssClass="homeButton" OnClick="homeButton_Click"/>
            <asp:Image ID="Image1" runat="server" ImageUrl="https://imgix.ranker.com/user_node_img/50064/1001279286/original/eevee-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces" Width="180%"/>
        </div>

        <div class="login">
            <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="loginButton" OnClick="loginButton_Click"/>
            <asp:Image ID="Image" runat="server" ImageUrl="https://www.lolwhy.com/javascript/uploads/2019/10/D99HYFPVUAACtMz-561x842.jpg" Width="180%" />
        </div>
    </div>
   
</asp:Content>
