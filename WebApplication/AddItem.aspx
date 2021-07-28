<%@ Page Title="" Language="C#" MasterPageFile="~/StaffSiteMaster.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="WebApplication.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .auto-style1 {
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: flex-start;
        }

        /* .AAoutLine{
            display:flex;
            width:70vw;
            justify-content:center;
            align-items:flex-start; 
            position:relative;
        } */
        .outContainer {
            display: flex;
            border-radius: 5px;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            width: 90%;
            margin-top: 1rem;
            padding-top: 3rem;
            padding-bottom: 3rem;
        }

        .outContainer_Title {
            font-size: var(--font-xxxlarge);
            height:5rem;
            font-weight: 800;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

            .outContainer_Title:nth-child(1) {
                padding-right: 4rem;
            }

            .outContainer_Title > input {
                width: 13rem;
            }

        .ouContainer_Desc {
            margin-top: 3rem;
            text-align: center;
            font-size: var(--font-xlarge);
            padding: 1rem;
            padding-left: 2rem;
            padding-right: 2rem;
            border-radius: 3rem;
        }

        .outContainer2 {
            width: 90%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .imageContainer {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .img {
            width: 8rem;
            margin: 5px;
        }

        .lblAlert {
            color: var(--red-color);
            font-size: var(--font-large);
        }

        .btnSubmit {
            width: 15rem;
            line-height: 2rem;
            font-size: var(--font-xlarge);
            margin: 3px;
        }

        table {
            width: 90%;
            background-color: blanchedalmond;
            padding: 5px;
        }

        .auto-style2 {
            height: 20px;
        }

        .auto-style3 {
            width: 207px;
        }

        .auto-style4 {
            height: 20px;
            width: 207px;
        }

        .auto-style5 {
            width: 400px;
        }

        .auto-style6 {
            height: 20px;
            width: 243px;
        }

        .td3 {
            width: 500px;
        }

            .td3 > * {
                margin-left: 5px;
            }

        td > input {
            width:90%;
            font-size:large;
        }

        .oddRow{
            background-color:var(--S-light);
            border-radius:20px;
        }
        .evenRow{
            /*background-color:var(--P-light);*/
        }
    </style>
</asp:Content>
<%-- https://themarket.com/nz/p/la-roche-posay-anthelios-invisible-fluid-facial-sunscreen-spf50-50ml/5129-ANTH11 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        <div class="outContainer">
            <span class="outContainer_Title">Add new product / promotion
            </span>
            <div class="outContainer2">
                <table>
                    <tr class="oddRow">
                        <td class="auto-style3">Category
                        </td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="ddlCategoryID" Style="width: 90%;font-size:large;" runat="server" DataSourceID="SqlDataSource2" DataTextField="CodeDesc" DataValueField="Code">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbGoShopConnectionString %>" SelectCommand="SELECT [CodeDesc], [Code] FROM [tblCode] WHERE ([Sector] = @Sector)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="10" Name="Sector" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr class="evenRow">
                        <td style="font-size:large" class="auto-style3">Product / Promotion
                        </td>
                        <td class="auto-style5" >
                            <asp:DropDownList ID="ddlItemPromotion" Style="width: 90%;font-size:large;" runat="server" >
                                <asp:ListItem Value="product">Product</asp:ListItem>
                                <asp:ListItem Value="promotion">Promotion</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr class="oddRow">
                        <td class="auto-style3">Item Title</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtItemTitle" runat="server"></asp:TextBox>
                        </td>
                        <td class="td3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemTitle" ErrorMessage="* Please enter item title." Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="evenRow">
                        <td class="auto-style4">Description</td>
                        <td class="auto-style6" colspan="2">
                            <asp:TextBox ID="txtDesc" Style="height: 30rem; width: 100%;" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="* Please enter description" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="oddRow">
                        <td class="auto-style3">
                        Model No
                        <td class="auto-style5">
                            <asp:TextBox ID="txtModelNo" runat="server"></asp:TextBox>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr class="evenRow">
                        <td class="auto-style3">Brand Name</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtBrandName" runat="server"></asp:TextBox>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr class="oddRow">
                        <td class="auto-style3">PricePrice_Current</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtPrice_Current" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
                        </td>
                        <td class="td3" style="width: 200px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice_Current" ErrorMessage="* Please enter current price." Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="evenRow">
                        <td class="auto-style3">
                        Price_Before
                        <td class="auto-style5">
                            <asp:TextBox ID="txtPrice_Before" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr class="oddRow">
                        <td class="auto-style3">Image</td>
                        <td class="auto-style5">
                            <asp:FileUpload runat="server" ID="fuImages" AllowMultiple="true" />
                            <asp:Button runat="server" ID="btnUploadImages" Text="Upload" OnClick="btnUploadImages_Click" ValidationGroup="UploadImage" />
                        </td>
                        <td class="td3">
                            <asp:Label ID="listofuploadedfiles" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="td3"></td>
                    </tr> 
                    <tr>
                        <td class="auto-style3">Stock in No</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr  class="oddRow">
                        <td class="auto-style3">Warranty Policy</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtWarranty" runat="server"></asp:TextBox>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style5">
                            <asp:Button ID="btnSubmit" class="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_Click" Style="width: 100%" /></td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style5">
                            <asp:Label ID="lblAlert" class="lblAlert" runat="server" Text=""></asp:Label>
                        <td class="td3"></td>
                    </tr>
                </table>
                <div class="imageContainer">
                    <asp:Image ID="objImage1" class="img" runat="server" />
                    <asp:Image ID="objImage2" class="img" runat="server" />
                    <asp:Image ID="objImage3" class="img" runat="server" />
                    <asp:Image ID="objImage4" class="img" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
