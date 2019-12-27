<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Site1.Master" CodeBehind="placeOrder.aspx.cs" Inherits="Assignment.placeOrder" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>


    <style type="text/css">

        .table-space {
            width: 90%;
            padding-top: 3%;
            padding-right: 5%;
            margin-left: 5%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;
            height: auto; 
            padding-bottom:5%;
            float:right;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
          .btn {
            float:right;
            padding: 12px 25px 12px 25px;
            margin-right: 7%;
            margin-bottom: 2%;
             background-color:white;
        }

         .addBtn:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .tableShipping td{
            padding-left:5px;
        }

        .ddl{
            height:35px;
            border-radius:5px;
            border:1px solid;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           
        }
        .txt{
            width:50%;
            height:35px;
            border-radius:5px;
            border:1px solid;
             font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
       
        }

        .txt1{
            height:35px;
            border-radius:5px;
            border:1px solid;
             font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
       
        }

        .lbl{
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        </style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Proceed to Checkout</h2>
    </div>

    <div class="table-space">
        
        <div style="margin-left:7%;width: 50%;float:left;">
           <h3 style="margin-left:3%;" class="lbl">Shipping Address</h3>
            <table class="tableShipping"style="border:1px solid black;border-radius:5px;">
                <tr><td><br /><h4 class="lbl">Contact information</h4></td></tr>
                
                <tr>
                    <td>
                        <asp:TextBox ID="TxtEmail" runat="server" class="txt" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="TxtEmail" Text="*" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegexEmail" Display="Dynamic" runat="server" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TxtEmail" ErrorMessage="Invalid Email" SetFocusOnError="true"></asp:RegularExpressionValidator>
                    </td>
                    </tr>
                
                    <tr>
                        <td><br />
                            <asp:TextBox ID="TxtPhone" runat="server" class="txt" placeholder="Phone (+60)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ErrorMessage="Phone is Required" ControlToValidate="TxtPhone" Text="*" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" Display="Dynamic" runat="server" ForeColor="red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ControlToValidate="TxtPhone" ErrorMessage="Invalid Phone Number" SetFocusOnError="true"></asp:RegularExpressionValidator>
                   </td>
                    </tr>
                

                <tr><td><h4 class="lbl" style="padding-top:10px;">Billing Address</h4></td></tr>
              

                <tr>
                    <td>
                        <asp:TextBox ID="TxtName" runat="server" class="txt" placeholder="Full Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ForeColor="red" Text="*" ControlToValidate="TxtName"  ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Reg" runat="server" ControlToValidate="TxtName"  ErrorMessage="Enter a valid name" ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,50}"  SetFocusOnError="true"></asp:RegularExpressionValidator>
                     </td>
                 </tr>
               
                <tr>
                    <td>
                        <br />
                  <asp:TextBox ID="TxtAddress" runat="server" class="txt" placeholder="Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="Address is Required" ForeColor="red" ControlToValidate="TxtAddress" Text="*"></asp:RequiredFieldValidator>
                    </td>
               </tr>
               
                  <tr>
                    <td>
                        <br />
                        <asp:TextBox ID="TxtHtype" runat="server" class="txt" placeholder="Apartment,suite,etc. (Optional)"></asp:TextBox>
                    </td>
               </tr>
                
                <tr>
                    <td>
                <br />
                    <asp:TextBox ID="TxtCity" runat="server" class="txt" placeholder="City"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ForeColor="red" Text="*" ControlToValidate="TxtCity"  ErrorMessage="City is Required"></asp:RequiredFieldValidator>
                       
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorCity" runat="server" ControlToValidate="TxtCity" ErrorMessage="Invalid City" ForeColor="Red" ValidationExpression="^[a-zA-Z'@&#.\s]{1,50}$" SetFocusOnError="true"></asp:RegularExpressionValidator>
                    </td>
               </tr>
                
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="ddl" style="width:105%;">
                                        <asp:ListItem>Malaysia/ West Malaysia</asp:ListItem>
                                        <asp:ListItem>Malaysia/ East Malaysia</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width:30%;">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="ddl" style="margin-left:15px;">
                                        <asp:ListItem>Johor</asp:ListItem>
                                        <asp:ListItem>Kedah</asp:ListItem>
                                        <asp:ListItem>Kelantan</asp:ListItem>
                                        <asp:ListItem>Perak</asp:ListItem>
                                        <asp:ListItem>Selangor</asp:ListItem>
                                        <asp:ListItem>Malacca</asp:ListItem>
                                        <asp:ListItem>Negeri Sembilan</asp:ListItem>
                                        <asp:ListItem>Pahang</asp:ListItem>
                                        <asp:ListItem>Perlis</asp:ListItem>
                                        <asp:ListItem>Penang</asp:ListItem>
                                        <asp:ListItem>Sabah</asp:ListItem>
                                        <asp:ListItem>Sarawak</asp:ListItem>
                                        <asp:ListItem>Terengganu</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtPostcode" runat="server" placeholder="Postcode" class="ddl" style="margin-top:20px;margin-left:-20px;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPC" runat="server" ForeColor="red" Text="*" ControlToValidate="TxtPostCode"  ErrorMessage="Post Code is Required"></asp:RequiredFieldValidator>
                       
                                    <asp:RegularExpressionValidator ID="RegularExpressionPostcode" runat="server" ErrorMessage="Invalid postcode" ControlToValidate="TxtPostCode" ValidationExpression="[0-9]{5}" SetFocusOnError="true" ForeColor="red"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>

                </td>
                </tr>

            </table>
            <br />
            <br />

           
           
        </div>

        <div style="float:right;width:45%;margin-right:-9%">
            <h3 style="margin-left:3%;" class="lbl">Order Summary</h3>
            <table style="border-bottom:1px solid;">
                <tr style="border-top:1px solid;border-bottom:1px solid;height:45px;">
                    <td style="width:100px;font-size:large"></td>
                    <td style="font-size:large;width:150px;">Product Name</td>
                    <td style="font-size:large;width:50px;">Size</td>
                    <td style="font-size:large;width:50px;">Qty</td>
                    <td style="font-size:large">Price</td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Cart_Total","{0:0.00}") %>' runat="server" ID="LabelTotal" style="display:none" />
                        <asp:Label Text='<%# Eval("Prod_ID") %>' runat="server" ID="LabelProdID" style="display:none" />
                        <asp:Label Text='<%# Eval("Size_ID") %>' runat="server" ID="LabelSizeID" style="display:none" />
                        <tr>
                            <td style="width:100px;">
                                <asp:Image ImageUrl='<%#"~/image/" + Eval("Prod_Image1").ToString() %>' runat="server" ID="Prod_InamgeLabel" Height="100px" Width="100px" style="margin-left:20px" />
                             </td>
                            <td style="width:150px;"><asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /></td>
                            <td style="width:50px;"><asp:Label Text='<%# Eval("Size_Details") %>' runat="server" ID="Label3" /></td>
                            <td style="width:50px;"><asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="LabelQty" /></td>
                             <td>RM <asp:Label Text='<%# Eval("amount","{0:0.00}") %>' runat="server" ID="Label2" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                </table>
                
              <table style="margin-left:44%;">
                    <tr style="height:35px;">
                        <td>
                            <br />

                            <asp:Label ID="Label6" runat="server" Text="Sub Total " style="width:120px;padding-top:10px;"></asp:Label>
                        </td>
                        <td>
                            <br />
                        <asp:Label ID="subtotal" runat="server" Text="RM 0.00"  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
                
                    <tr style="height:35px;">
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Shipping Fee " style="width:120px;padding-top:10px;"></asp:Label>

                        </td>
                        <td>
                           <asp:Label ID="shipping" runat="server" Text="RM 0.00"  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
               <tr style="height:35px;">

                   <td>
                       <asp:Label ID="Label8" runat="server" Text="Total Amount " style="width:120px;padding-top:10px;"></asp:Label>
                   </td>
                <td>
                <asp:Label ID="amountT" runat="server" Text="RM 0.00" style="padding:20px;text-align:left;padding-top:10px;"></asp:Label>
                </td>
               </tr>
               
           </table> 
            <br />
               <asp:Button ID="btnplaceOrder" runat="server" class="btn addBtn" style=" margin-right:25%;border: 1.5px solid #333; font-weight:500; font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" Text="Place Order Now" OnClick="btnplaceOrder_Click"/>
     
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT P.Prod_Name,P.Prod_Image1,SI.Size_Details,CA.Size_ID,CA.Prod_ID,C.Cart_Total,CA.Qty,(CA.Qty * P.Prod_Price) AS amount from Product P, Cartlist CA, Size SI,Cart C where CA.Prod_ID=P.Prod_ID and CA.Cart_ID=C.CArt_ID and CA.Size_ID=SI.Size_ID and CA.Cart_ID=@cartid
">
                    <SelectParameters>
                        <asp:CookieParameter CookieName="Cart_ID" Name="cartid"></asp:CookieParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
          </div>

    </div>
  
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_showPayment" role="dialog" data-backdrop="static">
        <div class="modal-dialog" style="width:50%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Payment Method</h4>
            </div>

            <div class="modal-body" style="padding-left:5%">
                <table style="width:100%">
                <tr>
                    <td>
                <asp:Label ID="LabelCardName" runat="server" Text="Name on Card"></asp:Label><br />
                        <asp:TextBox ID="TxtCardName" runat="server" CssClass="txt1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Enabled="false" ForeColor="red" Text="*" ControlToValidate="TxtCardName"  ErrorMessage="Name is Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtCardName"  ErrorMessage="Enter a valid name" ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,50}"  SetFocusOnError="true"></asp:RegularExpressionValidator>
                    
           </td>
                    <td>
                        <asp:Label ID="LabelExpiry" runat="server" Text="Expiration"></asp:Label><br />
                        <asp:TextBox ID="TxtExpiry" runat="server"  placeholder="MM/YYYY" CssClass="txt1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Enabled="false" ForeColor="red" Text="*" ControlToValidate="TxtExpiry"  ErrorMessage="Name is Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorExpiry" runat="server" ControlToValidate="TxtExpiry"  ErrorMessage="Expiry" ValidationExpression="^(((0[1-9])|(1[0-2]))\/((2020)|(20[2][0-9]))|\((1[2])\/((2019)|(20[1][9])))$" ForeColor="red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                       
                      </td>
                </tr> 

                    <tr>
                        <td>
                            <br />
                            <asp:Label ID="LabelCreditCard" runat="server" Text="Credit Card Number"></asp:Label><br />
                            <asp:TextBox ID="TxtCreditCard" runat="server" placeholder="4123123412341234"  CssClass="txt1" onblur="UpdateLabel();" onkeyup="UpdateLabel();"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Enabled="false" ForeColor="red" Text="*" ControlToValidate="TxtCreditCard"  ErrorMessage="Name is Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Credit Card" ControlToValidate="TxtCreditCard" ValidationExpression="^((4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14}))$" ForeColor="red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                       
                            </td>
                            
                        <td>
                            <br />
                            <asp:Label ID="LabelCvv" runat="server" Text="CVV"></asp:Label><br />
                            <asp:TextBox ID="TxtCvv" runat="server" placeholder="123" CssClass="txt1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Enabled="false" ForeColor="red" Text="*" ControlToValidate="TxtCvv"  ErrorMessage="Name is Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Cvv" ControlToValidate="TxtCvv" ValidationExpression="^([0-9]{3,4})$" ForeColor="red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                             
                        </td>
                    </tr>
                </table> 
               
             </div>

            <div class="modal-footer"> 
                <asp:Button ID="Submit" runat="server" Text="Pay with Card" class="btn btn-default" OnClick="Submit_Click" />
               
            </div>
          </div>
      
        </div>
      </div>
  
    </div>


   <%-- -------------------receipt-----------------------%>
    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_showDetail" role="dialog"  data-backdrop="static">
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Receipt</h4>
            </div>

            <div class="modal-body" style="padding: 25px; margin-left: 10%;">
                Transaction ID:<asp:Label ID="trans" runat="server"></asp:Label><br />
                    Date: <asp:Label ID="date1" runat="server"></asp:Label><br /><br />

                <asp:Label ID="payID" runat="server" style="display:none"></asp:Label>
                <table class="table_showDetail" style="border-bottom:1px solid">
                    <tr style="border-bottom:1px solid">
                        <td>
                            <asp:Label ID="Label1" runat="server" style="padding-left:10px;">Product</asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" >Size</asp:Label></td>
                        <td>
                            <asp:Label ID="Label3" runat="server">Qty</asp:Label></td>
                        <td>
                            <asp:Label ID="Label5" runat="server">U\Price(RM)</asp:Label></td>
                        <td>
                            <asp:Label ID="Label4" runat="server">Amount(RM)</asp:Label></td>
                    </tr>
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                        <tr>
                         <td style="padding:10px;width:180px;"><%# Eval("Prod_Name") %></td>
                        <td style="padding:10px; width:100px"><%# Eval("Size_Details") %></td>
                       <td style="padding:10px;width:100px"><%# Eval("Qty") %></td>
                            <td style="padding:10px;width:150px"><%# Eval("Prod_Price","{0:0.00}") %></td>
                            <td style="padding:10px;width:100px"><%# Eval("num","{0:0.00}") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT PM.Pay_Date,P.Prod_Name,P.Prod_Price,PMD.Qty,S.Size_Details,(PMD.Qty * P.Prod_Price) AS num from Payment PM join Payment_Detail PMD on PMD.Pay_ID=PM.Pay_ID join Product P on P.Prod_ID=PMD.Prod_ID join Size S on S.Size_ID=PMD.Size_ID where PM.Pay_ID=@payID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="payID" PropertyName="Text" Name="payID"></asp:ControlParameter>

                        </SelectParameters>
                    </asp:SqlDataSource>
                </table>
                <br />
                <table style="margin-left:54%;">
                    <tr style="height:35px;">
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Sub Total " style="width:120px;padding-top:10px;"></asp:Label>
                        </td>
                        <td>
                        <asp:Label ID="LabelsTotal" runat="server" Text=""  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
                
                    <tr style="height:35px;">
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Shipping Fee " style="width:120px;padding-top:10px;"></asp:Label>

                        </td>
                        <td>
                                <asp:Label ID="Label12" runat="server" Text="RM 3.80"  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
               <tr style="height:35px;">

                   <td>
                       <asp:Label ID="Label13" runat="server" Text="Total Amount " style="width:120px;padding-top:10px;"></asp:Label>
                   </td>
                <td>
                <asp:Label ID="LabelTotal" runat="server" style="padding:20px;text-align:left;padding-top:10px;"></asp:Label>
                </td>
               </tr>
                
           </table> 

            </div>

            <div class="modal-footer">
                <asp:Button ID="ButtonClose" runat="server" class="btn btn-default" Text="Close" OnClick="ButtonClose_Click" />
              <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>













    <script type="text/javascript">
        function UpdateLabel() {
            var card = document.getElementById('<%=TxtCreditCard.ClientID%>').value;
            if (card.charAt(0) == '4') {
                document.getElementById('<%=Submit.ClientID%>').value = "Pay with Visa";
            }
            else if (card.charAt(0) == '5') {
                document.getElementById('<%=Submit.ClientID%>').value = "Pay with Master";
            }
            else {
                document.getElementById('<%=Submit.ClientID%>').value = "Pay with Card";
            }
        }
</script>


    <script>
        function openModal() {
            $('#modal_showPayment').modal('show');
        }
        function openReceipt() {
            $('#modal_showDetail').modal('show');
        }

        

        
    </script>


 </asp:Content> 
