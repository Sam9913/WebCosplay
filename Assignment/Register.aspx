<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .registerTable{
            text-align:center;
            width: 10%;
            padding-top: 2%;
            padding-bottom: 2%;
            padding-left: 4%;
            padding-right: 2%;
            margin-left: 36%;
            margin-bottom: 5%;
            min-width: 350px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
    
    <div style="text-align:center; margin-top:2%; margin-bottom:2%;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>/<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
    </div>

    <div class="registerTable">
        <div style=" ">
            <div style=" ">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Font-Names="Verdana" Font-Size="10pt">
                    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                    <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server" />
                        <asp:CompleteWizardStep runat="server" />
                    </WizardSteps>
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" />
                    <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                    <SideBarButtonStyle ForeColor="#FFFFFF" BorderWidth="0px" Font-Names="Verdana" />
                    <SideBarStyle BackColor="#7C6F57" Font-Size="0.9em" VerticalAlign="Top" BorderWidth="0px" />
                    <StepStyle BorderWidth="0px"></StepStyle>
                </asp:CreateUserWizard>
            </div>
        </div>
    </div>
</asp:Content>
