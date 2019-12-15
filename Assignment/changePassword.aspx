<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="changePassword.aspx.cs" Inherits="Assignment.changePassword" %>
 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .changeTable{
            margin-top:5%;
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

        <div class="changeTable">
            <asp:ChangePassword ID="ChangePassword1" runat="server" Font-Names="Verdana" Font-Size="10pt" OnChangedPassword="ChangePassword1_ChangedPassword">
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                </asp:ChangePassword>  
        </div>
</asp:Content>
