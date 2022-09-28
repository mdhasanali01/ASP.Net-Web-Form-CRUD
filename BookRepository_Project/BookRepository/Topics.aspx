<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="BookRepository_Project.BookRepository.Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
       <style>
        .err {
            font-size: 1rem;
        }
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2 bg-light">
           <div class="col-12 border-bottom mb-3">
            <h1 class="col-12 text-center text-white bg-secondary py-2">Topics</h1>
        </div>
        <div class="col-6 border-end">
            <h2 class="col-12 text-info text-center bg-secondary">Edit & Delete</h2>
            <asp:GridView CssClass="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TopicId" DataSourceID="dsTopics" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="TopicId" HeaderText="TopicId" InsertVisible="False" ReadOnly="True" SortExpression="TopicId" />
                    <asp:TemplateField HeaderText="TopicName" >
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("TopicName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Topic Name Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TopicName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="gv-ed" CssClass="btn btn-success btn-sm" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save2-fill"></i> Update</asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm " ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x-square-fill"></i> Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm " ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="bi bi-pen-fill"></i> Edit</asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash3-fill"></i> Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsTopics" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Topics]" DeleteCommand="DELETE FROM [Topics] WHERE [TopicId] = @TopicId" InsertCommand="INSERT INTO [Topics] ([TopicName]) VALUES (@TopicName)" UpdateCommand="UPDATE [Topics] SET [TopicName] = @TopicName WHERE [TopicId] = @TopicId">
                <DeleteParameters>
                    <asp:Parameter Name="TopicId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TopicName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TopicName" Type="String" />
                    <asp:Parameter Name="TopicId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
         </div>
          <div class="col-6 border-end">
            <h2 class="col-12 text-info text-center bg-secondary">Add Topics</h2>
              <asp:FormView Width="100%" ID="FormView1" runat="server" DefaultMode="Insert" DataKeyNames="TopicId" DataSourceID="dsTopics">                                    
                  <InsertItemTemplate>
                       <div class="form-group row">
                           <asp:Label class="col-form-label col-form-label-sm col-3" runat="server"> Topic Name :</asp:Label>
                           <div class="col-9">
                               <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="TextBox2" runat="server" Text='<%# Bind("TopicName") %>' />
                               <asp:RequiredFieldValidator ValidationGroup="fv-in" ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Topic Name Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                           </div>
                        </div> 
                        <div class="col offset-3 px-1">
                      <asp:LinkButton ID="InsertButton" CssClass="btn btn-success btn-sm" ValidationGroup="fv-in" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"><i class="bi bi-plus-square"></i> Insert</asp:LinkButton>
                      &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-secondary btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x-square"></i> Cancel</asp:LinkButton>
                            </div>
                  </InsertItemTemplate>                                   
              </asp:FormView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Topics]"></asp:SqlDataSource>
         </div>
    </div>
</asp:Content>
