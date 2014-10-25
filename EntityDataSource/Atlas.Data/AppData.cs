namespace Atlas.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;

    using Atlas.Data.Contracts;
    using Atlas.Data.Repositories;
    using Atlas.Models;

    /// <summary>
    /// Unit of work
    /// </summary>
    public class AppData : IAppData
    {
        private readonly DbContext context;
        private readonly IDictionary<Type, object> repositories;

        public AppData()
            : this(new ApplicationDbContext())
        {
        }

        public AppData(DbContext context)
        {
            this.context = context;
            this.repositories = new Dictionary<Type, object>();
        }

        public IGenericRepository<Continent> Continents
        {
            get
            {
                return this.GetRepository<Continent>();
            }
        }

        public IGenericRepository<Country> Countries
        {
            get
            {
                return this.GetRepository<Country>();
            }
        }

        public IGenericRepository<Language> Languages
        {
            get
            {
                return this.GetRepository<Language>();
            }
        }

        public IGenericRepository<Town> Towns
        {
            get
            {
                return this.GetRepository<Town>();
            }
        }
        
        public void SaveChanges()
        {
            this.context.SaveChanges();
        }

        private IGenericRepository<T> GetRepository<T>() where T : class
        {
            var typeOfModel = typeof(T);
            if (!this.repositories.ContainsKey(typeOfModel))
            {
                var type = typeof(GenericRepository<T>);
                this.repositories.Add(typeOfModel, Activator.CreateInstance(type, this.context));
            }

            return (IGenericRepository<T>)this.repositories[typeOfModel];
        }
    }
}