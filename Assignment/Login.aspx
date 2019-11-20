<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <div style="text-align:center; margin-top:2%;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>/<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
    </div>

        <div style="margin-top:2.8%">
            <div style="margin-bottom:2.52%">
                <div style="margin-left:42%">
                    <div style="text-align:center;">
                        <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#333333" TextLayout="TextOnTop">
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                        </asp:Login>
                    </div>
                </div>
                <br /><br />
                <div style="margin-left:39%">
                    <div style="text-align:center;">
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
                            <SubmitButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#990000" />
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <SuccessTextStyle Font-Bold="True" ForeColor="#990000" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />                        
                        </asp:PasswordRecovery>
                    </div>
                </div>

            </div>
        </div>
</asp:Content>
