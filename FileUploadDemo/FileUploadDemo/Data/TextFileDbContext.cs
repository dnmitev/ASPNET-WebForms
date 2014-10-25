namespace FileUploadDemo.Data
{
    using System.Data.Entity;

    public class TextFileDbContext : DbContext
    {
        public TextFileDbContext()
            : base("UploadFilesDb")
        {
        }

        public IDbSet<TextFile> Files { get; set; }
    }
}