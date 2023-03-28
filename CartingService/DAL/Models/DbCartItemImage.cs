namespace CartingService.DAL.Models;

public class DbCartItemImage
{
  public string Url { get; set; } // URL of the image
  public string AltText { get; set; } // alt text for the image

  public DbCartItemImage(string url, string altText)
  {
    Url = url;
    AltText = altText;
  }
}