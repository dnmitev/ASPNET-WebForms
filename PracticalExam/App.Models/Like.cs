using System.ComponentModel;
namespace App.Models
{
    public class Like
    {
        public int Id { get; set; }

        [DefaultValue(0)]
        public int Value { get; set; }
    }
}