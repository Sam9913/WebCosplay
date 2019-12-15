<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .loginTable{
            text-align:center;
            width: 10%;
            padding-top: 2%;
            padding-bottom: 2%;
            padding-left: 2%;
            padding-right: 2%;
            margin-left: 36%;
            margin-bottom: 5%;
            min-width: 350px;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
    </style>

    <div style="text-align:center; margin-top:2%; margin-bottom:2.3%;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>/<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
    </div>

    <br />

    <div class="loginTable">
        <div style="margin-left:10%;">
            <asp:PlaceHolder ID="phdLogin" runat="server">

            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
