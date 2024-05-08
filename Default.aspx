<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/Custom.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mainContianer">
            <div class="container white-bg">
                <div class="row">
                    <div class="col-lg-12">
                        <a href="Default.aspx" title="Home">
                            <img class="img-responsive" src="Images/ withlogo.png" /></a>
                    </div>
                </div>
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
                            <li><a href="Default.aspx">Home</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.aspx">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1>Welcome to   <small>Attendance Management System</small></h1>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md--6">
                        <div class="form-inline">
                            <label>Select Attendance File To Import :</label>
                            <asp:FileUpload ID="fileAttendanec" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="text-right">
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" Text="Upload" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </div>
            <div class="footer">
                <p class="text-center">&copy; 2017 Copyrigths  . All Rights Reserved</p>
                </>
            </div>
        </div>
    </form>
</body>
</html>
