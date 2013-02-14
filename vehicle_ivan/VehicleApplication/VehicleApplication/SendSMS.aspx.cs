﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Twilio;
using VehicleApplication.CustomClasses;

namespace VehicleApplication
{
    public partial class SendSMS : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SmsManager.SendSMS(txtNumber.Text, txtMessage.Text);
                ShowMessage(true, "Message sent successfully");
            }
            catch (Exception ex)
            {
                ShowMessage(true, ex.Message);

            }
        }
    }
}