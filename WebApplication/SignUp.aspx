<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .outLine{
            display:flex;
            width:65vw;
            justify-content:center;
            align-items:flex-start; 
            position:relative;
        }
        .outContainer{ 
            display:flex; 
            border-radius:5px;
            flex-direction:column;            
            justify-content:flex-start; 
            align-items:center;
            width:75%;
            margin-top:1rem;
            padding-top:3rem;
            padding-bottom:3rem;
        }
        .outContainer_Title{
            font-size: var(--font-xxxlarge); 
            font-weight:800;
            display:flex;
            justify-content: space-evenly;
            align-items:center;
        }
        .outContainer_Title:nth-child(1){   
            padding-right:4rem; 
        }
        .outContainer_Title > input {  
            width:13rem;
        }
        .ouContainer_Desc{
            margin-top:3rem; 
            font-size: var(--font-xlarge);  
            padding: 1rem;
            padding-left:2rem;
            padding-right:2rem;
            border-radius:3rem;

        }
        .outContainer2 { 
            width:80%; 
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
        } 
        
        .inputUl{ 
            width:70%;
            list-style: none; 
        }
        .inputUl > li{
            margin-bottom:1rem;
            display:flex;
            flex-direction:column;
            justify-content:flex-start;
            align-items:flex-start;
        }
        .liTitle{
            font-weight:700;
            font-size: var(--font-large);
        }
        .liDesc{
            font-size: var(--font-medium);
        }
        .liDesc{
            margin-top:1rem;
            font-size: var(--font-medium);
        }

        .required{
            font-size: var(--font-large);
            color: var(--red-color);
            font-weight:500;
        }
         .inputUl > li > input {            
            width: 15rem;
            line-height: 2rem;
            font-size: var(--font-xlarge);
            margin: 3px;
        }
        
        .inputUl > li  > div {
            display:flex;
            flex-direction:row;
            justify-content:flex-start;      
            align-items:center;
        }
         
        .btnSign {
          width: 15rem;
          line-height: 2rem;
          font-size: var(--font-xlarge); 
          margin: 3px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="outLine">  
        <div class="outContainer">
            <span class="outContainer_Title">
                 <asp:ImageButton ID="btnSignUp1" runat="server" ImageUrl="images\logo.png" OnClick="btnSignUp1_Click"/>
                <div>account</div>
            </span>
            <span class="ouContainer_Desc">About You...</span>
            <div class="outContainer2">             
                <ul class="inputUl">
                    <li>
                        <span class="liTitle">FirstName*</span>
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First name"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter your first name."></asp:RequiredFieldValidator>                           
                    </li>
                    <li>
                        <span class="liTitle">LastName*</span>
                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Last name"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required"  ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter your surname."></asp:RequiredFieldValidator>                           
                    </li>
                    <li>
                        <span class="liTitle">EmailAddress*</span>
                        <span class="liDesc">Your order confirmation will be sent here.</span>
                        <asp:TextBox ID="txtUserEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Please Enter a Valid Email"></asp:RequiredFieldValidator>                           
                    </li>
                    <li>
                        <span class="liTitle">Password*</span>
                        <span class="liDesc">Minimum 6 character long.</span>
                        <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required"  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd" ErrorMessage="Please Enter Valid Password"></asp:RequiredFieldValidator>                            
                    </li>
                    <li>
                        <span class="liTitle">Confirm Password*</span>
                        <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required"  ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmPwd" ErrorMessage="Both password and confirm password must be same."></asp:RequiredFieldValidator>                            
                    </li> 
                    <li>
                        <span class="liTitle">Phone number*</span>
                        <span class="liDesc">Phone number is required for Click & Collect delivery</span>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="e.g. 0273554811"></asp:TextBox>
                        <asp:RequiredFieldValidator class="required"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter your phone number."></asp:RequiredFieldValidator>                           
                        <span class="liDesc2">
                            Note: Occasionally we'll send SMS messages to you about exclusive offers and early notice of our flash sales! You can opt out from receiving our SMS messages in 'My Account' Settings.
                        </span>
                    </li>
                    <li>
                        <span class="liTitle">Address*</span>
                        <span class="liDesc">Please provide your residential address in order for us to process your order</span>
                        <asp:TextBox ID="txtAddress" style="width: 100%;" runat="server" placeholder="Please type your address."></asp:TextBox>
                        <asp:RequiredFieldValidator class="required"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter a valid address."></asp:RequiredFieldValidator>                           
                    </li> 
                   <li>
                        <div>                      
                            <asp:Button ID="btnSignUp" class="btnSign" runat="server" Text="Create account" OnClick="btnSignUp_Click"/>                           
                        </div>
                    </li>
                </ul>
            </div>            
        </div>
    </div>
</asp:Content>