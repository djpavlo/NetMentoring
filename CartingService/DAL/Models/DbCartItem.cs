namespace CartingService.DAL.Models;

public class DbCartItem
{
  /// <summary>
  /// Gets or sets the cart item ID.
  /// </summary>
  public int Id { get; set; }

  /// <summary>
  /// Gets or sets the cart item name.
  /// </summary>
  public string Name { get; set; }

  /// <summary>
  /// Gets or sets the cart item image.
  /// </summary>
  public DbCartItemImage? Image { get; set; }

  /// <summary>
  /// Gets or sets the cart item price.
  /// </summary>
  public decimal Price { get; set; }

  /// <summary>
  /// Gets or sets the cart item quantity.
  /// </summary>
  public int Quantity { get; set; }
}