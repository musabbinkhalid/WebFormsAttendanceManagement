using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bus_login
/// </summary>
public class bus_login
{
    public bus_login()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public WEB_PROC_LOGINResult login(string pin, string password)
    {
        try
        {
            using (var db = new AttendanceDataContextDataContext())
            {
                return db.WEB_PROC_LOGIN(pin, password).FirstOrDefault();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public int changepassword(string pin, string password)
    {
        try
        {
            using (var db = new AttendanceDataContextDataContext())
            {
                return db.CHANGE_PASSWORD(password, pin);
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public WEB_PROC_GET_PASSWORDResult getPassword(string pin)
    {
        try
        {
            using (var db = new AttendanceDataContextDataContext())
            {
                return db.WEB_PROC_GET_PASSWORD(pin).FirstOrDefault();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}