namespace PhotoAlbum
{
    public partial class Default : System.Web.UI.Page
    {
        [System.Web.Services.WebMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            var imgSlider = new AjaxControlToolkit.Slide[5];

            imgSlider[1] = new AjaxControlToolkit.Slide("images/emiliq.jpg", "Емилия", "top mrusnica");
            imgSlider[2] = new AjaxControlToolkit.Slide("images/aneliq.jpg", "Анелия", "top mrusnica");
            imgSlider[3] = new AjaxControlToolkit.Slide("images/gloria.jpg", "Глория", "top mrusnica");
            imgSlider[4] = new AjaxControlToolkit.Slide("images/preslava.jpg", "Преслава", "top mrusnica");

            return imgSlider;
        }
    }
}