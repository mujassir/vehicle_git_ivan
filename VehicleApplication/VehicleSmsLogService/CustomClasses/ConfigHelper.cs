﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace VehicleSmsLogService.CustomClasses
{
    public static class ConfigHelper
    {
        public static string AppSetting(string key)
        {
            return ConfigurationManager.AppSettings[key] + "";
        }

    }
}