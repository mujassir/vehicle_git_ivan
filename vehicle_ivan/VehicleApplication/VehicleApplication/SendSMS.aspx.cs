using System;
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
                // Find your Account Sid and Auth Token at twilio.com/user/account
                var twilio = new TwilioRestClient(ConfigHelper.AppSetting("Twilio_AccountSid"), ConfigHelper.AppSetting("Twilio_AuthToken"));
                //new Twilio.TwilioRestClient ("","").ListSmsMessages (
                var message = twilio.SendSmsMessage(ConfigHelper.AppSetting("Twilio_FromNumber"), txtNumber.Text, txtMessage.Text, "");

                //WebClient client = new WebClient();
                //// Add a user agent header in case the requested URI contains a query.
                //client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CL1.0.3705;)");
                //client.QueryString.Add("user", txtUserName.Text);
                //client.QueryString.Add("password", txtPassword.Text);
                //client.QueryString.Add("api_id", txtAPIID.Text);
                //client.QueryString.Add("to", txtNumber.Text);
                //client.QueryString.Add("text", txtMessage.Text);
                //string baseurl = "http://api.clickatell.com/http/sendmsg";
                //Stream data = client.OpenRead(baseurl);
                //StreamReader reader = new StreamReader(data);
                //string s = reader.ReadToEnd();
                //data.Close();
                //reader.Close();
                ShowMessage(true, "Message sent successfully");
            }
            catch (Exception ex)
            {
                ShowMessage(true, ex.Message);

            }
        }
    }
}