namespace CatalogService.Domain.Models;

public class ProductItem
{
  public int Id { get; set; }
  public string? Name { get; set; }
  public string? Description { get; set; }
  public string? ImageUrl { get; set; }
  public Category? Category { get; set; }
  public decimal? Price { get; set; }
  public int? Amount { get; set; }

  public void Validate()
  {
    if (string.IsNullOrWhiteSpace(Name))
      throw new ArgumentException("Product name is required");

    if (Name.Length > 50)
      throw new ArgumentException("Product name cannot be longer than 50 characters");

    if (!string.IsNullOrWhiteSpace(ImageUrl) && !Uri.IsWellFormedUriString(ImageUrl, UriKind.Absolute))
      throw new ArgumentException("Image url is not valid");

    if (Category == null)
      throw new ArgumentException("Category is required");

    if (Price == null)
      throw new ArgumentException("Price is required");

    if (Amount == null)
      throw new ArgumentException("Amount is required");


  }
}