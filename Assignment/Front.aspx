<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Front.aspx.cs" Inherits="Assignment.Front" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .home{
            margin-top:5%;
            margin-left:10%;
            margin-bottom:5%;
        }

        .homeButton{
            opacity:0.2;
        }

        .home:hover::after .homeButton {
            position: absolute;
            margin-top: 20%;
            margin-left: 12.5%;
            opacity:1.0;
        }

        .login{
            margin-top:5%;
            margin-right:15%;
            margin-bottom:5%;
        }
    </style>

    <asp:Button ID="homeButton" runat="server" Text="Home" CssClass="homeButton"/>
    <asp:Image ID="Image1" runat="server" ImageUrl="https://imgix.ranker.com/user_node_img/50064/1001279286/original/eevee-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces" CssClass="home" Width="20%" Height="20%"/>
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="https://www.lolwhy.com/javascript/uploads/2019/10/D99HYFPVUAACtMz-561x842.jpg" CssClass="login" Width="20%" Height="20%" OnClick="ImageButton2_Click"/>
</asp:Content>
