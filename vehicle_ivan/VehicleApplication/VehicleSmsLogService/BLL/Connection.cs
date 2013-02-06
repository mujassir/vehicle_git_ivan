using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using VehicleSmsLogService.DAL;

namespace VehicleSmsLogService.BLL
{
    public static class Connection
    {
        private static VehicleDBEntities db = null;
        public static string GetConnectionString()
        {
            string file = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\ConnectionString.txt";
            //return ConfigurationManager.ConnectionStrings["VehicleDBEntities"].ConnectionString;
            return System.IO.File.ReadAllText(file);
            //  return "metadata=res://*/DAL.Model1.csdl|res://*/DAL.Model1.ssdl|res://*/DAL.Model1.msl;provider=System.Data.SqlClient;provider connection string='data source=.\\sql2008;initial catalog=VehicleDB;user id=sa;password=@ivan1;multipleactiveresultsets=True;App=EntityFramework'";
        }
        public static VehicleDBEntities GetContext()
        {
            //if (db == null)
            //    db = new VehicleDBEntities(GetConnectionString());
            //return db;

            return new VehicleDBEntities(GetConnectionString());

        }

    }
}