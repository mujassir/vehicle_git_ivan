using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using VehicleApplication.DAL;

namespace VehicleApplication.CustomClasses
{
    public class BasePage : System.Web.UI.Page
    {
        public void ShowMessage(bool success, string message)
        {
            if (success)
                DrawMessage(message, MessageType.Success);
            else
                DrawMessage(message, MessageType.Error);
        }
        public void DrawMessage(string message, MessageType type)
        {
            var master = Master as SiteMaster;
            if (master == null)
                master = Master.Master as SiteMaster;
            if (master != null)
            {
                master.ShowMessage(message, type);
            }
        }
        public void HideMessage()
        {
            var master = Master as SiteMaster;
            if (master == null)
                master = Master.Master as SiteMaster;
            if (master != null)
            {
                master.HideMessage();
            }
        }
        public string JsonResult(bool success, string data)
        {
            return new JavaScriptSerializer().Serialize(new
            {
                Success = success,
                Data = data,
            });
        }

        public string WrapToolTip(string content)
        {
            return "<span title='" + content + "'>" + content + "</span>";
        }

        public bool CanView
        {
            get
            {
                var result = false;
                var pa = (RoleAction)Session["PageAction"];
                if (pa != null && pa.CanView) result = true;
                return result;
            }
        }
        public bool CanAdd
        {
            get
            {
                var result = false;
                var pa = (RoleAction)Session["PageAction"];
                if (pa != null && pa.CanAdd) result = true;
                return result;
            }
        }
        public bool CanEdit
        {
            get
            {
                var result = false;
                var pa = (RoleAction)Session["PageAction"];
                if (pa != null && pa.CanEdit) result = true;
                return result;
            }
        }
        public bool CanDelete
        {
            get
            {
                var result = false;
                var pa = (RoleAction)Session["PageAction"];
                if (pa != null && pa.CanDelete) result = true;
                return result;
            }
        }
    }
}