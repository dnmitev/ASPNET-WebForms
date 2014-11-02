namespace App.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;

    public class ChatMessage
    {
        public int Id { get; set; }

        [Required]
        public string Content { get; set; }

        public string AuthorId { get; set; }

        public virtual ApplicationUser Author { get; set; }
    }
}