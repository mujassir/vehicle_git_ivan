using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleApplication.BLL;
using System.Web.Script.Serialization;
using VehicleApplication.CustomClasses;

namespace VehicleApplication
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var key = Request["key"] + "";
            if (key != "")
            {
                if (key == "LoginUser")
                    Response.Write(LoginUser());

                Response.End();
            }
        }
        public string LoginUser()
        {
            string result = "";
            string userName = Request["userName"] + "";
            string password = Request["password"] + "";
            try
            {
                var user = new UserRepository().Get(userName, password);
                if (user == null || user.ID == 0)
                    throw new Exception(Resources.Messages.Login_IncorrectUsername);
                if (user.RecordStatus == (byte)RecordStatus.Inactive)
                    throw new Exception(Resources.Messages.Login_InactiveUser);
                if (user.RecordStatus == (byte)RecordStatus.Blocked)
                    throw new Exception(Resources.Messages.Login_BlockedUser);
                if (user.Role.RecordStatus == (byte)RecordStatus.Inactive)
                    throw new Exception(Resources.Messages.Login_InactiveRole);

                var roleActions = new RoleActionRepository().GetByRoleID(user.RoleID);
                Session["UserID"] = user.ID;
                Session["UserName"] = user.UserName;
                Session["UserRole"] = user.RoleName;
                Session["RoleActions"] = roleActions;
                result = JsonResult(true, "");
            }
            catch (Exception ex)
            {
                result = JsonResult(false, ex.Message);
            }

            return result;
        }
    }
}