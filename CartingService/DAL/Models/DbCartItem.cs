namespace CartingService.DAL.Models;

public class DbCartItem
{
  public int Id { get; set; }
  public string Name { get; set; }
  public DbCartItemImage? Image { get; set; }
  public decimal Price { get; set; }
  public int Quantity { get; set; }
}