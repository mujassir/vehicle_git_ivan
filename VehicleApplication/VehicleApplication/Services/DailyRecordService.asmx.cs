using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Linq.Expressions;
using VehicleApplication.BLL;
using VehicleApplication.DAL;
using System.Web.Script.Serialization;
using VehicleApplication.BLL.DynamicLinq;
using VehicleApplication.CustomClasses;

namespace VehicleApplication.Services
{
    /// <summary>
    /// Summary description for DailyRecordService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DailyRecordService : System.Web.Services.WebService
    {

        //[WebMethod]
        //public DailyRecord GetByID(decimal id)
        //{
        //    return new DailyRecordRepository().Get(id);
        //}
        [WebMethod]
        public string GetByIDJSON(int id)
        {
            var result = JsonConvert.SerializeObject(new DailyRecordRepository().GetByID(id));
            return result;
        }
        [WebMethod]
        public void Delete(int id)
        {
            new DailyRecordRepository().Delete(id);
        }
        [WebMethod]
        public void Save(DailyRecord dr)
        {
            new DailyRecordRepository().Save(dr);
        }
        [WebMethod]
        public void SaveJSON(string record, string files)
        {
            DailyRecord dr = new JavaScriptSerializer().Deserialize<DailyRecord>(record);
            var drFiles = new JavaScriptSerializer().Deserialize<List<DailyRecordFile>>(files);
            foreach (var item in drFiles)
            {
                dr.DailyRecordFiles.Add(item);
            }
            new DailyRecordRepository().Save(dr);
        }
        [WebMethod]
        public List<DailyRecord> GetAll()
        {
            return new DailyRecordRepository().AsQueryable().ToList();
        }
        [WebMethod]
        public string GetAllJSON()
        {
            return new JavaScriptSerializer().Serialize(new DailyRecordRepository().AsQueryable().ToList());
        }
        [WebMethod]
        public List<DailyRecord> GetByPage(int pageNumber, int pageSize)
        {
            return new DailyRecordRepository().AsQueryable().OrderByDescending(p => p.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
        }
        [WebMethod]
        public string GetByPageJSON(int pageNumber, int pageSize)
        {
            return new JavaScriptSerializer().Serialize(new DailyRecordRepository().AsQueryable().OrderByDescending(p => p.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList());
        }
        [WebMethod]
        public List<DailyRecord> GetByPageSort(int pageNumber, int pageSize, string sortDirection, string sortColumn)
        {
            var list = new DailyRecordRepository().AsQueryable();
            if (sortDirection.ToLower() == "asc")
                return list.OrderBy(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            else
                return list.OrderByDescending(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
        }
        [WebMethod]
        public string GetByPageSortJSON(int pageNumber, int pageSize, string sortDirection, string sortColumn)
        {
            var list = new DailyRecordRepository().AsQueryable();
            if (sortDirection.ToLower() == "asc")
                return new JavaScriptSerializer().Serialize(list.OrderBy(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList());
            else
                return new JavaScriptSerializer().Serialize(list.OrderByDescending(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList());
        }
        [WebMethod]
        public List<DailyRecord> GetByPageSortSearch(int pageNumber, int pageSize, string sortDirection, string sortColumn, string search)
        {
            var list = new DailyRecordRepository().AsQueryable();
            var filteredList = list.Where(p =>
                   p.TruckID.Contains(search)
                   || p.SerialNumber.Contains(search)
                   || p.SBC_VIN.Contains(search)
                   || p.State.Contains(search)
                   || p.City.Contains(search)
                   );
            if (sortDirection.ToLower() == "asc")
                return filteredList.OrderBy(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            else
                return filteredList.OrderByDescending(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
        }
        [WebMethod]
        public string GetByPageSortSearchJSON(int pageNumber, int pageSize, string sortDirection, string sortColumn, string search)
        {
            var list = new DailyRecordRepository().AsQueryable();
            var filteredList = list.Where(p =>
                   p.TruckID.Contains(search)
                   || p.SerialNumber.Contains(search)
                   || p.SBC_VIN.Contains(search)
                   || p.State.Contains(search)
                   || p.City.Contains(search)
                   );
            if (sortDirection.ToLower() == "asc")
                return new JavaScriptSerializer().Serialize(filteredList.OrderBy(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList());
            else
                return new JavaScriptSerializer().Serialize(filteredList.OrderByDescending(sortColumn).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList());
        }
    }
}
