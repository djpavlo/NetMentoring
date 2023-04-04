namespace CartingService.DAL.Models;

public class DbCartItemImage
{
  /// <summary>
  /// Gets or sets the URL of the image.
  /// </summary>
  public string Url { get; set; } 

  /// <summary>
  /// Gets or sets the alt text of the image.
  /// </summary>
  public string AltText { get; set; } 

  /// <summary>
  /// Initializes a new instance of the <see cref="DbCartItemImage"/> class.
  /// </summary>
  public DbCartItemImage(string url, string altText)
  {
    Url = url;
    AltText = altText;
  }
}