namespace MobileStore
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    
    using MobileStore.CarData;

    public partial class MobileTrader : System.Web.UI.Page
    {
        private List<Manufacturer> manufacturers;
        private List<Extra> extras;
        private string[] engines = { "Petrol", "Diesel", "Gas", "Electricity" };
        private string selectedManufacturer;
        private string selectedModel;

        protected void Page_Load(object sender, EventArgs e)
        {
            manufacturers = FillCarData();

            if (!Page.IsPostBack)
            {
                selectedManufacturer = manufacturers.FirstOrDefault().Name;
                this.ManufacturerList.DataSource = manufacturers.Select(m => m.Name);

                this.ExtrasList.DataSource = extras.Select(ex => ex.Name);
                this.EngineList.DataSource = engines;

                GetCurrentModels();
            }
        }

        private void GetCurrentModels()
        {
            var models = manufacturers.FirstOrDefault(m => m.Name == selectedManufacturer).Models.Select(mod => mod.Name).ToList();
            this.ModelsList.DataSource = models;

            this.DataBind();
        }

        private List<Manufacturer> FillCarData()
        {
            manufacturers = new List<Manufacturer>();
            extras = new List<Extra>
            {
                new Extra { Name = "LPG" },
                new Extra { Name = "Buy Back" },
                new Extra { Name = "Wrong Wheel" },
                new Extra { Name = "4x4" },
                new Extra { Name = "Taxi" },
            };

            var mercedesModels = new HashSet<Model>
            {
                new Model() { Name = "C320 AMG" },
                new Model() { Name = "CLA45 AMG" },
                new Model() { Name = "CLS500" },
                new Model() { Name = "E65 AMG" }
            };

            var audiModels = new HashSet<Model>
            {
                new Model() { Name = "A4" },
                new Model() { Name = "A8 W12" },
                new Model() { Name = "Q7" }
            };

            var opelModels = new HashSet<Model>
            {
                new Model() { Name = "Astra" },
                new Model() { Name = "Insignia" },
                new Model() { Name = "Vectra" }
            };

            manufacturers.Add(new Manufacturer() { Name = "Mercedes", Models = mercedesModels });
            manufacturers.Add(new Manufacturer() { Name = "Audi", Models = audiModels });
            manufacturers.Add(new Manufacturer() { Name = "Opel", Models = opelModels });

            return manufacturers;
        }

        protected void ManufacturerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedManufacturer = this.ManufacturerList.SelectedValue;
            this.GetCurrentModels();
        }

        protected void ModelsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedModel = this.ModelsList.SelectedValue;
        }

        protected void SubmitDetails_Click(object sender, EventArgs e)
        {
            selectedManufacturer = this.ManufacturerList.SelectedItem.Text;
            selectedModel = this.ModelsList.SelectedItem.Text;
            var extras = this.ExtrasList.Items;
            var selectedEngine = this.EngineList.SelectedItem.Text;
            var selectedExtras = new List<string>();

            foreach (ListItem extra in extras)
            {
                if (extra.Selected)
                {
                    selectedExtras.Add(extra.Value);
                }
            }

            this.CarDetails.Text = string.Format("Manufacturer: {0}; Model{1}; tEngines: {2}; Extras: {3}",
                selectedManufacturer, selectedModel, selectedEngine, string.Join(" ", selectedExtras));
        }
    }
}