<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .shop_window {
            width: 65vw;
            display: flex;
            flex-direction: column;
            padding-top: 40px;
            padding-left: 10px;
            justify-content: flex-start;
            align-items: center;
        }

        .ListTitle {
            font-size: var(--font-xxxlarge);
            color: var(--S-dark);
        }

        /*Promotion*/
        .divPromotionContainer {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom:20px;
        }

        .DataListPromotion {
            width:100%;
            display: flex;
            flex-direction: row; 
        }

        .PromotionContainer { 
            width: 45%;
        }

        /*Item(Product)*/
        .divItemList {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .divItemListContainer1 {
            width: 90%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .divSort {
            width: 90%;
            text-align: right;
            margin-bottom: 1rem;
        }

        .ddlSort {
            border-radius: 5px;
            font-size: x-large;
            width: auto;
            padding-left: 0.5rem;
            padding-right: 0.5rem;
            background-color: var(--S-light);
        }

        .divNoData {
            width: 100%;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 4rem;
            color: red;
        }

        .DataListItem {
            width: 100%;
            display: flex;
            background-color: white;
            flex-direction: row;
            flex-wrap: wrap;
            align-content: flex-start;
            justify-content: flex-start;
            align-items: flex-start;
        }

        .itemContainer {
            width: 23%;
            padding: 5px;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
        }

            .itemContainer:hover {
                background-color: var(--S-light);
            }

            .itemContainer * {
                padding-left: 2px;
                padding-right: 2px;
            }

        .imageContainer {
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .imageContainer img {
                width: 100%;
                height: 100%;
                border-radius: 5px;
                object-fit: cover;
            }

        .item_summary {
            padding-right: 2px;
        }

        .item_price {
            align-self: flex-start;
        }

        .item_price_normal {
            margin-left: 5px;
            text-decoration: line-through;
            font-style: italic;
            font-size: var(--font-small);
        }

        .item_seller {
            align-self: flex-start;
            font-size: var(--font-medium);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="shop_window">

        <%-- Promotion start --%>
        <div class="divPromotionContainer">
            <asp:Label ID="lblPromotion" CssClass="ListTitle" runat="server" Text="Promotions"></asp:Label>
            <asp:DataList ID="DataListPromotion" CssClass="DataListPromotion" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" CssClass="PromotionContainer" />
                <ItemTemplate>
                    <!--   itemContainer  -->
                    <div class="imageContainer">
                        <a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">
                            <img src="ItemImages/<%#Eval("image1") %>" alt="" /></a>
                    </div>
                    <div class="item_contents">
                        <div class="item_summary"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>"><%# Eval("Summary") %> ...</a></div>
                        <div class="item_price">
                            <span class="item_price_reduced"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">$<%# Eval("Price") %></a></span><span class="item_price_normal"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">$<%# Eval("BeforePrice") %></a></span></div>
                        <div class="item_seller"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>"><%# Eval("BrandName") %></a></div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <%-- Promotion End --%>


        <%-- Item start --%>
        <div class="divItemList">
            <div class="divItemListContainer1">
                <asp:Label ID="lblProducts" CssClass="ListTitle" runat="server" Text="Products"></asp:Label>
                <div class="divSort">
                    <asp:DropDownList ID="ddlSort" CssClass="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                        <asp:ListItem Value="category">Sort by category</asp:ListItem>
                        <asp:ListItem Value="price">Sort by price</asp:ListItem>
                        <asp:ListItem Value="name">Sort by item name</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divNoData">
                <asp:Label ID="lblNoData" runat="server" Text=""></asp:Label>
            </div>
            <asp:DataList ID="DataListItem" CssClass="DataListItem" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" CssClass="itemContainer" />
                <ItemTemplate>
                    <!--   itemContainer  -->
                    <div class="imageContainer">
                        <a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">
                            <img src="ItemImages/<%#Eval("image1") %>" alt="" /></a>
                    </div>
                    <div class="item_contents">
                        <div class="item_summary"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>"><%# Eval("Summary") %> ...</a></div>
                        <div class="item_price">
                            <span class="item_price_reduced"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">$<%# Eval("Price") %></a></span><span class="item_price_normal"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>">$<%# Eval("BeforePrice") %></a></span></div>
                        <div class="item_seller"><a href="ItemDetail.aspx?itemID=<%#Eval ("ItemID") %>"><%# Eval("BrandName") %></a></div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <%-- Promotion End --%>
    </div>
</asp:Content>


