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
    public partial class AdminHome : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                StudentCount();
                TeacherCount();
                ClassCount();
                SubjectCount();
            }

        }
        void StudentCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) from Student");
            Session["student"] = dt.Rows[0][0];
        }
        void TeacherCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) from Teacher");
            Session["teacher"] = dt.Rows[0][0];
        }
        void ClassCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) from Class");
            Session["class"] = dt.Rows[0][0];
        }
        void SubjectCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) from Subject");
            Session["subject"] = dt.Rows[0][0];
        }
    }
}