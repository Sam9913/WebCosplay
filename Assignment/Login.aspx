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

    <div style="text-align:center; margin-top:2%;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>/<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
    </div>

    <br />

    <div class="loginTable">
        <div style="margin-left:10%;">
            <asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Customer</asp:ListItem>
                <asp:ListItem>Cosplayer</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Login ID="Login1" runat="server"  Font-Names="Verdana" Font-Size="10pt" OnLoggedIn="Login1_LoggedIn" OnAuthenticate="Login1_Authenticate">
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
            </asp:Login>
        </div>
                <br /><br />
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" Font-Names="Verdana" Font-Size="10pt">
                            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />                        
                        </asp:PasswordRecovery>
    </div>
</asp:Content>
