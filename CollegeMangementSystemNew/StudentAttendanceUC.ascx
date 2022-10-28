<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUC.ascx.cs" Inherits="CollegeMangementSystemNew.StudentAttendanceUC" %>

 <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
   
        <h3 class="text-center">Student Attendence Details</h3>
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
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject Is Required"
                  ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>--%>
            </div>
        </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

             <div class="col-md-6">
                <label for="txtRollNo">Roll No </label>
                 <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" placeholder="Enter Roll No"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="RollNo Is Required"
                  ControlToValidate="txtRollNo" Display="Dynamic" ForeColor="Red"  SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtMonth">Month</label>
                 <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="Month Is Required"
                  ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red"  SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
            </div>
        </div>


                 <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendence" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="CHECK ATTENDANCE" OnClick="btnCheckAttendence_Click" />
            </div>

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

  

  

