namespace App.Data
{
    using System.Data.Entity;
    using Microsoft.AspNet.Identity.EntityFramework;

    using App.Models;
    using App.Data.Migrations;
    
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ApplicationDbContext, Configuration>());
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        public IDbSet<ChatMessage> ChatMessages { get; set; }
    }
}