namespace UserControls
{
    using System;
    using System.Linq;

    public class MenuItem
    {
        public MenuItem(string name, string url, string fontColor = "")
        {
            this.Name = name;
            this.Url = url;
            this.FontColor = fontColor;
        }

        public string Name { get; set; }

        public string Url { get; set; }

        public string FontColor { get; set; }

        public override string ToString()
        {
            return this.Name.ToString();
        }
    }
}