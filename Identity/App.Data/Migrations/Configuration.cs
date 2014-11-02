namespace App.Data.Migrations
{
    using App.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            if (!context.Roles.Any(r => r.Name == "Administrator"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Administrator" };

                manager.Create(role);
            }

            if (!context.Roles.Any(r => r.Name == "Moderator"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Moderator" };

                manager.Create(role);
            }

            if (!context.Roles.Any(r => r.Name == "Default"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Default" };

                manager.Create(role);
            }

            if (!context.Users.Any(u => u.UserName == "admin@abv.bg"))
            {
                var store = new UserStore<ApplicationUser>(context);
                var manager = new UserManager<ApplicationUser>(store);
                var user = new ApplicationUser 
                {
                    UserName = "admin@abv.bg",
                    Email = "admin@abv.bg",
                    FirstName = "Pepi",
                    LastName = "The Boss"
                };

                manager.Create(user, "asdasd");
                manager.AddToRole(user.Id, "Administrator");
            }

            if (!context.Users.Any(u => u.UserName == "moderator@abv.bg"))
            {
                var store = new UserStore<ApplicationUser>(context);
                var manager = new UserManager<ApplicationUser>(store);
                var user = new ApplicationUser 
                {
                    UserName = "moderator@abv.bg",
                    Email = "moderator@abv.bg",
                    FirstName = "Gosho",
                    LastName = "Moderatov"
                };

                manager.Create(user, "asdasd");
                manager.AddToRole(user.Id, "Moderator");
            }

            if (!context.Users.Any(u => u.UserName == "user@abv.bg"))
            {
                var store = new UserStore<ApplicationUser>(context);
                var manager = new UserManager<ApplicationUser>(store);
                var user = new ApplicationUser 
                {
                    UserName = "user@abv.bg",
                    Email = "user@abv.bg",
                    FirstName = "Pesho",
                    LastName = "Peshev"
                };

                manager.Create(user, "asdasd");
                manager.AddToRole(user.Id, "Default");
            }

            if (!context.ChatMessages.Any())
            {
                context.ChatMessages.Add(new ChatMessage()
                    {
                        Content = "em Ipsum � ����������� �������� �����, ��������� � ������������ � ������������� ���������. Lorem Ipsum � ������������ �������� �� ����� 1500 ������, ������ ���������� ������� ����� ������� ���������� ����� � �� ���������, �� �� �������� � ��� ����� � �������� ��������. ���� ����� �� ���� � ������ ������ �� 5 ����, �� � �������� � � ������������� �� ���������� ������� ���� � ������� ����� ��� �������. ������������� � ���� 60�� ������ �� 20�� ��� ��� ���������� �� Letraset �����, ��������� Lorem Ipsum ������, ��������� � � � ���� ��� ��� ������� �� ������� ������� ���� Aldus PageMaker, ����� ������� �������� ������ �� Lorem Ipsum.",
                        Author = context.Users.FirstOrDefault(),
                    });

                context.ChatMessages.Add(new ChatMessage()
                {
                    Content = "Lorem ipsum dolor sit amet, veniam propriae honestatis te duo. Cu his alienum tincidunt constituam, erroribus omittantur dissentiet no eos. Pri sale scripta lobortis in, fierent pertinax sententiae eu per. Ea vero torquatos nec, ius affert constituam id, vitae quodsi eam in. Ad justo illum probatus pro. Eam et affert vidisse, sea ne velit debet admodum.",
                    Author = context.Users.FirstOrDefault(),
                });
            }
        }
    }
}