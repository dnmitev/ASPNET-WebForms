namespace MobileStore.CarData
{
    using System.Collections.Generic;

    public class Manufacturer
    {
        public string Name { get; set; }

        public ICollection<Model> Models { get; set; }

        public Manufacturer()
        {
            this.Models = new HashSet<Model>();
        }

        public override string ToString()
        {
            return this.Name.ToString();
        }
    }
}