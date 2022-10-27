<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="CollegeMangementSystemNew.Admin.MarkDetails" %>
<%@ Register Src="~/MarksDetailUserControl.ascx" TagPrefix="uc" TagName="MarkDetails"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <uc:MarkDetails runat="server" ID="MarkDetails1" />
    

</asp:Content>
