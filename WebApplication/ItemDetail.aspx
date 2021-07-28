<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="WebApplication.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      .bodyWindow {
        margin-top: 20px;
        width:60%; 
        display: flex;
        flex-direction: column;
      }
      .upperContainer { 
        display: flex;
        justify-content: space-between;
      }
      .row { 
        display: flex;
        flex-direction: column;
        justify-content:flex-start;
      }
      .thumbImg{
        width:100px;
        opacity:0.8;
        cursor:pointer;
        border-radius:1px;
        padding-top:1px;
      }
      .thumbImg:hover{
          opacity:1;
      }
      .BigImgcontainer { 
        padding-top:5%;
      }
      .BigImg{
        width:300px;
      }
      .infoContainer { 
        width:30%;
      }
      .itemBrand{
          font-size:1.2rem;
          font-weight:500;
      }
      .itemTitle{
          font-size:1.5rem;
          font-weight:800;
      }
      .item_price_normal {
          margin-left: 5px;
          text-decoration: line-through;
          font-style: italic;
          font-size:1.4rem;
        }
      .item_price_reduced{
          font-size:2.0rem;
          font-weight:500;
      }

      .orderContainer{
          font-size:1.3rem;
          font-weight:500;
      }

      .DescContainer {
        background-color: coral;
        width:100%;
        padding:5px;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyWindow">
        <div class="upperContainer">
          <!-- The four columns four Images -->
            <div class="row">
              <div class="column">
                <asp:Image ID="objImage1" runat="server" class="thumbImg" onclick="myFunction(this);"/>            
              </div>
              <div class="column">
                <asp:Image ID="objImage2" runat="server" class="thumbImg" onclick="myFunction(this);"/>            
              </div>
              <div class="column">
                <asp:Image ID="objImage3" runat="server" class="thumbImg" onclick="myFunction(this);"/>            
              </div>
              <div class="column">
                <asp:Image ID="objImage4" runat="server" class="thumbImg" onclick="myFunction(this);"/>            
              </div>
            </div>
        <!-- Big Image Container-->
            <div class="BigImgcontainer"> 
                <asp:Image ID="expandedImg" runat="server" class="BigImg"/>  
            </div>
          <div class="infoContainer">
            <p class=itemBrand>
                <asp:Label ID="lblBrand" runat="server" Text="Label"></asp:Label></p>
            <p class=itemTitle>
                <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
            </p>
            <p class="priceContaier">
                <asp:Label id=lblPriceNormal class="item_price_normal" runat="server" Text="Label"></asp:Label>
                <asp:Label id=lblPriceReduced class="item_price_reduced" runat="server" Text="Label"></asp:Label>
            </p>
            <table class="orderContainer">           
                <tr>
                  <td class="td1">Quantity</td>
                  <td class="td2"> <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox></td>
                </tr>
                <tr>
                  <td class="td1">&nbsp;</td>
                  <td class="td2">
                      <asp:Button ID="btnCart" runat="server" Text="Add to Cart"   ValidationGroup="cart" /></td>
                </tr>
                 <tr>
                  <td colspan="2">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Please enter quantity" ControlToValidate="txtQuantity" Font-Bold="True" Font-Size="Medium" ForeColor="Red" ValidationGroup="cart"></asp:RequiredFieldValidator>
                      <br />
                      <asp:Label ID="lblMessage" runat="server" Visible="False" Font-Bold="True" Font-Size="Large" ForeColor="Red">Item Added in Cart</asp:Label>
                      <asp:ScriptManager runat="server"></asp:ScriptManager>
                      <asp:Timer ID="Timer1" runat="server" Interval="2000" Enabled="false" OnTick="Timer1_Tick"></asp:Timer>
                  </td>
            </table>
          </div>
        </div>
        <div class="DescContainer">
            <span><h2 style="color:brown">Description</h2> <br /> 
                <asp:Label ID="lblDesc" runat="server" Text="lblDesc" Font-Size="Large"></asp:Label>
                <br />
                <h2 style="color:brown">Model No</h2> :
                <asp:Label ID="lblModelNo" runat="server" Text="lblModelNo"></asp:Label>
                <br />
                <h2 style="color:brown">Brand Name</h2> :
                <asp:Label ID="lblBrandName" runat="server" Text="lblBrandName"></asp:Label>
                <br />
                <h2 style="color:brown">Warranty</h2> :
                <asp:Label ID="lblWarranty" runat="server" Text="lblWarranty"></asp:Label>
                
            </span>
        </div>
    </div>
<script>
    function myFunction(imgs) {
      var expandImg = document.getElementById("ContentPlaceHolder1_expandedImg"); 
      expandImg.src = imgs.src; 
      expandImg.parentElement.style.display = "block";
    }
</script>
</asp:Content>