<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Front.aspx.cs" Inherits="Assignment.Front" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/home_black.png" CssClass="home" Width="50%" Height="50%" OnClick="ImageButton1_Click"/>
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/login_black.png" CssClass="login" Width="50%" Height="50%" OnClick="ImageButton2_Click"/>
</asp:Content>
