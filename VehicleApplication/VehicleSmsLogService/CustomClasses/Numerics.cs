using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleSmsLogService.CustomClasses
{
    public static class Numerics
    {
        public static int GetInt(object input)
        {
            if (input == null || input + "" == "") return 0;
            try
            {
                return Convert.ToInt32(input);
            }
            catch (Exception)
            {
                return 0;   
            }
        }
        public static decimal   GetDecimal(object input)
        {
            if (input == null || input + "" == "") return 0;
            try
            {
                return Convert.ToDecimal(input);
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public static double  GetDouble(object input)
        {
            if (input == null || input + "" == "") return 0;
            try
            {
                return Convert.ToDouble(input);
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}