using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleSmsLogService.DAL;

namespace VehicleSmsLogService.BLL
{
    public class ProjectSettingRepository : GenericRepository<ProjectSetting>
    {
        public void SetDefaults()
        {
            if (base.FirstOrDefault() == null)
            {
                ProjectSetting ps = new ProjectSetting()
                {
                    SmsLogUpdateDate = DateTime.Now.AddYears(-10),
                };
                base.Add(ps);
            }
        }
        public DateTime GetLastDate()
        {
            var ps = db.ProjectSettings.FirstOrDefault();
            if (ps != null && ps.SmsLogUpdateDate.HasValue)
            {
                return ps.SmsLogUpdateDate.Value;
            }
            else
                return DateTime.Now.AddYears(-10);
        }
        public int GetSmsLogRefreshTime()
        {
            var ps = base.FirstOrDefault();
            if (ps != null && ps.SmsLogUpdateDate.HasValue)
            {
                var m = ps.SmsLogRefreshTime;
                if (m == 0) m = 1;
                return m;
            }
            else
                return 1;
        }
        public bool IsServiceEnabled()
        {
            var ps = db.ProjectSettings.FirstOrDefault();
            if (ps != null && ps.SmsLogUpdateDate.HasValue)
            {
                return !ps.StopSmsLogService;
            }
            else
                return true;
        }
        public void SetDate(DateTime date)
        {
            var ps = db.ProjectSettings.FirstOrDefault();
            if (ps == null)
            {
                ps = new ProjectSetting()
                {
                    SmsLogUpdateDate = date,
                    SmsLogRefreshTime = 1,
                    StopSmsLogService = false,
                };
                base.Add(ps);
            }
            else
            {
                ps.SmsLogUpdateDate = date;
                this.Save();
            }
        }

    }
}