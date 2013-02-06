using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using VehicleApplication.DAL;
using VehicleApplication.BLL;
using System.IO;
using VehicleApplication.CustomClasses;

namespace VehicleApplication
{
    public partial class ImportRecords : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {

                    string fileName = new Random().Next() + FileUpload1.FileName;
                    string filePath = Server.MapPath("ImportFiles/") + fileName;
                    FileUpload1.SaveAs(filePath);
                    ImportFile file = new ImportFile()
                    {
                        Name = Path.GetFileNameWithoutExtension(FileUpload1.FileName),
                        URL = fileName,
                        UploadedAt = DateTime.Now,
                        UploadedBy = Convert.ToInt32(Session["UserID"]),
                        UploadedByUser = Session["UserName"] + "",
                    };
                    new ImportFileRepository().Add(file);
                    var connectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", filePath);

                    var adapter = new OleDbDataAdapter("SELECT * FROM [OWR Info$]", connectionString);
                    var ds = new DataSet();

                    adapter.Fill(ds, "OWR Info");
                    var data = ds.Tables["OWR Info"].AsEnumerable();
                    var OwrInfoRecords = data.Select(x =>
                                new OWRInfo
                                {
                                    ImportFileID = file.ID,
                                    RequestID = x.Field<string>("REQUEST_ID"),
                                    SBC_VIN = x.Field<object>("SBC_VIN") + "",
                                    TrackingSheet = x.Field<string>("Tracking Sheet"),
                                    UPSTrackingNumber = x.Field<string>("UPS Tracking Number"),
                                    IWM_GPS_UNIT = x.Field<string>("IWM/GPS UNIT"),
                                    SUPER_ARC_CODE = x.Field<string>("SUPER_ARC_CODE"),
                                    VENDOR_CLOSE_DATE = x.Field<string>("VENDOR_CLOSE_DATE"),
                                    REQUEST_TYPE = x.Field<string>("REQUEST_TYPE"),
                                    COMPANY = x.Field<string>("COMPANY"),
                                    GPS_CENTER = x.Field<string>("GPS_CENTER"),
                                    CASE_NUMBER = x.Field<string>("CASE_NUMBER"),
                                    REPORTED_PROBLEM_CODE = x.Field<string>("REPORTED_PROBLEM_CODE"),
                                    PROBLEM_DESCRIPTION = x.Field<string>("PROBLEM_DESCRIPTION"),
                                    PROBLEM_TEXT = x.Field<string>("PROBLEM_TEXT"),
                                    SPECIAL_ACCESS = x.Field<string>("SPECIAL_ACCESS"),
                                    SPECIAL_HANDLING = x.Field<string>("SPECIAL_HANDLING"),
                                    CENTER_COMMENTS = x.Field<string>("CENTER_COMMENTS"),
                                    ORIGINATION_DATE = x.Field<string>("ORIGINATION_DATE"),
                                    SUBMISSION_DATE = x.Field<string>("SUBMISSION_DATE"),
                                    SBC_CLOSE_DATE = x.Field<string>("SBC_CLOSE_DATE"),
                                    WorkingDays = x.Field<double?>("WORKING DAYS") == null ? 0 : (int)x.Field<double>("WORKING DAYS"),
                                    TotalDuration = x.Field<double?>("TOTAL DURATION") == null ? 0 : (int)x.Field<double>("TOTAL DURATION"),
                                    MAKE = x.Field<string>("MAKE"),
                                    MODEL = x.Field<string>("MODEL"),
                                    LICENSE = x.Field<string>("LICENSE"),
                                    DATA_MIN = x.Field<string>("DATA_MIN"),
                                    GARAGE_ADDRESS = x.Field<string>("GARAGE_ADDRESS"),
                                    GARAGE_CITY = x.Field<string>("GARAGE_CITY"),
                                    GARAGE_STATE = x.Field<string>("GARAGE_STATE"),
                                    SUPER_LAST_NAME = x.Field<string>("SUPER_LAST_NAME"),
                                    SUPER_TELEPHONE_NUM = x.Field<string>("SUPER_TELEPHONE_NUM"),
                                    SUPER_PAGER_NUM = x.Field<string>("SUPER_PAGER_NUM"),
                                    SUPER_PAGER_PIN = x.Field<string>("SUPER_PAGER_PIN"),
                                    E_MAIL = x.Field<string>("E_MAIL"),
                                    CENTER_LAST_NAME = x.Field<string>("CENTER_LAST_NAME"),
                                    CENTER_TELEPHONE_NUM = x.Field<string>("CENTER_TELEPHONE_NUM"),
                                    CREW_NAME = x.Field<string>("CREW_NAME"),
                                    SCREEN_UUID = x.Field<string>("SCREEN_UUID"),
                                    CLOSE_UUID = x.Field<string>("CLOSE_UUID"),
                                    GATE_CODE = x.Field<string>("GATE_CODE"),
                                    ENTITY_DESCRIPTION = x.Field<string>("ENTITY_DESCRIPTION"),
                                    SUPER_CELLULAR_NUM = x.Field<string>("SUPER_CELLULAR_NUM"),
                                    ORIGINATOR_UUID = x.Field<string>("ORIGINATOR_UUID"),
                                    SUPER_UUID = x.Field<string>("SUPER_UUID"),
                                    GARAGE_ZIP = x.Field<string>("GARAGE_ZIP"),
                                    SUPER_FIRST_NAME = x.Field<string>("SUPER_FIRST_NAME"),
                                    LAST_MODIFIED_UUID = x.Field<string>("LAST_MODIFIED_UUID"),
                                    NO_SHOW_FLAG = x.Field<string>("NO_SHOW_FLAG"),
                                    MODIFICATION_TYPE = x.Field<string>("MODIFICATION_TYPE"),
                                }).ToList();
                    new OWRInfoRepository().Add(OwrInfoRecords);

                    ShowMessage(true, Resources.Messages.ImportRecords_FileUploaded);

                }
                else
                    ShowMessage(false, Resources.Messages.ImportRecords_SelectFile);

            }
            catch (Exception ex)
            {

                ShowMessage(false, ex.Message);
            }
        }
    }
}