using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using VehicleApplication.CustomClasses;
using System.Web.Script.Serialization;
using VehicleApplication.BLL;
using Newtonsoft.Json;

namespace VehicleApplication
{
    public partial class ManageRoles : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = Request["key"] + "";
            if (key != "")
            {
                string data = "";
                if (key == "GetDataTable")
                {
                    data = GetDataTable();
                }
                else if (key == "Delete")
                {
                    data = Delete();
                }
                else if (key == "ChangeStatus")
                {
                    data = ChangeStatus();
                }
                else if (key == "GetByID")
                {
                    data = GetByID();
                }
                else if (key == "Save")
                {
                    data = Save();
                }
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.Write(data);
                Response.Flush();
                Response.End();
            }

            if (!Page.IsPostBack)
            {
                BindModules();
            }
        }
        public void BindModules()
        {
            rptModules.DataSource = new ModuleRepository().GetAll();
            rptModules.DataBind();
        }
        public string Delete()
        {
            string result = "";
            int id = Numerics.GetInt(Request["id"]);
            try
            {
                var repo = new RoleRepository();
                repo.Delete(id);
                result = JsonResult(true, Resources.Messages.Delete);

            }
            catch (Exception ex)
            {
                result = JsonResult(false, ex.Message);
            }
            return result;
        }
        public string ChangeStatus()
        {
            string result = "";
            try
            {
                int id = 0;
                int.TryParse(Request["id"], out id);
                byte status = 0;
                byte.TryParse(Request["status"], out status);
                var repo = new RoleRepository();
                var v = repo.GetByID(id);
                if (v != null)
                {
                    v.RecordStatus = status;
                    repo.SaveChanges();
                }
                result = JsonResult(true, Resources.Messages.StatusChanged);
            }
            catch (Exception ex)
            {
                result = JsonResult(false, ex.Message);
            }

            return result;
        }

        public string Save()
        {
            string result = "";
            try
            {
                var repo = new RoleRepository();
                var roleInput = JsonConvert.DeserializeObject<DAL.Role>(Request["role"]);
                var roleActions = JsonConvert.DeserializeObject<List<DAL.RoleAction>>(Request["roleActions"]);
                if (roleInput != null)
                {
                    if (repo.IsExist(roleInput.ID, roleInput.Name))
                        return JsonResult(false, "1");
                    else
                    {

                        if (roleInput.ID == 0)
                            repo.Add(roleInput, roleActions);
                        else
                        {
                            repo.Save(roleInput, roleActions);
                        }
                        result = JsonResult(true, Resources.Messages.Save);
                    }
                }
                else
                    result = JsonResult(true, Resources.Messages.Save);
            }
            catch (Exception ex)
            {
                result = JsonResult(false, ex.Message);
            }
            return result;
        }
        public string GetByID()
        {
            string result = "";
            int id = Numerics.GetInt(Request["id"]);
            try
            {
                var role = new RoleRepository().GetByID(id);
                var roleActions = new RoleActionRepository().GetByRoleID(id);
                var js = new
                {
                    ID = role.ID,
                    Name = role.Name,
                    RoleActions = roleActions,
                };
                result = JsonConvert.SerializeObject(js);
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            return result;
        }

        public string GetDataTable()
        {
            string role = Session["UserRole"] + "";
            role = role.ToLower();
            string[] coloumns = { "", "UserName", "RoleName", "" };
            int echo = Int32.Parse(Request.Params["sEcho"]);
            int displayLength = Int32.Parse(Request.Params["iDisplayLength"]);
            int colIndex = Int32.Parse(Request.Params["iSortCol_0"]);
            int displayStart = Int32.Parse(Request.Params["iDisplayStart"]);
            string search = (Request.Params["sSearch"] + "").Trim();

            var dal = new RoleRepository();
            var records = dal.AsQueryable();

            int totalRecords = records.Count();
            int totalDisplayRecords = totalRecords;
            var filteredList = records;
            if (search != "")
                filteredList = records.Where(p =>
                   p.Name.Contains(search)
                   );
            var orderedList = filteredList.OrderByDescending(p => p.ID);
            if (colIndex < coloumns.Length && coloumns[colIndex] + "" != "")
            {
                string sortDir = Request.Params["sSortDir_0"];
                string sortExpression = coloumns[colIndex] + sortDir;
                orderedList = sortDir == "asc" ? filteredList.OrderBy(coloumns[colIndex]) : filteredList.OrderByDescending(coloumns[colIndex]);
            }
            StringBuilder sb = new StringBuilder();
            sb.Clear();
            JQueryResponse rs = new JQueryResponse();
            foreach (var item in orderedList.Skip(displayStart).Take(displayLength))
            {
                List<string> data = new List<string>();
                var method = "";
                var disabled = "disabled='disabled'";
                if (CanEdit)
                {
                    method = "onclick='ChangeStatus(this)'";
                    disabled = "";
                }
                var status = "<img class='icon' src='images/status-online.png' title='Click to make it inactive' " + disabled + method + " data-id='" + item.ID + "' status-id='" + item.RecordStatus + "' />";
                if (item.RecordStatus == (byte)RecordStatus.Inactive)
                    status = "<img class='icon' src='images/status-offline.png' title='Click to make it active' " + disabled + method + " data-id='" + item.ID + "' status-id='" + item.RecordStatus + "' />";
                data.Add(status);
                data.Add(item.Name);
                string editIcon = "<img  src='images/edit.png' class='icon'  alt='' onclick=\"Edit(" + item.ID + ")\"  style='float:left'  title='Edit Record' />";
                string deleteIcon = "<img id='delete'  src='images/delete.png'  class='icon' alt='' onclick=\"Delete(" + item.ID + ")\" style='float:right'  title='Delete Record' />";
                string icons = "";
                if (CanEdit)
                    icons = editIcon;
                if (CanDelete)
                    icons = editIcon + deleteIcon;
                data.Add(icons);
                rs.aaData.Add(data);
            }
            rs.sEcho = echo;
            rs.iTotalRecords = totalRecords;
            rs.iTotalDisplayRecords = totalDisplayRecords;
            return new JavaScriptSerializer().Serialize(rs);
        }
    }
}