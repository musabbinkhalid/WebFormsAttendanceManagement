<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Ctrl_menu.ascx.cs" Inherits="Ctrl_menu" %>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navmain" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <div class="collapse navbar-collapse" id="navmain">
        <ul class="nav navbar-nav">
            <li><a href="Attendance-record.aspx">Home</a></li>
            <li id="liadmin" runat="server"><a href="import-Attendance.aspx">Import Attendance</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i>&nbsp; <%=Session["name"].ToString().ToUpper() %> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="Change-password.aspx">Change Password</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
