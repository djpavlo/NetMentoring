using CartingService.DAL.Models;

namespace CartingService.DAL;

public class DbCart
{
  public int Id { get; set; }
  public List<DbCartItem> Items { get; set; }
  public DbCart()
  {
    Items = new List<DbCartItem>();
  }
}