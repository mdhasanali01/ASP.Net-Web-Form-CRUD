<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublisherUserControl.ascx.cs" Inherits="BookRepository_Project.BookRepository.PublisherUserControl" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="Publisherid" DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem">
                   <EditItemTemplate>
                       <tr style="">
                           <td>
                               <asp:Button CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                               <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                           </td>
                           <td>
                               <asp:Label ID="PublisheridLabel1" runat="server" Text='<%# Eval("Publisherid") %>' />
                           </td>
                            <td>
                               <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="PublisherNameTextBox" Display="Dynamic"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Publisher Name Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                           </td>
                           <td>
                               <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="AddressTextBox" Display="Dynamic"  ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                           </td>
                           <td>
                               <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="gi" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="EmailTextBox" CssClass="text-danger err" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email required"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ValidationGroup="gi" CssClass="text-danger err" ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email"></asp:RegularExpressionValidator>
                           </td>
                       </tr>
                   </EditItemTemplate>
                   <EmptyDataTemplate>
                       <table runat="server" style="">
                           <tr>
                               <td>No data was returned.</td>
                           </tr>
                       </table>
                   </EmptyDataTemplate>
                   <InsertItemTemplate>
                       <tr style="">
                           <td>
                               <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                               <asp:Button CssClass="btn btn-secondary btn-sm"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                           </td>
                           <td>[Auto]</td>
                           <td>
                               <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="PublisherNameTextBox" Display="Dynamic"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Publisher Name Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                           </td>
                           <td>
                               <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="AddressTextBox" Display="Dynamic"  ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                           </td>
                           <td>
                               <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="gi" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="EmailTextBox" CssClass="text-danger err" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email required"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ValidationGroup="gi" CssClass="text-danger err" ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email"></asp:RegularExpressionValidator>
                           </td>
                       </tr>
                   </InsertItemTemplate>
                   <ItemTemplate>
                       <tr style="">
                           <td>
                               <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                               <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                           </td>
                           <td>
                               <asp:Label ID="PublisheridLabel" runat="server" Text='<%# Eval("Publisherid") %>' />
                           </td>
                           <td>
                               <asp:Label ID="PublisherNameLabel" runat="server" Text='<%# Eval("PublisherName") %>' />
                           </td>
                           <td>
                               <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                           </td>
                           <td>
                               <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                           </td>
                       </tr>
                   </ItemTemplate>
                   <LayoutTemplate>
                       <table runat="server" class="table table-bordered">
                           <tr runat="server">
                               <td runat="server">
                                   <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                       <tr runat="server" style="">
                                           <th runat="server"></th>
                                           <th runat="server">Publisherid</th>
                                           <th runat="server">PublisherName</th>
                                           <th runat="server">Address</th>
                                           <th runat="server">Email</th>
                                       </tr>
                                       <tr id="itemPlaceholder" runat="server">
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr runat="server">
                               <td runat="server" style="">
                                   <asp:DataPager ID="DataPager1" PageSize="5" runat="server">
                                       <Fields>
                                           <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                       </Fields>
                                   </asp:DataPager>
                               </td>
                           </tr>
                       </table>
                   </LayoutTemplate>

               </asp:ListView>
               <asp:SqlDataSource ID="dsPublishers" runat="server" ConnectionString="<%$ ConnectionStrings:db %>"
                   DeleteCommand="DELETE FROM [Publishers] WHERE [Publisherid] = @Publisherid" 
                   InsertCommand="INSERT INTO [Publishers] ([PublisherName], [Address], [Email]) VALUES (@PublisherName, @Address, @Email)" 
                   SelectCommand="SELECT * FROM [Publishers]" 
                   UpdateCommand="UPDATE [Publishers] SET [PublisherName] = @PublisherName, [Address] = @Address, [Email] = @Email WHERE [Publisherid] = @Publisherid">
                   <DeleteParameters>
                       <asp:Parameter Name="Publisherid" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="PublisherName" Type="String" />
                       <asp:Parameter Name="Address" Type="String" />
                       <asp:Parameter Name="Email" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="PublisherName" Type="String" />
                       <asp:Parameter Name="Address" Type="String" />
                       <asp:Parameter Name="Email" Type="String" />
                       <asp:Parameter Name="Publisherid" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>
               <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                   DataObjectTypeName="BookRepository_Project.BLL.PublisherDTO" 
                   DeleteMethod="Delete" InsertMethod="Insert" 
                   SelectCountMethod="PublisherCount" 
                   SelectMethod="GetAll" TypeName="BookRepository_Project.BLL.PublisherRepo" 
                   UpdateMethod="Update"></asp:ObjectDataSource>