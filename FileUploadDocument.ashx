<%@ WebHandler Language="C#" Class="FileUploadDocument" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Text.RegularExpressions;

public class FileUploadDocument : IHttpHandler
{
    Random rnd = new Random();

    public void ProcessRequest(HttpContext context)
    {
        string returnString = "";
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string fname;
                string ext = "";
                if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                {
                    string[] testfiles = file.FileName.Split(new char[] { ',' });
                    fname = testfiles[testfiles.Length - 1];
                }
                else
                {
                    fname = file.FileName;
                }
                ext = Path.GetExtension(fname);
                fname = "~/Documents/" + DateTime.Now.ToString("yymmddHHMMss") + rnd.Next(1, 999999) + ext;
                //         fname = Path.Combine(context.Server.MapPath(), fname);
                string targetPath = context.Server.MapPath(fname);
                Stream strm = file.InputStream;
                var targetFile = targetPath;

                file.SaveAs(targetFile);
                if (returnString == "")
                {
                    returnString = fname;
                }
                else
                {
                    returnString = returnString + ";" + fname;
                }
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(returnString);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}