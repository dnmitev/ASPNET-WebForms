namespace App.Web.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.Linq.Expressions;

    using App.Models;

    public class ArticleViewModel
    {
        private const int DefaultContentLength = 300;

        public static Expression<Func<Article, ArticleViewModel>> FromArticle
        {
            get
            {
                return a => new ArticleViewModel()
                {
                    Id = a.Id,
                    Title = a.Title,
                    Content = a.Content.Substring(0, DefaultContentLength) + "...",
                    FullContent = a.Content,
                    Date = a.DateCreated,
                    Likes = a.Likes.Value,
                    Author = a.Author.UserName,
                    Category = a.Category.Name
                };
            }
        }

        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        public string FullContent { get; set; }

        public string Author { get; set; }

        public DateTime Date { get; set; }

        public string Category { get; set; }

        public int Likes { get; set; }
    }
}