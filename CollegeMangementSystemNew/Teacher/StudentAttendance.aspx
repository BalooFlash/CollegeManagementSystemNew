<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMst.Master" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="CollegeMangementSystemNew.Teacher.StudentAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="width:100%;height:600px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <div class="ml-auto text-right">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                    <asp:Label ID="lblTime" runat="server" Font-Bold="true"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
        <h3 class="text-center">Student Attendence</h3>
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
        </div>

                 <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="SUBMIT" OnClick="btnSubmit_Click" />
            </div>

       </div>

           
        </div>

     

          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                    EmptyDataText="No Record to display">
                    <Columns>
                       
                        <asp:TemplateField HeaderText="Course">
                            <ItemTemplate>
                              <div class="form-check form-check-inline">
                                  <asp:RadioButton ID="RadioButton1" runat="server" Text="Present" Checked="true" GroupName="attendance" CssClass="form-check-input"/>
                              </div>
                                <div class="form-check form-check-inline">
                                  <asp:RadioButton ID="RadioButton2" runat="server" Text="Absent"  GroupName="attendance" CssClass="form-check-input"/>
                              </div>

                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                      
                    </Columns>
                    <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                </asp:GridView>
            </div>

        </div>
          <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-lg-4 col-xl-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnMarkAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="MARK ATTENDANCE" OnClick="btnMarkAttendance_Click" />
            </div>

        </div>

  

    </div>
       </div>


</asp:Content>
