using CartingService.DAL.Models;
using LiteDB;

namespace CartingService.DAL;

public class DbCart
{
  /// <summary>
  /// Gets or sets the cart ID.
  /// </summary>
  [BsonId]
  public Guid Guid { get; set; }

  /// <summary>
  /// Gets or sets the cart items.
  /// </summary>
  public List<DbCartItem> Items { get; set; }

  /// <summary>
  /// Initializes a new instance of the <see cref="DbCart"/> class.
  /// </summary>
  public DbCart()
  {
    Items = new List<DbCartItem>();
  }
}