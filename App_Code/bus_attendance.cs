using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bus_attendance
/// </summary>
public class bus_attendance
{
    public bus_attendance()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<WEB_PROC_GET_ATTENDANCE_RECORDResult> getAttendanceRecord(string pin, string datefrom, string dateto)
    {
        try
        {
            using (var db = new AttendanceDataContextDataContext())
            {
                var result = db.WEB_PROC_GET_ATTENDANCE_RECORD(pin, datefrom, dateto).ToList();
                return result;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    public List<WEB_PROC_GET_SUBORDINATESResult> getSubordinates(string pin)
    {
        try
        {
            using (var db = new AttendanceDataContextDataContext())
            {
                return db.WEB_PROC_GET_SUBORDINATES(pin).ToList();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}