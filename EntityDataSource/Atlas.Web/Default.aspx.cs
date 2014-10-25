using Atlas.Data;
using Atlas.Data.Contracts;
using Atlas.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using Microsoft.AspNet.EntityDataSource;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Atlas.Web
{
    public partial class Default : System.Web.UI.Page
    {
        private IAppData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new AppData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack && this.data.Countries.All().Count() == 0 && this.data.Towns.All().Count() == 0)
            {
                SeedData();
            }
        }

        protected void Get_Data(object sender,
            Microsoft.AspNet.EntityDataSource.EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new ApplicationDbContext();
            var context = (db as IObjectContextAdapter).ObjectContext;
            e.Context = context;
        }

        private void SeedData()
        {
            AddContinents();
            AddLanguages();
            AddCountry();
            AddTowns();
        }
 
        private void AddTowns()
        {
            var towns = new List<Town>()
            {
                new Town
                {
                    Name = "Plovdiv",
                    Country = this.data.Countries.All().FirstOrDefault(c => c.Name == "Bulgaria"),
                    Population = 450000
                },
                new Town
                {
                    Name = "Munich",
                    Country = this.data.Countries.All().FirstOrDefault(c => c.Name == "Germany"),
                    Population = 2500000
                },
                new Town
                {
                    Name = "Pekin",
                    Country = this.data.Countries.All().FirstOrDefault(c => c.Name == "China"),
                    Population = 25800000
                }
            };

            foreach (var town in towns)
            {
                this.data.Towns.Add(town);
            }

            this.data.SaveChanges();
        }

        private void AddLanguages()
        {
            var languages = new List<Language>()
            {
                new Language { Name = "Bulgarian" },
                new Language { Name = "English" },
                new Language { Name = "Mandarin" },
                new Language { Name = "Russian" },
                new Language { Name = "German" },
                new Language { Name = "French" }
            };

            foreach (var language in languages)
            {
                this.data.Languages.Add(language);
            }

            this.data.SaveChanges();
        }

        private void AddCountry()
        {
            var countries = new List<Country>()
            {
                new Country
                {
                    Name = "Bulgaria",
                    Continent = this.data.Continents.All().FirstOrDefault(c => c.Name == "Europe"),
                    Population = 6000000,
                    Language = this.data.Languages.All().FirstOrDefault(l => l.Name == "Bulgarian")
                },
                new Country
                {
                    Name = "Germany",
                    Continent = this.data.Continents.All().FirstOrDefault(c => c.Name == "Europe"),
                    Population = 80000000,
                    Language = this.data.Languages.All().FirstOrDefault(l => l.Name == "German")
                },
                new Country
                {
                    Name = "France",
                    Continent = this.data.Continents.All().FirstOrDefault(c => c.Name == "Europe"),
                    Population = 60000000,
                    Language = this.data.Languages.All().FirstOrDefault(l => l.Name == "French")
                },
                new Country
                {
                    Name = "China",
                    Continent = this.data.Continents.All().FirstOrDefault(c => c.Name == "Asia"),
                    Population = 1200000000,
                    Language = this.data.Languages.All().FirstOrDefault(l => l.Name == "Mandarin")
                },
                new Country
                {
                    Name = "South Africa",
                    Continent = this.data.Continents.All().FirstOrDefault(c => c.Name == "Africa"),
                    Population = 65000000,
                    Language = this.data.Languages.All().FirstOrDefault(l => l.Name == "English")
                }
            };

            foreach (var contry in countries)
            {
                this.data.Countries.Add(contry);
            }

            this.data.SaveChanges();
        }

        private void AddContinents()
        {
            var continents = new List<Continent>()
            {
                new Continent { Name = "Africa" },
                new Continent { Name = "Asia" },
                new Continent { Name = "Antarctica" },
                new Continent { Name = "Australia" },
                new Continent { Name = "Europe" },
                new Continent { Name = "North America" },
                new Continent { Name = "South America" }
            };

            foreach (var continent in continents)
            {
                this.data.Continents.Add(continent);
            }

            this.data.SaveChanges();
        }
    }
}