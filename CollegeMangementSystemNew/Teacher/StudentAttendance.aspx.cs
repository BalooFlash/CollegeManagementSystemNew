using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CollegeMangementSystemNew.Models.CommonFn;

namespace CollegeMangementSystemNew.Teacher
{
    public partial class StudentAttendance : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetClass();
                btnMarkAttendance.Visible = false;
            }

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
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

      
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + classId + "'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Subject");
        }
     
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataTable dt = fn.Fetch(@"Select StudentId,RollNo,Name, Mobile from Student where ClassId='"+ddlClass.SelectedValue+"' ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if(dt.Rows.Count>0)
            {
                btnMarkAttendance.Visible = true;
            }
            else
            {
                btnMarkAttendance.Visible = false;
            }
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            bool isTrue = false;
            foreach (GridViewRow row in GridView1.Rows)
            {
                string rollNo = row.Cells[2].Text.Trim();

                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                int status = 0;
                if (rb1.Checked)
                {
                    status = 1;
                }
                else if (rb2.Checked)
                {
                    status = 0;
                }
                fn.Query("Insert into StudentAttendence values('" + ddlClass.SelectedValue + "','" + ddlSubject.SelectedValue + "','" + rollNo + "','" + status + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "')");
                isTrue = true;
               
            }
            if(isTrue)

            {
                lblMsg.Visible = true;
                lblMsg.Text = "Insereted successfully";
                lblMsg.CssClass = "alert alert-success";
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "something went wrong";
                lblMsg.CssClass = "alert alert-warning";
            }
        }
    }
}