namespace CartingService.BLL.Models;

public class CartItemImage
{
  public string Url { get; set; } // URL of the image
  public string AltText { get; set; } // alt text for the image

  public CartItemImage(string url, string altText)
  {
    Url = url;
    AltText = altText;
  }

  public override bool Equals(object? obj)
  {
    return obj is CartItemImage image &&
           Url == image.Url &&
           AltText == image.AltText;
  }

  public override int GetHashCode()
  {
    return HashCode.Combine(Url, AltText);
  }
}