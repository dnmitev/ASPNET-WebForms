namespace Atlas.Data.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Atlas.Models;

    public sealed class Configuration : DbMigrationsConfiguration<Atlas.Data.ApplicationDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(Atlas.Data.ApplicationDbContext context)
        {
            //context.Countries.AddOrUpdate(
            //    new Country { Name = "Bulgaria", Continent = Continent.Europe, Language = Language.Bulgarian, Population = 6000000 },
            //    new Country { Name = "United Kingdom", Continent = Continent.Europe, Language = Language.English, Population = 60000000 },
            //    new Country { Name = "Germany", Continent = Continent.Europe, Language = Language.Deutch, Population = 80000000 },
            //    new Country { Name = "Brazil", Continent = Continent.SouthAmerica, Language = Language.Chineese, Population = 1200000000 });

            //context.SaveChanges();

            //context.Towns.AddOrUpdate(
            //    new Town { Name = "Sofia", Country = context.Countries.FirstOrDefault(c => c.Name == "Bulgaria"), Population = 2000000 },
            //    new Town { Name = "Plovdiv", Country = context.Countries.FirstOrDefault(c => c.Name == "Bulgaria"), Population = 400000 },
            //    new Town { Name = "Munich", Country = context.Countries.FirstOrDefault(c => c.Name == "Germany"), Population = 5000000 },
            //    new Town { Name = "London", Country = context.Countries.FirstOrDefault(c => c.Name == "United Kingdom"), Population = 10000000 }
            //    );

            //context.SaveChanges();
        }
    }
}