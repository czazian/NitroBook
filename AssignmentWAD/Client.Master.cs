﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AssignmentWAD
{
    public partial class Client : System.Web.UI.MasterPage
    {

        protected void btnSch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Product/search.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}