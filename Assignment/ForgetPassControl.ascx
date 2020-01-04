<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassControl.ascx.cs" Inherits="Assignment.ForgetPassControl" %>

<div style="margin-right:10%;">
Forgot your password?<br />
Enter Username to receive password<br />
Username : <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
<br /><br />
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>&ensp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
</div>
