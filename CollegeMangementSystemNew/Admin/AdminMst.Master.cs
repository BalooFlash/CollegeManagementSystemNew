using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeMangementSystemNew.Admin
{
    public partial class AdminMst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
            
            
        }
    }
}