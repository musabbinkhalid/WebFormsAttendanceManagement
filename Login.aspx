<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>  Attendance System</title>
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
                </nav>
                  <div class="jumbotron">
                            <h3>Welcome to   Attendance System.
                            </h3>
                        </div>
                <div class="row">
                    <div class="col-md-6">
                      <h3>
                            Attendance System
                      </h3>
                        <p>
                              attendance system, Develop by Registration and examination department  . System can help viewing your attendance. It also allows department heads to view attendance of their subordinates.
                        </p>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">

                            <div class="panel-heading">
                                <h3 class="panel-title">Login</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="txtpin">PIN:</label>
                                    <asp:TextBox ID="txtpin" runat="server" CssClass="form-control" placeholder="PIN"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtpassword">
                                        Password:
                                    </label>
                                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Password" MaxLength="32" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="pull-left">
                                    <asp:Button ID="btnlogn" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnlogn_Click" />
                                   <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-danger" />
                            </div>
                                 <div class="clearfix"></div>
                                    <a href="#">Forgot your password?</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p class="text-center">&copy; 2017 Copyrigths  . All Rights Reserved</p>
            </div>
        </div>
    </form>
</body>
</html>
