using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using Twilio;
using VehicleSmsLogService.BLL;
using VehicleSmsLogService.Mapping;
using VehicleSmsLogService.DAL;
using VehicleSmsLogService.CustomClasses;
using System.IO;
using System.Timers;
namespace VehicleSmsLogService
{
    partial class SmsLogService : ServiceBase
    {
        private VehicleDBEntities db = null;
        public Timer timer1 = new Timer();
        ProjectSettingRepository psRepo = new ProjectSettingRepository();
        public string logFileName = System.Environment.GetFolderPath(Environment.SpecialFolder.CommonDocuments) + "\\SmsServiceLog.txt";
        public SmsLogService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            db = new VehicleDBEntities(Connection.GetConnectionString());
            timer1.Interval = 1000;
            timer1.Elapsed += new ElapsedEventHandler(timer1_Elapsed);
            timer1.Enabled = true;
            timer1.Start();
            WriteLog("Application started");
            AutoMapperConfig.InitializeMappings();
        }

        void timer1_Elapsed(object sender, ElapsedEventArgs e)
        {
            DownloadMessages();
        }
        public void WriteLog(string log)
        {
            string content = DateTime.Now.ToString() + ": " + log + Environment.NewLine;
            var sw = File.AppendText(logFileName);
            sw.WriteLine(content);
            sw.Close();
            System.Threading.Thread.Sleep(1000);
        }
        public void DownloadMessages()
        {
            try
            {
                db = new VehicleDBEntities(Connection.GetConnectionString());
                var ps = db.ProjectSettings.FirstOrDefault();
                if (ps == null)
                    ps = new ProjectSetting() { StopSmsLogService = false, SmsLogUpdateDate = DateTime.Now.AddYears(-1), SmsLogRefreshTime = 1, };
                if (!ps.StopSmsLogService)
                {
                    var d = ps.SmsLogUpdateDate.Value;
                    var twilio = new TwilioRestClient(ConfigHelper.AppSetting("Twilio_AccountSid"), ConfigHelper.AppSetting("Twilio_AuthToken"));
                    var NowDate = DateTime.Now;
                    string resource = string.Format("Accounts/{0}/SMS/Messages.json?DateSent>={1}", ConfigHelper.AppSetting("Twilio_AccountSid"), d.ToString("yyyy-MM-dd HH:mm:ss"));
                    RestSharp.RestRequest rs = new RestSharp.RestRequest();
                    rs.Resource = resource;

                    var smsResult = twilio.Execute<SmsMessageResult>(rs);
                    var smsList = new List<Message>();
                    if (smsResult != null)
                        AutoMapper.Mapper.Map(smsResult.SMSMessages, smsList);
                    if (smsList.Count > 0)
                    {
                        foreach (var item in smsList)
                        {
                            if (!db.Messages.Any(p => p.Sid == item.Sid))
                                db.Messages.AddObject(item);
                        }
                        db.SaveChanges();
                    }
                    ps.SmsLogUpdateDate = NowDate;
                    if (ps.ID == 0)
                        db.ProjectSettings.AddObject(ps);
                    db.SaveChanges();
                    WriteLog(smsList.Count + " Sms read");
                }
                int interval = ps.SmsLogRefreshTime * 60 * 1000;
                if (timer1.Interval != interval)
                {
                    timer1.Stop();
                    timer1.Interval = interval;
                    timer1.Start();
                }
            }
            catch (Exception ex)
            {
                WriteLog(ex.ToString());
            }
        }


        protected override void OnStop()
        {
            // TODO: Add code here to perform any tear-down necessary to stop your service.
            WriteLog("Application stopped");

        }


    }
}
