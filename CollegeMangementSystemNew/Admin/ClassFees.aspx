<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="CollegeMangementSystemNew.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <h3 class="text-center">New Fees</h3>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="ddlClass">Course </label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="Class Is Required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Course" SetFocusOnError="True">

                 </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <label for="txtFeesAmount">Fee(Annual)</label>
                <asp:TextBox ID="txtFeesAmount" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="ADD FEES" OnClick="btnAdd_Click" /> 
            </div>

        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-12">
                <asp:GridView Id="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" 
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="4" OnPageIndexChanging ="GridView1_PageIndexChanging" DataKeyNames="FeesId"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                    OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ClassName" HeaderText="Course" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Fees(Annual)">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                     <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                </asp:GridView>
               
            </div>

        </div>


    </div>

    </div>
</asp:Content>
