namespace FileUploadDemo
{
    using System;
    using System.IO;
    using System.Text;
    using System.Web;
    
    using FileUploadDemo.Data;
    
    using Ionic.Zip;
    
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = -1;
            try
            {
                HttpPostedFile file = Request.Files["uploaded"];

                ZipFile zipFile = ZipFile.Read(file.InputStream);
                StringBuilder zipContent = new StringBuilder();
                foreach (var zipEntry in zipFile.Entries)
                {
                    var memoryStream = new MemoryStream();
                    zipEntry.Extract(memoryStream);

                    memoryStream.Position = 0;

                    using (var reader = new StreamReader(memoryStream, Encoding.UTF8))
                    {
                        zipContent.AppendLine(reader.ReadToEnd());
                    }
                }

                var db = new TextFileDbContext();
                db.Files.Add(new FileUploadDemo.Data.TextFile()
                {
                    Content = zipContent.ToString()
                });

                db.SaveChanges();

                Response.ContentType = "application/json";
                Response.Write("{}");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}