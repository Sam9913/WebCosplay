<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .registerTable{
            /*text-align:center;*/
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
        <div style="margin-left:20%">
            <h2>Register Account</h2>           
            <asp:RadioButtonList ID="rbnAccType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbnAccType_SelectedIndexChanged">
                <asp:ListItem>Customer</asp:ListItem>
                <asp:ListItem>Seller</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please select customer or seller" Text="*" ForeColor="Red" ControlToValidate="rbnAccType"></asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="ID"></asp:Label></td>
                    <td> : </td>
                    <td><asp:Label ID="lblID" runat="server" Text=""></asp:Label></td>
                </tr>

                <tr>
                    <td><asp:Label ID="lblUName" runat="server" Text="User Name"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtUName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required." Text="*" ControlToValidate="txtUName" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Username should start with letters and contain 6 to 12 characters."
                                Text="*" ControlToValidate="txtUName" ValidationExpression="^[a-zA-Z][a-zA-Z0-9]{5,11}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required." Text="*" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required." Text="*" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password should be 6 characters." Text="*"
                                ControlToValidate="txtPassword" ValidationExpression="[0-9a-zA-Z]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not same!" CssClass="validationError" Text="*"
                            ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="IC"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtIC" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="IC is required." Text="*" ControlToValidate="txtIC" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="IC should be 12 characters." Text="*"
                                ControlToValidate="txtIC" ValidationExpression="(([[1-9]{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01]))([0-9]{2})([0-9]{4})" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:RadioButtonList ID="rbnGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label7" runat="server" Text="Profile Image"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label8" runat="server" Text="Phone Number"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phone number is required." Text="*" ControlToValidate="txtPhoneNum" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Should start with 01 and be 10 or 11 characters." Text="*"
                                ControlToValidate="txtPhoneNum" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label9" runat="server" Text="Email"></asp:Label></td>
                    <td> : </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email is required" Text="*" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Email format is incorrect." Text="*"
                                ControlToValidate="txtEmail" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label10" runat="server" Text="Details"></asp:Label></td>
                    <td> : </td>
                    <td><asp:TextBox ID="txtDetail" runat="server"></asp:TextBox></td>
                </tr>

                <!--Address for customer only-->
                <tr>
                    <td><asp:Label ID="Label11" runat="server" Text="Address"></asp:Label></td>
                    <td><asp:Label ID="Label12" runat="server" Text=" : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Address is required." Text="*" ControlToValidate="txtAdress" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>
            <br />
            <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </div>

    </div>
</asp:Content>
