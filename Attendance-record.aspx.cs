using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_record : System.Web.UI.Page
{
    bus_attendance bus = new bus_attendance();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["pin"] != null)
        {
            if (!IsPostBack)
            {
                var lgn = new bus_login();
                if (lgn.getPassword(Session["pin"].ToString()).PASSWORD == Session["cnic"].ToString())
                {
                    Response.Redirect("change-password.aspx");
                }
                if (Session["user_type"].ToString().ToLower() == "admin")
                {
                    loadEmployees("");
                }
                else
                {
                    loadEmployees(Session["pin"].ToString());
                }
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }

    }
    private void loadEmployees(string pin)
    {
        var employees = bus.getSubordinates(pin);
        if (employees != null)
        {
            employees.Insert(0, new WEB_PROC_GET_SUBORDINATESResult
            {
                NAME = "ME",
                PIN = 0
            });
            ddemployees.DataTextField = "NAME";
            ddemployees.DataValueField = "PIN";
            ddemployees.DataSource = employees;
            ddemployees.DataBind();
            subordinates.Visible = true;
        }
        else
        {
            subordinates.Visible = false;
        }

    }

    public void getAttendance(string pin, string dateto, string datefrom)
    {


        var result = bus.getAttendanceRecord(pin, datefrom, dateto);
        var list = new List<attendance_record>();
        result.ForEach(x =>
        {
            var obj = new attendance_record();
            obj.pin = int.Parse(x.PIN.ToString());
            obj.name = x.NAME;
            obj.date = DateTime.Parse(x.DATE.ToString()).ToString("dd-MM-yyyy");
            obj.timein = x.TIMEIN.ToString();
            obj.timeout = x.TIMEOUT == null ? "Missing Check out" : x.TIMEOUT.ToString();
            obj.Total_time = x.TIMEOUT == null ? "Missing Check out" : (TimeSpan.Parse(x.TIMEOUT.ToString()) - TimeSpan.Parse(x.TIMEIN.ToString())).ToString();
            list.Add(obj);
        });
        gvattendance.DataSource = list;
        gvattendance.DataBind();
    }
    protected void btnsubmit_ServerClick(object sender, EventArgs e)
    {
        var datefrom = hdndatefrom.Value.ToString();
        var dateto = hdndateto.Value.ToString();
        var pin = hdnpin.Value.ToString();
        //pin = pin == "0" ? Session["pin"].ToString() : pin;
        gvattendance.PageIndex = 0;
        getAttendance(pin, dateto, datefrom);
    }
    protected void gvattendance_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvattendance.PageIndex = e.NewPageIndex;
        var datefrom = hdndatefrom.Value.ToString();
        var dateto = hdndateto.Value.ToString();
        var pin = hdnpin.Value.ToString();
        //pin = pin == "0" ? Session["pin"].ToString() : pin;
        getAttendance(pin, dateto, datefrom);
    }
}
public partial class attendance_record
{
    public int pin { get; set; }
    public string name { get; set; }
    public string date { get; set; }
    public string timein { get; set; }
    public string timeout { get; set; }
    public string Total_time { get; set; }
}