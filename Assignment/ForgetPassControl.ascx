<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassControl.ascx.cs" Inherits="Assignment.ForgetPassControl" %>


Forgot your password?<br />
Enter Username to receive password<br />
Username : <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
<br />
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>&ensp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />

