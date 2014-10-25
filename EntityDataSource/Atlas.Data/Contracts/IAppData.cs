namespace Atlas.Data.Contracts
{
    using System;
    using System.Linq;

    using Atlas.Models;

    public interface IAppData
    {
        IGenericRepository<Country> Countries { get; }

        IGenericRepository<Town> Towns { get; }

        IGenericRepository<Continent> Continents { get; }

        IGenericRepository<Language> Languages { get; }

        void SaveChanges();
    }
}