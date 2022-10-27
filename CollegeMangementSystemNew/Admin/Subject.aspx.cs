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
    public partial class Subject : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetSubject();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Course");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClass.SelectedItem.Value +
                    "'and SubjectName='"+txtSubject.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Subject values('" + ddlClass.SelectedItem.Value + "','" + txtSubject.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Visible = true;
                    lblMsg.Text = "Inserted Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtSubject.Text = string.Empty;
                    GetSubject();

                }
                else
                {
                    lblMsg.Visible = true;

                    lblMsg.Text = "Entered Subject Already exsits for<b>'" + classVal + "'";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'</script>");

            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() over(Order by(Select 1)) as[Sr.No],s.SubjectId ,s.ClassId,c.ClassName,
                                    s.SubjectName from Subject s inner join Class c on c.ClassId=s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetSubject();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subjName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Subject set ClassId='" + classId.Trim() + "', SubjectName='"+subjName+"'where SubjectId='" + subjectId + "'");
                lblMsg.Visible = true;
                lblMsg.Text = "Updated Successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'</script>");
            }
        }
    }
}