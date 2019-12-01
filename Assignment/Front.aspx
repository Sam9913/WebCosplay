<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Front.aspx.cs" Inherits="Assignment.Front" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content2" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <style>

        .home1:hover .imagebtn1, .login1:hover .imagebtn2 {
            opacity:0.7;
            transition-duration:0.4s;
        }

        .home1:hover .text1 , .login1:hover .text2{
            opacity:1;
            transform: scale(1.5, 1.5);
            font-size: 500%;
            transition-duration:0.4s;
            z-index:3;
            text-shadow:black;
        }

        .text1 {
            opacity:0;
            position: absolute;
            top: 25%;
            left: 15%;
          padding: 16px 32px;
          cursor:pointer;
          font-family:Bahnschrift;
          text-shadow: 2px 1px #333333;
        }

        .text2 {
            opacity:0;
            position: absolute;
            top: 25%;
            left: 65%;
          padding: 16px 32px;
          cursor:pointer;
          font-family:Bahnschrift;
          text-shadow: 2px 1px #333333;
        }

    </style>

    <div style="width:100%;">
        <div class="home1" style="float: left; width: 50%;">
            <div class="text1" OnClick="homeButton_Click">HOME</div>
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/cosplayHome.jpg" Width="100%" CssClass="imagebtn1" OnClick="homeButton_Click"/>
        </div>

        <div class="login1" style="float: left; width: 50%;">
            <div class="text2" OnClick="loginButton_Click">LOGIN</div>
             <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="image/loginFront.jpg" Height="576px" Width="100%" CssClass="imagebtn2" OnClick="loginButton_Click"/>
        </div>
    </div>
   
</asp:Content>

