using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Twilio;

namespace VehicleApplication.CustomClasses
{
    public static class SmsManager
    {

        public static void SendSMS(string Number, string message)
        {
            var twilio = new TwilioRestClient(ConfigHelper.AppSetting("Twilio_AccountSid"), ConfigHelper.AppSetting("Twilio_AuthToken"));
            var response = twilio.SendSmsMessage(ConfigHelper.AppSetting("Twilio_FromNumber"), Number, message, "");
        }
    }
}