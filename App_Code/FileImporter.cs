using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;

/// <summary>
/// Author: Musab Bin Khalid
/// Email: musab.khalid000@gmail.com
/// Import files for attendance system to Database
/// </summary>
public class FileImporter
{
    public FileImporter()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void readFile(string path, string created_by = "")
    {
        string[] lines = File.ReadAllLines(path, Encoding.UTF8);
        foreach (var line in lines)
        {
            var pin = line.Split('\t')[0].ToString();
            var datetime = line.Split('\t')[1].ToString();
            var checktime = Convert.ToDateTime(datetime);
            using (var db = new AttendanceDataContextDataContext())
            {
                db.WEB_PROC_INSERT_ATTENDANCE(pin, checktime, created_by);
            }
        }
    }
}