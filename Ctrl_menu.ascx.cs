using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ctrl_menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] != null)
        {
            if (Session["user_type"].ToString().ToLower() == "admin")
            {
                liadmin.Visible = true;
            }
            else
            {
                liadmin.Visible = false;
            }
        }
        else
        {
            liadmin.Visible = false;
        }
    }
}