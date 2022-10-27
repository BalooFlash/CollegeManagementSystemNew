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
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (! IsPostBack)
            {
                GetClass();
                lblMsg.Text = "";
            }
        }
        private void GetClass()
        {

            DataTable dt = fn.Fetch("Select ROW_NUMBER() over(Order by(Select 1)) as[Sr.No],ClassId,ClassName from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName='" + txtClass.Text.Trim() + "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class values('" + txtClass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Visible = true;
                    //lblMsg.Text = "Inserted Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Visible = true;

                    lblMsg.Text = "Entered class Already exsits";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script> alert('" +ex.Message+"'</script>");

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;


        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                String ClassName = (row.FindControl("txtClassEdit") as TextBox).Text;

               
                // TextBox txtNotes = (TextBox)row.FindControl("txtClassEdit");
               
                fn.Query("Update Class set ClassName='" + ClassName + "' where ClassId='" + cId + "'");
                lblMsg.Visible = true;
                lblMsg.Text = "Updated Successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'</script>");

            }
        }

      
    }
}