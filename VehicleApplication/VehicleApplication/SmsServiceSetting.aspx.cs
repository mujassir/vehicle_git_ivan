﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleApplication.DAL;
using VehicleApplication.BLL;
using VehicleApplication.CustomClasses;

namespace VehicleApplication
{
    public partial class SmsServiceSetting : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetValues();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var rt = 0;
            int.TryParse(txtRefreshTime.Text, out rt);
            if (rt == 0)
            {
                ShowMessage(false, Resources.Messages.SmsServiceSetting_EnterValidValue);
            }
            else
            {
                try
                {
                    var psRepo = new ProjectSettingRepository();
                    var ps = psRepo.FirstOrDefault();
                    if (ps != null)
                    {
                        ps.SmsLogRefreshTime = rt;
                        psRepo.SaveChanges();
                    }
                    else
                    {
                        ps = new ProjectSetting()
                        {
                            SmsLogRefreshTime = rt,
                            StopSmsLogService = false,
                            SmsLogUpdateDate = DateTime.Now.AddYears(-1),
                        };
                        psRepo.Add(ps);

                    }
                    ShowMessage(true, Resources.Messages.Save);
                }
                catch (Exception ex)
                {

                    ShowMessage(false, ex.Message);
                }
            }
        }

        public void SetValues()
        {
            var ps = new ProjectSettingRepository().FirstOrDefault();
            if (ps != null)
            {
                txtRefreshTime.Text = ps.SmsLogRefreshTime + "";
            }
        }

    }
}