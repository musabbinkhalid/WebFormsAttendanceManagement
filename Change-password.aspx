<%@ Page Title="Change Password - Attendance System" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change-password.aspx.cs" Inherits="Change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #passwordStrength {
            width: 100%;
            background-color: #ececec;
            border-radius: 5px;
            border: .5px #ececec solid;
        }

        #bar {
            width: 0px;
            height: 12px;
            background-color: green;
            border: .5px green solid;
            border-radius: 5px;
            text-align: center; /* To center it horizontally (if you want) */
            line-height: 10px; /* To center it vertically */
            color: white;
            font-size: 9pt;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <div class="page-header">
            <h2><i class="fa fa-user"></i>&nbsp;Change Password</h2>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group" id="currentPassword">
                    <label>Current Password</label>
                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" MaxLength="32" Placeholder="Current Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <asp:TextBox ID="txtnewpassword" runat="server" CssClass="form-control" MaxLength="32" Placeholder="New Password" TextMode="Password"></asp:TextBox>
                    <div id="passwordStrength" class="margin-t10">
                        <div id="bar">
                        </div>
                    </div>
                </div>
                <div class="form-group" id="confrmdiv">
                    <label>Confirm Password</label>
                    <asp:TextBox ID="txtconfrimpassword" runat="server" CssClass="form-control" MaxLength="32" Placeholder="Confrim Password" TextMode="Password"></asp:TextBox>
                    <span id="passwordhelp" class="help-block"></span>
                </div>
                <div class="text-left">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Change" OnClientClick="return checkpassword()" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                </div>
            </div>
            <div class="col-md-8">
                <div class="jumbotron">
                    <h3>Password Instructions</h3>
                    <ul>
                        <li><i id="length"></i>&nbsp;You password must be atleat 6 characters long and does not exced 32 characters.</li>
                        <li><i id="uppercase"></i>&nbsp;It should contain atleast 1 capital alphabet.</li>
                        <li><i id="lowercase"></i>&nbsp;It should contain atleast 1 small alphabet.</li>
                        <li><i id="number"></i>&nbsp;It should contain atleast 1 number.</li>
                        <li><i id="sepcial"></i>&nbsp;It should contain atleast 1 special character.</li>
                        <li>Characters (%&<>-;) are not allowed.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/PasswordChecker.js"></script>
    <script>
        $(document).ready(function () {
            $("input[id$='txtnewpassword']").on("keypress keyup keydown", function () {
                var pass = $("input[id$='txtnewpassword']").val();
                var elem = document.getElementById("bar");
                elem.innerHTML = checkPassStrength(pass);
                testPassword();
            });
            $("input[id$='txtconfrimpassword']").on("keypress keyup keydown", function () {
                matchPassword();
            });
        });

        function testPassword() {
            $("#number").removeClass('text-success fa fa-check');
            $("#lowercase").removeClass('text-success fa fa-check');
            $("#uppercase").removeClass('text-success fa fa-check');
            $("#sepcial").removeClass('text-success fa fa-check');
            $("#length").removeClass('text-success fa fa-check');

            var password = $("input[id$='txtnewpassword']").val();
            if (/\d/.test(password)) {
                $("#number").addClass('text-success fa fa-check');
            }
            if (/[a-z]/.test(password)) {
                $("#lowercase").addClass('text-success fa fa-check');
            }
            if (/[A-Z]/.test(password)) {
                $("#uppercase").addClass('text-success fa fa-check');
            }
            if (/\W/.test(password)) {
                $("#sepcial").addClass('text-success fa fa-check');
            }
            if (password.length >= 6) {
                $("#length").addClass('text-success fa fa-check');
            }

        }
        function checkpassword() {
            $('#currentPassword').removeClass('has-error');
            var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,32}/g;
            var password = $("input[id$='txtnewpassword']").val();
            var currentpassword = $('input[id$="txtpassword"]').val();

            if (currentpassword) {
                if (currentpassword == password) {
                    alert("Current Password Cannot be new password");
                    $("input[id$='txtnewpassword']").val("");
                    $("input[id$='txtconfrimpassword']").val("");
                    $('input[id$="txtpassword"]').val("");
                    $('input[id$="txtpassword"]').focus();
                    return false;
                }
                var reg = new RegExp(regex);
                if (reg.test(password) && matchPassword()) {
                    return true
                } else {
                    return false;
                }
            } else {
                $('#currentPassword').addClass('has-error');
                $('input[$="txtpassword"]').focus();
                return false;
            }
        }

        function matchPassword() {
            $("#confrmdiv").removeClass('has-error');
            $("#confrmdiv").removeClass('has-success');
            $("#passwordhelp").text("");
            var password = $("input[id$='txtnewpassword']").val();
            var cnfrmpassword = $("input[id$='txtconfrimpassword']").val();
            if (password == cnfrmpassword) {
                $("#passwordhelp").text("Success");
                $("#confrmdiv").addClass('has-success');
                return true;
            } else {
                $("#passwordhelp").text("Ops ! Confrim Password Does not match the password.");
                $("#confrmdiv").addClass('has-error');
                return false;
            }
        }
    </script>
</asp:Content>

