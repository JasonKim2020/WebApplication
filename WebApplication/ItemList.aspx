<%@ Page Title="" Language="C#" MasterPageFile="~/StaffSiteMaster.Master" AutoEventWireup="true" CodeBehind="ItemList.aspx.cs" Inherits="WebApplication.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .auto-style1 {
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: flex-start; 
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
     

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">  
        <div class="outContainer">
            <div class="outContainer_Title">
                  Item list to Edit and Delete
            </div>
            <div class="ListViewClass">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemID" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <li style="background-color: #FAFAD2;color: #284775;">ItemID:
                            <asp:Label ID="ItemIDLabel" runat="server" Text='<%# Eval("ItemID") %>' />
                            <br />
                            CategoryID:
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                            <br />
                            Price:
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            <br />
                            BeforePrice:
                            <asp:Label ID="BeforePriceLabel" runat="server" Text='<%# Eval("BeforePrice") %>' />
                            <br />
                            Title:
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                            <br />
                            Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            ModelNo:
                            <asp:Label ID="ModelNoLabel" runat="server" Text='<%# Eval("ModelNo") %>' />
                            <br />
                            BrandName:
                            <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                            <br />
                            stock:
                            <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            Warranty:
                            <asp:Label ID="WarrantyLabel" runat="server" Text='<%# Eval("Warranty") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </li>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <li style="background-color: #FFCC66;color: #000080;">ItemID:
                            <asp:Label ID="ItemIDLabel1" runat="server" Text='<%# Eval("ItemID") %>' />
                            <br />
                            CategoryID:
                            <asp:TextBox ID="CategoryIDTextBox" runat="server" Textmode="Number" Text='<%# Bind("CategoryID") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DescriptionTextBox" runat="server" ErrorMessage="* Please enter category ID" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            Price:
                            <asp:TextBox ID="PriceTextBox" runat="server" TextMode="Number" step="0.01" Text='<%# Bind("Price") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="* Please enter price" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            BeforePrice:
                            <asp:TextBox ID="BeforePriceTextBox" runat="server" TextMode="Number" step="0.01" Text='<%# Bind("BeforePrice") %>' />
                            <br />
                            Title:
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TitleTextBox" runat="server" ErrorMessage="* Please enter title" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            Description:                            
                            <br />                            
                            <asp:TextBox ID="DescriptionTextBox" style="width:80%;" runat="server" Text='<%# Bind("Description") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DescriptionTextBox" runat="server" ErrorMessage="* Please enter description" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            ModelNo:
                            <asp:TextBox ID="ModelNoTextBox" runat="server" Text='<%# Bind("ModelNo") %>' />
                            <br />
                            BrandName:
                            <asp:TextBox ID="BrandNameTextBox" runat="server" Text='<%# Bind("BrandName") %>' />
                            <br />
                            stock:
                            <asp:TextBox ID="stockTextBox" runat="server" Text='<%# Bind("stock") %>' TextMode="Number" step="1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="stockTextBox" runat="server" ErrorMessage="* Please enter stock" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            Warranty:
                            <asp:TextBox ID="WarrantyTextBox" runat="server" Text='<%# Bind("Warranty") %>' />                            
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </li>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <li style="">CategoryID:
                            <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                            <br />Price:
                            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                            <br />BeforePrice:
                            <asp:TextBox ID="BeforePriceTextBox" runat="server" Text='<%# Bind("BeforePrice") %>' />
                            <br />Title:
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                            <br />Description:
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                            <br />ModelNo:
                            <asp:TextBox ID="ModelNoTextBox" runat="server" Text='<%# Bind("ModelNo") %>' />
                            <br />BrandName:
                            <asp:TextBox ID="BrandNameTextBox" runat="server" Text='<%# Bind("BrandName") %>' />
                            <br />stock:
                            <asp:TextBox ID="stockTextBox" runat="server" Text='<%# Bind("stock") %>' />
                            <br />Warranty:
                            <asp:TextBox ID="WarrantyTextBox" runat="server" Text='<%# Bind("Warranty") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </li>
                    </InsertItemTemplate>
                    <ItemSeparatorTemplate>
<br />
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <li style="background-color: #FFFBD6;color: #333333;">ItemID:
                            <asp:Label ID="ItemIDLabel" runat="server" Text='<%# Eval("ItemID") %>' />
                            <br />
                            CategoryID:
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                            <br />
                            Price:
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            <br />
                            BeforePrice:
                            <asp:Label ID="BeforePriceLabel" runat="server" Text='<%# Eval("BeforePrice") %>' />
                            <br />
                            Title:
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                            <br />
                            Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            ModelNo:
                            <asp:Label ID="ModelNoLabel" runat="server" Text='<%# Eval("ModelNo") %>' />
                            <br />
                            BrandName:
                            <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                            <br />
                            stock:
                            <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            Warranty:
                            <asp:Label ID="WarrantyLabel" runat="server" Text='<%# Eval("Warranty") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                        <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">ItemID:
                            <asp:Label ID="ItemIDLabel" runat="server" Text='<%# Eval("ItemID") %>' />
                            <br />
                            CategoryID:
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                            <br />
                            Price:
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            <br />
                            BeforePrice:
                            <asp:Label ID="BeforePriceLabel" runat="server" Text='<%# Eval("BeforePrice") %>' />
                            <br />
                            Title:
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                            <br />
                            Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            ModelNo:
                            <asp:Label ID="ModelNoLabel" runat="server" Text='<%# Eval("ModelNo") %>' />
                            <br />
                            BrandName:
                            <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                            <br />
                            stock:
                            <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            Warranty:
                            <asp:Label ID="WarrantyLabel" runat="server" Text='<%# Eval("Warranty") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </li>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbGoShopConnectionString %>" DeleteCommand="DELETE FROM [tblItem] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [tblItem] ([CategoryID], [Price], [BeforePrice], [Title], [Description], [ModelNo], [BrandName], [stock], [Warranty]) VALUES (@CategoryID, @Price, @BeforePrice, @Title, @Description, @ModelNo, @BrandName, @stock, @Warranty)" SelectCommand="SELECT [ItemID], [CategoryID], [Price], [BeforePrice], [Title], [Description], [ModelNo], [BrandName], [stock], [Warranty] FROM [tblItem] ORDER BY [ItemID] DESC" UpdateCommand="UPDATE [tblItem] SET [CategoryID] = @CategoryID, [Price] = @Price, [BeforePrice] = @BeforePrice, [Title] = @Title, [Description] = @Description, [ModelNo] = @ModelNo, [BrandName] = @BrandName, [stock] = @stock, [Warranty] = @Warranty WHERE [ItemID] = @ItemID">
                    <DeleteParameters>
                        <asp:Parameter Name="ItemID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BeforePrice" Type="Decimal" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ModelNo" Type="String" />
                        <asp:Parameter Name="BrandName" Type="String" />
                        <asp:Parameter Name="stock" Type="Int32" />
                        <asp:Parameter Name="Warranty" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BeforePrice" Type="Decimal" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ModelNo" Type="String" />
                        <asp:Parameter Name="BrandName" Type="String" />
                        <asp:Parameter Name="stock" Type="Int32" />
                        <asp:Parameter Name="Warranty" Type="String" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div> 
    </div>
</asp:Content>