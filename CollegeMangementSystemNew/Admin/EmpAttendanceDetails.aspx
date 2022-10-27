<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="EmpAttendanceDetails.aspx.cs" Inherits="CollegeMangementSystemNew.Admin.EmpAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <h3 class="text-center">Teacher Attendence Details</h3>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="ddlClass">Teachers </label>
                 <label for="ddlTeacher">Teacher</label>
                <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Teacher Is Required"
                  ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="ddlSubject">Month</label>
                <asp:TextBox ID="txtMonth" CssClass="form-control" runat ="server" TextMode="Month" required></asp:TextBox>

            </div>

            
           
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="CHECK ATTENDANCE" OnClick="btnCheckAttendance_Click" />
            </div>

        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-12">

                  <asp:GridView Id="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" 
                    AutoGenerateColumns="False">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                           <asp:BoundField DataField="Name" HeaderText="Name">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                         <%-- <asp:BoundField DataField="Status" HeaderText="Status">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>

                          <asp:TemplateField HeaderText="Status"> 
                              <ItemTemplate>
                                  <asp:Label runat="server" ID="label1" Text='<%# Boolean.Parse(Eval("Status").ToString()) ? "Present" :"Absent" %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>

                            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMMM yyyy}">
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
