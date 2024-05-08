﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _importattendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] != null)
        {
            if (Session["user_type"].ToString().ToLower() == "admin")
            {

            }
            else
            {
                Response.Redirect("attendance-record.aspx");
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (fileAttendanec.HasFile)
        {
            var filename = fileAttendanec.FileName;
            var path = Server.MapPath(@"~/temp/" + DateTime.Now.ToString("ddMMyyyy"));
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            path += filename;
            fileAttendanec.SaveAs(path);
            new FileImporter().readFile(path, Session["pin"].ToString());

        }
    }
}