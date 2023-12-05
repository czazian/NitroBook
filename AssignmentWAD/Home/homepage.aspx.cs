using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWAD.Home
{
    public partial class homepage : System.Web.UI.Page
    {

        protected override void InitializeCulture()
        {
            
            string lang = Request.Form["ddlLanguage"];
            if (lang != null)
            {
                UICulture = lang;
                Culture = lang;
            }

            base.InitializeCulture();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}