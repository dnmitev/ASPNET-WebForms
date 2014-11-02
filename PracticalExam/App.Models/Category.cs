namespace App.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Category
    {
        private ICollection<Article> articles;

        public Category()
        {
            this.Articles = new HashSet<Article>();
        }

        public int Id { get; set; }

        [Required]
        [MinLength(2)]
        public string Name { get; set; }

        public virtual ICollection<Article> Articles
        {
            get
            {
                return this.articles;
            }

            set
            {
                this.articles = value;
            }
        }
    }
}