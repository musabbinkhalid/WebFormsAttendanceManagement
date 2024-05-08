<%@ Page Title="Attendance Record - Attendance System" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance-record.aspx.cs" Inherits="Attendance_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="//code.jquery.com/ui/1.12.1/themes/flick/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>

    <div class="col-md-12">
        <div class="jumbotron">
            <h2>Attendanc Record</h2>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-12">
        <div class="form-inline margin-b20" id="subordinates" runat="server">
            <label>Employee</label>
            <asp:DropDownList ID="ddemployees" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="form-inline">
            <label>Please Select from list:</label>
            <select class="form-control" id="ddlcriteria" onchange="ddlchanged()">
                <option value="">Select</option>
                <option value="MTD">Month to date</option>
                <option value="LM">Last Month</option>
                <option value="YTD">Year to date</option>
                <option value="DR">Date Range</option>
                <option value="all">All available history</option>
            </select>
            <div id="calender" class="hidden form-group">
                &nbsp;
                <label>Date From: </label>
                <input id="txtdatefrom" class="form-control" readonly="readonly" placeholder="Date From" />
                <label>Date To: </label>
                <input id="txtdateto" class="form-control" readonly="readonly" placeholder="Date to" />
            </div>

            <asp:Button ID="btnsubmit" CssClass="btn btn-primary" Text="Submit" OnClientClick=" return submitbtnclick();" runat="server" OnClick="btnsubmit_ServerClick"></asp:Button>
        </div>
    </div>
    <div class="clearfix"></div>

    <asp:GridView ID="gvattendance" runat="server" CssClass="table table-bordered margin-t20 table-condensed" AllowPaging="true" OnPageIndexChanging="gvattendance_PageIndexChanging" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="PIN" DataField="pin" />
            <asp:BoundField HeaderText="Name" DataField="name" />
            <asp:BoundField HeaderText="Date" DataField="date" />
            <asp:BoundField HeaderText="Checked In" DataField="timein" />
            <asp:BoundField HeaderText="Checked out" DataField="timeout" />
            <asp:BoundField HeaderText="Total Time" DataField="Total_time" />
        </Columns>
        <PagerSettings Mode="Numeric"
            Position="Bottom"
            PageButtonCount="10" />
        <PagerStyle CssClass="pagination-ys" />
    </asp:GridView>

    <asp:HiddenField ID="hdndatefrom" runat="server" />
    <asp:HiddenField ID="hdndateto" runat="server" />
    <asp:HiddenField ID="hdnpin" runat="server" />
    <script>
        $(document).ready(function () {
            $('#txtdatefrom').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "mm/dd/yy",
                constrainInput: true,
                defaultDate: new Date(),
                yearRange: "2000:2025",
                maxDate: new Date(),
                onSelect: function () {
                    var maxdate = $('#txtdatefrom').val();
                    if ($('#txtdateto').datepicker())
                        $('#txtdateto').datepicker('destroy');

                    $('#txtdateto').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "mm/dd/yy",
                        constrainInput: true,
                        defaultDate: maxdate,
                        yearRange: "2000:2025",
                        minDate: maxdate,
                        maxDate: new Date()
                    });
                }
            });
        });

        function submitbtnclick() {
            var criteria = $("select[id='ddlcriteria']").val();
            var datefrom = "";
            var dateto = "";
            var date = new Date();
            debugger;
            if (criteria == "MTD") {

                datefrom = new Date(date.getFullYear(), date.getMonth(), 1).toLocaleDateString();
                dateto = new Date().toLocaleDateString();
            } else if (criteria == "LM") {
                datefrom = new Date(date.getFullYear(), date.getMonth() - 1, 1).toLocaleDateString();
                dateto = new Date(date.getFullYear(), date.getMonth(), 0).toLocaleDateString();
            } else if (criteria == "YTD") {
                datefrom = new Date(date.getFullYear(), 1, 1).toLocaleDateString();
                dateto = new Date().toLocaleDateString();
            } else if (criteria == 'DR') {
                datefrom = $('#txtdatefrom').val();
                dateto = $('#txtdateto').val();
            } else if (criteria == 'all') {
                datefrom = new Date(2000, 1, 1).toLocaleDateString();
                dateto = new Date().toLocaleDateString();
            } else {
                return false;
            }
            var pin = $('select[id*="ddemployees"]').val();

            $('input[id$="hdndatefrom"]').val(datefrom);
            $('input[id$="hdndateto"]').val(dateto);
            $('input[id$="hdnpin"]').val(pin);
            return true;
        }

        function ddlchanged() {
            var criteria = $("select[id='ddlcriteria']").val();
            if (criteria == "DR") {
                $('#calender').removeClass('hidden');
            } else {
                $('#calender').addClass('hideen');
            }
        }

        //helping function
        function ToJavaScriptDate(value) {
            var pattern = /Date\(([^)]+)\)/;
            var results = pattern.exec(value);
            var dt = new Date(parseFloat(results[1]));
            return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
        }

        function get_time_diff(timein, timeout) {
            var datetime = typeof datetime !== 'undefined' ? datetime : "2014-01-01 01:02:03.123456";

            var datetime = new Date(datetime).getTime();
            var now = new Date().getTime();

            if (isNaN(datetime)) {
                return "";
            }

            console.log(datetime + " " + now);

            if (datetime < now) {
                var milisec_diff = now - datetime;
            } else {
                var milisec_diff = datetime - now;
            }

            var days = Math.floor(milisec_diff / 1000 / 60 / (60 * 24));

            var date_diff = new Date(milisec_diff);

            return days + " Days " + date_diff.getHours() + " Hours " + date_diff.getMinutes() + " Minutes " + date_diff.getSeconds() + " Seconds";
        }
    </script>
</asp:Content>

