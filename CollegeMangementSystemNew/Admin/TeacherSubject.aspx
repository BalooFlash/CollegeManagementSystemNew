<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="CollegeMangementSystemNew.Admin.TeacherSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <h3 class="text-center">Add Teacher Subject</h3>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="ddlClass">Course </label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true"
                     OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="Course Is Required"
                  ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Course" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="ddlSubject">Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject Is Required"
                  ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>

             <div class="col-md-6">
                <label for="ddlTeacher">Teacher</label>
                <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Teacher Is Required"
                  ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>
           
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="ASSIGN SUBJECT" OnClick="btnAdd_Click" />
            </div>

        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-12">
                <asp:GridView Id="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" 
                    AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging ="GridView1_PageIndexChanging" 
                    DataKeyNames="Id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" 
                    OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Course">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlClassGV" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName"
                                    DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' AutoPostBack="true" OnSelectedIndexChanged="ddlClassGV_SelectedIndexChanged">
                                    <asp:ListItem>Select Course</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeCS %>"
                                    SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Subject">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSubjectGV" runat="server" ></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Teacher">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlTeacherGV" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name"
                                    DataValueField="TeacherId" SelectedValue='<%# Eval("TeacherId") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeCS %>"
                                    SelectCommand="SELECT [TeacherId], [Name] FROM [Teacher]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True" ShowDeleteButton="true">
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
