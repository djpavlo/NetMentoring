using CartingService.DAL.Models;
using LiteDB;

namespace CartingService.DAL;

public class DbCart
{
  [BsonId]
  public Guid Guid { get; set; }
  public List<DbCartItem> Items { get; set; }
  public DbCart()
  {
    Items = new List<DbCartItem>();
  }
}