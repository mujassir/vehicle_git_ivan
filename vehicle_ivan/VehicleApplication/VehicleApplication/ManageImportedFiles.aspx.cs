﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleApplication.CustomClasses;
using VehicleApplication.BLL;
using System.Text;
using System.Web.Script.Serialization;
using System.IO;

namespace VehicleApplication
{
    public partial class ManageImportedFiles : BasePage
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
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.Write(data);
                Response.Flush();
                Response.End();
            }
        }
        public string Delete()
        {
            string result = "";
            int id = Numerics.GetInt(Request["id"]);
            try
            {
                var repo = new ImportFileRepository();
                var file = repo.GetByID(id);
                if (file != null)
                {
                    string filePath = Server.MapPath("ImportFiles/") + file.URL;
                    if (File.Exists(filePath)) File.Delete(filePath);
                    repo.Delete(file);
                }
                result = JsonResult(true, Resources.Messages.Delete);
            }
            catch (Exception ex)
            {
                result = JsonResult(false, ex.Message);
            }

            return "";
        }
        public string GetDataTable()
        {
            string role = Session["UserRole"] + "";
            role = role.ToLower();
            string[] coloumns = { "Name", "UploadedByUser", };
            int echo = Int32.Parse(Request.Params["sEcho"]);
            int displayLength = Int32.Parse(Request.Params["iDisplayLength"]);
            int colIndex = Int32.Parse(Request.Params["iSortCol_0"]);
            int displayStart = Int32.Parse(Request.Params["iDisplayStart"]);
            string search = (Request.Params["sSearch"] + "").Trim();

            ImportFileRepository dal = new ImportFileRepository();
            var records = dal.AsQueryable();

            int totalRecords = records.Count();
            int totalDisplayRecords = totalRecords;
            var filteredList = records;
            if (search != "")
                filteredList = records.Where(p =>
                   p.Name.Contains(search)
                   || p.UploadedByUser.Contains(search)
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

                string nameHTML = "<a href='ImportFiles/" + item.URL + "'>" + item.Name + "</a>";
                data.Add(nameHTML);
                data.Add(item.UploadedByUser);
                data.Add(item.UploadedAt.ToString());

                string deleteIcon = "<img id='delete'  src='images/delete.png'  class='icon' alt='' onclick=\"Delete(" + item.ID + ")\" style='float:right'   title='Delete Record' />";
                string icons = "";
                if (CanDelete)
                    icons = deleteIcon;
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