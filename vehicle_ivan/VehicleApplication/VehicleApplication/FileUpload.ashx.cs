﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace VehicleApplication
{
    /// <summary>
    /// Summary description for FileUpload
    /// </summary>
    public class FileUpload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count == 0)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("No files received.");
            }
            else
            {
                Dictionary<string, string> extensions = new Dictionary<string, string>();
                extensions.Add(".jpg", "Image");
                extensions.Add(".png", "Image");
                extensions.Add(".bmp", "Image");
                extensions.Add(".gif", "Image");
                extensions.Add(".mp3", "Audio");
                extensions.Add(".wav", "Audio");
                extensions.Add(".mp4", "Video");
                extensions.Add(".flv", "Video");
                extensions.Add(".pdf", "PDF");
                extensions.Add(".txt", "Text Document");
                extensions.Add(".doc", "Word Document");
                extensions.Add(".docx", "Word Document");
                extensions.Add(".xls", "Excel Document");
                extensions.Add(".xlsx", "Excel Document");
                HttpPostedFile uploadedfile = context.Request.Files[0];

                string URL = new Random().Next() + uploadedfile.FileName;
                string ext = Path.GetExtension(uploadedfile.FileName) + "";
                ext = ext.ToLower();
                string type = "";
                if (extensions.ContainsKey(ext))
                    type = extensions[ext];
                else
                    type = "Other";
                string FileName = Path.GetFileNameWithoutExtension(uploadedfile.FileName);
                if (FileName.Length > 35)
                {
                    FileName = FileName.Substring(0, 35);
                }
                string FileType = uploadedfile.ContentType;
                int FileSize = uploadedfile.ContentLength;
                string dir = HttpContext.Current.Server.MapPath("/TempFiles");
                ClearDirectory(dir);
                uploadedfile.SaveAs(dir + "\\" + URL);
                context.Response.ContentType = "text/plain";
                context.Response.Write("{\"name\":\"" + FileName + "\",\"ext\":\"" + ext + "\",\"url\":\"" + URL + "\",\"type\":\"" + type + "\",\"size\":\"" + ToFileSize(FileSize) + "\"}");

            }

        }
        public void ClearDirectory(string dirPath)
        {
            DateTime d = DateTime.Now;
            foreach (var file in new DirectoryInfo(dirPath).GetFiles())
            {
                if (d.Subtract(file.CreationTime).TotalMinutes > 5)
                {
                    try
                    {
                        file.Delete();
                    }
                    catch (Exception)
                    {
                    }
                }
            }

        }
        public string ToFileSize(long source)
        {
            const int byteConversion = 1024;
            double bytes = Convert.ToDouble(source);

            if (bytes >= Math.Pow(byteConversion, 3)) //GB Range
            {
                return string.Concat(Math.Round(bytes / Math.Pow(byteConversion, 3), 2), " GB");
            }
            else if (bytes >= Math.Pow(byteConversion, 2)) //MB Range
            {
                return string.Concat(Math.Round(bytes / Math.Pow(byteConversion, 2), 2), " MB");
            }
            else if (bytes >= byteConversion) //KB Range
            {
                return string.Concat(Math.Round(bytes / byteConversion, 2), " KB");
            }
            else //Bytes
            {
                return string.Concat(bytes, " Bytes");
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}