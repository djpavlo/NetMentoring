namespace CatalogService.Domain.Models;

public class Category
{
  public int Id { get; set; }
  public string? Name { get; set; }
  public string? ImageUrl { get; set; }
  public Category? ParentCategory { get; set; }

  public void Validate()
  {
    if (string.IsNullOrWhiteSpace(Name))
      throw new ArgumentException("Category name is required");

    if (Name.Length > 50)
      throw new ArgumentException("Category name cannot be longer than 50 characters");

    if (!string.IsNullOrWhiteSpace(ImageUrl) && !Uri.IsWellFormedUriString(ImageUrl, UriKind.Absolute))
      throw new ArgumentException("Image url is not valid");
  }
}