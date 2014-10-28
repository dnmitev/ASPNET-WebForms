namespace App.Web
{
    using App.Data;
    using App.Data.Contracts;
    using App.Models;
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Web;
    using System.Web.ModelBinding;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class Search : System.Web.UI.Page
    {
        private IAppData data;

        public Search()
        {
            this.data = new AppData();
        }

        public IEnumerable<Book> SearchResult_GetData([QueryString("q")]string query)
        {
            this.SearchQueryLiteral.Text = string.Format("“{0}”:", query);

            IQueryable<Book> books;
            if (!string.IsNullOrEmpty(query))
            {
                books = this.data.Books
                            .All()
                            .Where(b => b.Title.Contains(query) || b.Author.Contains(query))
                            .OrderBy(b => b.Title)
                            .ThenBy(b => b.Author);
            }
            else
            {
                books = this.data.Books
                            .All()
                            .OrderBy(b => b.Title)
                            .ThenBy(b => b.Author);
            }

            return books;
        }

        public string GetTitle(Book book)
        {
            return string.Format("“{0}” <i>by {1}</i>", Server.HtmlEncode(book.Title), Server.HtmlEncode(book.Author));
        }
    }
}