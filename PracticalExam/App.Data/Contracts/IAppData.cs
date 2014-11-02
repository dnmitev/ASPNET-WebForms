namespace App.Data.Contracts
{
    using System;
    using System.Linq;

    using App.Models;

    public interface IAppData
    {
        IGenericRepository<ApplicationUser> Users { get; }

        IGenericRepository<Article> Articles { get; }

        IGenericRepository<Category> Categories { get; }

        IGenericRepository<Like> Likes { get; }

        void SaveChanges();
    }
}