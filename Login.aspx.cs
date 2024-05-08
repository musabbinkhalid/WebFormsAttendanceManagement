using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["pin"] != null)
            {
                Response.Redirect("attendance-record.aspx");
            }
        }
    }
    protected void btnlogn_Click(object sender, EventArgs e)
    {
        string pin = txtpin.Text.ToString();
        string password = txtpassword.Text.ToString();
        var bus = new bus_login();
        var result = bus.login(pin, password);
        if (result != null)
        {
            Session["pin"] = result.PIN;
            Session["user_type"] = result.USER_TYPE;
            Session["department"] = result.DEPARTMENT_ABBV;
            Session["cnic"] = result.CNIC;
            Session["name"] = result.NAME;
            Response.Redirect("attendance-record.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username/Password.')", true);
        }
    }
}