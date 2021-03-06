﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleApplication.CustomClasses;
using VehicleApplication.BLL;

namespace VehicleApplication
{
    public partial class ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string current = txtCurrentPassword.Text + "";
                string newPassword = txtNew.Text + "";
                string confirmPassword = txtConfirmPassword.Text + "";
                if (current == "" || newPassword == "" || confirmPassword == "")
                    throw new Exception("All field are compulsory");
                if (newPassword != confirmPassword)
                    throw new Exception("New and confirm password are not matching");
                int id = 0;
                int.TryParse(Session["UserID"] + "", out id);
                new UserRepository().ChangePassword(id, current, newPassword);
                ShowMessage(true, Resources.Messages.ChangePassword);
            }
            catch (Exception ex)
            {
                ShowMessage(false, ex.Message);
            }
        }
    }
}