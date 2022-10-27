<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="CollegeMangementSystemNew.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <h3 class="text-center">Add Student</h3>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="txtName">Name </label>
                 <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required></asp:TextBox>

                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be in characters" 
                     ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                 </asp:RegularExpressionValidator>
            </div>

            <div class="col-md-6">
                <label for="txtDoB">Date of Birth</label>
                <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="ddlGender">Gender </label>
                 <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">Select Gender</asp:ListItem>
                     <asp:ListItem>Male</asp:ListItem>
                     <asp:ListItem>Female</asp:ListItem>
                     <asp:ListItem>other</asp:ListItem>
                 </asp:DropDownList>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is required"
                     ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                 </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <label for="txtMobile">Contact Number</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number"  placeholder="10 Digits Mobile number" required>
                </asp:TextBox>
                
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" Invalid Mobile No " 
                     ForeColor="Red" ValidationExpression="^[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                 </asp:RegularExpressionValidator>
            </div>
        </div>

         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="txtRoll">Roll No </label>
                 <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Roll Number" required></asp:TextBox>
            </div>


                 

             <div class="col-md-6">
                <label for="ddlCourse">Course </label>
                 <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ErrorMessage="Course is Required " 
                     ControlToValidate="ddlCourse"  ForeColor="Red" Display="Dynamic" InitialValue="Select Course" SetFocusOnError="true">
                  </asp:RequiredFieldValidator>

            </div>
       
        </div>

    
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-12">
                <label for="txtAddress">Address </label>
                 <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Roll Number" TextMode="MultiLine" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="ADD STUDENT" OnClick="btnAdd_Click"/>
            </div>

        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-8">
                <asp:GridView Id="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" 
                    AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging ="GridView1_PageIndexChanging" DataKeyNames="StudentId"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" 
                    OnRowUpdating="GridView1_RowUpdating"  OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                 <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Roll Number">
                             <EditItemTemplate>
                                <asp:TextBox ID="txtRollNo" runat="server" Text='<%# Eval("RollNo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRollNo" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Course">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCourse" runat="server" Width="120px"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCourse" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True">
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
