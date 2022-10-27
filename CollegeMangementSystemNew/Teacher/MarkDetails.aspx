<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMst.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="CollegeMangementSystemNew.Teacher.MarkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <h3 class="text-center">Mark Details</h3>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="ddlClass">Course </label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="Class Is Required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Course" SetFocusOnError="True">

                 </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <label for="txtRoll">Student Roll Number</label>
                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Roll Number" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="GET MARKS" OnClick="btnAdd_Click" /> 
            </div>

        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-8">
                <asp:GridView Id="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" 
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="8" OnPageIndexChanging ="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                            <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ClassName" HeaderText="Course">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="RollNo" HeaderText="Roll No">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                       
                        <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="OutOfMarks" HeaderText="Out Of Marks">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

    
                    </Columns>
                     <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                </asp:GridView>
               
            </div>

        </div>


    </div>

    </div>


</asp:Content>
