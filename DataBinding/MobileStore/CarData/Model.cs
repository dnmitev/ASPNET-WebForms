namespace MobileStore.CarData
{
    public class Model
    {
        public string Name { get; set; }

        public int Year { get; set; }

        public override string ToString()
        {
            return this.Name.ToString();
        }
    }
}