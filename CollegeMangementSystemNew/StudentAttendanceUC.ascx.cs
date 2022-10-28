using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CollegeMangementSystemNew.Models.CommonFn;

namespace CollegeMangementSystemNew
{
    public partial class StudentAttendanceUC : System.Web.UI.UserControl
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                GetClass();
                
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

        protected void btnCheckAttendence_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date = Convert.ToDateTime(txtMonth.Text);
            if(ddlSubject.SelectedValue=="Select Subject")
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() over(Order by(Select 1)) as [Sr.No],s.Name, sa.Status,sa.Date from StudentAttendence sa
                                    inner join Student s on s.RollNo = sa.RollNo where sa.ClassId='"+ddlClass.SelectedValue+"' and " +
                                    "sa.RollNo ='"+txtRollNo.Text.Trim()+"' and DATEPART(yy, Date) ='" + date.Year + "' and " +
                                    "DATEPART(M, Date)= '" + date.Month + "' and sa.Status= 1");
            }
            else
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() over(Order by(Select 1)) as [Sr.No],s.Name, sa.Status,sa.Date from StudentAttendence sa
                                    inner join Student s on s.RollNo = sa.RollNo where sa.ClassId='" + ddlClass.SelectedValue + "' and " +
                                   "sa.RollNo ='" + txtRollNo.Text.Trim() + "' and sa.SubjectId='"+ddlSubject.SelectedValue+"'and DATEPART(yy, Date) ='" + date.Year + "' and " +
                                   "DATEPART(M, Date)= '" + date.Month + "' and sa.Status= 1");
            }
          
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}