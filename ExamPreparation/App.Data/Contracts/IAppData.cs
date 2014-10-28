namespace App.Data.Contracts
{
    using System;
    using System.Linq;

    using App.Models;

    public interface IAppData
    {
        IGenericRepository<ApplicationUser> Users { get; }

        IGenericRepository<Book> Books { get; }

        IGenericRepository<Category> Categories { get; }

        void SaveChanges();
    }
}