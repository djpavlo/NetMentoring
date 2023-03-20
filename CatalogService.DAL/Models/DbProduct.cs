using CatalogService.DAL.Models;

public class DbProduct
{
  public int Id { get; set; }
  public string Name { get; set; }
  public string Description { get; set; }
  public string ImageUrl { get; set; }
  public DbCategory Category { get; set; }
  public decimal Price { get; set; }
  public int Amount { get; set; }
}