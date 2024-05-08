using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["pin"] != null)
        {

        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var bus = new bus_login();
        var pin = Session["pin"].ToString();
        var current_password = txtpassword.Text.ToString();
        if (bus.getPassword(pin).PASSWORD == current_password)
        {

            var password = txtconfrimpassword.Text.ToString();
            bus.changepassword(pin, password);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password Changed.')", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Current Password does not matched')", true);
        }
    }
}