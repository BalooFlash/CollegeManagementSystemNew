using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CollegeMangementSystemNew.Models.CommonFn;

namespace CollegeMangementSystemNew.Admin
{
    public partial class Student : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetClass();
                GetStudents();

            }

        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlCourse.DataSource = dt;
            ddlCourse.DataTextField = "ClassName";
            ddlCourse.DataValueField = "ClassId";
            ddlCourse.DataBind();
            ddlCourse.Items.Insert(0, "Select Course");

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string rollNo = txtRoll.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Student where ClassId='"+ddlCourse.SelectedValue+"' and RollNo ='" + rollNo + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Student values('" + txtName.Text.Trim() + "','" + txtDoB.Text.Trim() + "','" +
                            ddlGender.SelectedValue + "','" + txtMobile.Text.Trim() + "','" + txtRoll.Text.Trim() + "','" +
                            txtAddress.Text.Trim() + "','" + ddlCourse.SelectedValue + "')";

                        fn.Query(query);
                        lblMsg.Visible = true;
                        lblMsg.Text = "Inserted Successfully";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtRoll.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        ddlCourse.SelectedIndex = 0;
                        GetStudents();
                    }
                    else
                    {
                        lblMsg.Visible = true;

                        lblMsg.Text = "Entered <b>'" + rollNo + "'</b> Already exists!!";
                        lblMsg.CssClass = "alert alert-danger";

                    }
                }
                else
                {
                    lblMsg.Text = "Gender is Required";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'</script>");

            }

        }

        private void GetStudents()
        {

            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1))as [Sr.No], s.StudentId,s.[Name], s.DOB, s.Gender, s.Mobile,
                                   s.RollNo, s.[Address],c.ClassId,c.ClassName from Student s inner join Class c on c.ClassId=s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            GetStudents();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetStudents();


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetStudents();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
                string rollNo = (row.FindControl("txtRollNo") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("ddlCourse")).SelectedValue;
                fn.Query("Update Student set Name='" + name.Trim() + "', Mobile='" + mobile + "', Address='" + address.Trim() +
                         "', RollNo='" + rollNo.Trim() + "',ClassId='"+classId+ "'where StudentId='" + studentId + "'");
                lblMsg.Visible = true;
                lblMsg.Text = "Updated Successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetStudents();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
                    DropDownList ddlCourse = (DropDownList)e.Row.FindControl("ddlCourse");
                    DataTable dt = fn.Fetch("Select * from Class");
                    ddlCourse.DataSource = dt;
                    ddlCourse.DataTextField = "ClassName";
                    ddlCourse.DataValueField = "ClassId";
                    ddlCourse.DataBind();
                    ddlCourse.Items.Insert(0, "Select Class");
                    string selectedClass = DataBinder.Eval(e.Row.DataItem,"ClassName").ToString();
                    ddlCourse.Items.FindByText(selectedClass).Selected = true;

                
            }
        }
    }
}