using App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web
{
    public partial class Home : BasePage
    {
        private const int DefaultPopularArticlesCount = 3;
        private const int DefaultLatestArticlesCount = 3;

        public IQueryable<Article> ListViewPopularArticles_GetData()
        {
            return this.Data.Articles
                       .All()
                       .OrderByDescending(a => a.Likes.Value)
                       .Take(DefaultPopularArticlesCount);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Category> ListViewCategories_GetData()
        {
            return this.Data.Categories
                       .All()
                       .OrderBy(c => c.Name);
        }
    }
}