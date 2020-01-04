<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="Assignment.LoginControl" %>

<asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Selected="True">Customer</asp:ListItem>
    <asp:ListItem>Cosplayer</asp:ListItem>
</asp:RadioButtonList>
<asp:Login ID="Login1" runat="server"  Font-Names="Verdana" Font-Size="10pt" OnLoggedIn="Login1_LoggedIn" OnAuthenticate="Login1_Authenticate">
    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
</asp:Login>
<br />
<asp:LinkButton ID="lbPass" runat="server" OnClick="lbPass_Click" style="margin-right:15%;">Forgot password press here</asp:LinkButton>