<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Login.aspx.cs" Inherits="assignmentWEB.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
        <div style="margin-top:10%">
            <div style="margin-bottom:10%">
                <div style="margin-left:43%">
                    <div style="margin-right:43%">
                        <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#333333" TextLayout="TextOnTop">
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                        </asp:Login>
                    </div>
                </div>
                <br /><br />
                <div style="margin-left:40%">
                    <div style="margin-right:40%">
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
