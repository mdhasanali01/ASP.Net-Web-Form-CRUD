<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="BookRepository_Project.BookRepository.Authors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
     <style>
        .err {
            font-size:.75rem;
        }
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2 bg-light">
        <div class="col-12 border-bottom mb-3">
            <h1 class="col-12 text-center text-white py-2 bg-secondary">Authors</h1>
        </div>
        <div class="col-6 border-end">
            <h2 class="col-12 text-info text-center bg-secondary">Edit & Delete</h2>
           
            <asp:GridView CssClass="table table-bordered" ID="gvAuthors" runat="server" AutoGenerateColumns="False" DataKeyNames="AuthorId" DataSourceID="dsAuthors" AllowPaging="True" AllowSorting="True" OnRowDataBound="gvAuthors_RowDataBound">
                <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:BoundField DataField="AuthorId" HeaderText="Author Id" InsertVisible="False" ReadOnly="True" SortExpression="AuthorId" />
                    <asp:TemplateField HeaderText="Author Name">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("Authorname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Author Name Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Authorname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="gv-ed" CssClass="btn btn-success btn-sm " ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save-fill"> Update</i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-secondary btn-sm rounded-1" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm rounded-2" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="bi bi-pencil"></i> Edit</asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm rounded-2" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"> Delete</i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>"
                DeleteCommand="DELETE FROM [Authors] WHERE [AuthorId] = @AuthorId" 
                InsertCommand="INSERT INTO [Authors] ([Authorname]) VALUES (@Authorname)" 
                SelectCommand="SELECT * FROM [Authors]" 
                UpdateCommand="UPDATE [Authors] SET [Authorname] = @Authorname WHERE [AuthorId] = @AuthorId">
                <DeleteParameters>
                    <asp:Parameter Name="AuthorId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Authorname" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Authorname" Type="String" />
                    <asp:Parameter Name="AuthorId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
         <div class="col-6">
            <h2 class="col-12 text-info text-center bg-secondary">Add Author</h2>
             <asp:FormView  Width="100%" ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="AuthorId" DataSourceID="dsAuthors">
                 <EditItemTemplate>
                     AuthorId:
                     <asp:Label ID="AuthorIdLabel1" runat="server" Text='<%# Eval("AuthorId") %>' />
                     <br />
                     Authorname:
                     <asp:TextBox ID="AuthornameTextBox" runat="server" Text='<%# Bind("Authorname") %>' />
                     <br />
                     <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                     &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <div class="form-group row">
                         <asp:Label class="col-form-label col-form-label-sm col-3" runat="server">Author Name :</asp:Label>
                         <div class="col-9">
                             <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="AuthornameTextBox" runat="server" Text='<%# Bind("Authorname") %>' />
                             <asp:RequiredFieldValidator ValidationGroup="fv-in" ControlToValidate="AuthornameTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Author Name Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                    
                     
                     
                     <div class="col-12">
                       <div class="col offset-3 px-1">
                     <asp:LinkButton ValidationGroup="fv-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-person-plus-fill"></i> Insert</asp:LinkButton>
                     &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x-circle"></i> Cancel</asp:LinkButton>
                           </div>
                         </div>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     AuthorId:
                     <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                     <br />
                     Authorname:
                     <asp:Label ID="AuthornameLabel" runat="server" Text='<%# Bind("Authorname") %>' />
                     <br />
                     <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                     &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                 </ItemTemplate>
             </asp:FormView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
        </div>
           </div>
</asp:Content>
