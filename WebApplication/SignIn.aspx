<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="WebApplication.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .outLine {
            display: flex;
            width: 65vw;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .loginContainer {
            position: absolute;
            top: 10vh;
            display: flex;
            background-color: var(--S-light);
            border-radius: 5px;
            flex-direction: column;
            justify-content: space-evenly;
            width: 60%;
            height: 50vh;
        }

        .loginContainer_Title {
            font-size: var(--font-xxxlarge);
            align-self: center;
        }

        .loginContainer_Desc {
            font-size: var(--font-xlarge);
        }

        .lblAlert {
            font-weight: 900;
            color: var(--red-color);
            background-color: var(--Secondary);
            padding-left: 1rem;
            padding-right: 1rem;
            border-radius: 5px;
        }

        .loginContainer2 {
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

            .loginContainer2 i {
                font-size: 4rem;
                align-self: center;
            }


        .inputUl {
            list-style: none;
            line-height: 1rem;
        }

            .inputUl > li > input {
                width: 15rem;
                line-height: 2rem;
                font-size: var(--font-xlarge);
                margin: 3px;
            }

            .inputUl > li > div {
                display: flex;
                flex-direction: row;
                justify-content: flex-start;
                align-items: center;
            }

        .btnSign {
            width: 7.5rem;
            line-height: 2rem;
            font-size: var(--font-xlarge);
            margin: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="outLine">
        <div class="loginContainer">
            <span class="loginContainer_Title">Welcome Back!</span>
            <span class="loginContainer_Desc">
                <center> Login to access your orders, wishlist and coupons</center>
                <br />
                <center> <asp:Label ID="lblAlert" class="lblAlert" runat="server" Text=""></asp:Label></center>
            </span>

            <div class="loginContainer2">
                <i class="fas fa-sign-in-alt"></i>
                <ul class="inputUl"> 
                    <li>
                        <asp:TextBox ID="txtUserEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Please Enter Valid Email" Text="*" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd" ErrorMessage="Please Enter Valid Password" Text="*" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <div>
                            <asp:Button ID="btnSignIn" class="btnSign" runat="server" Text="Sign In" OnClick="btnSignIn_Click" ValidationGroup="SignIn" />
                            <asp:Button ID="btnSignUp" class="btnSign" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                        </div>
                    </li>
                    <li>
                        <a href="Forgot.aspx">* Forgot password</a>
                    </li>
                    <li>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="SignIn" />
                    </li>
                </ul>

            </div>

        </div>
    </div>
</asp:Content>
