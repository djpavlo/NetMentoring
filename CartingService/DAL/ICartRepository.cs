using CartingService.DAL.Models;

namespace CartingService.DAL;

public interface ICartRepository
{
  /// <summary>
  /// Gets the cart items.
  /// </summary>
  /// <param name="cartGuid">The cart GUID.</param>
  /// <returns>The cart items.</returns>
  DbCart GetCartItemList(Guid cartGuid);

  /// <summary>
  /// Adds a cart item.
  /// </summary>
  /// <param name="cartGuid">The cart GUID.</param>
  /// <param name="cartItem">The cart item.</param>
  void AddCartItem(Guid cartGuid, DbCartItem cartItem);

  /// <summary>
  /// Removes a cart item.
  /// </summary>
  /// <param name="cartGuid">The cart GUID.</param>
  /// <param name="cartItemId">The cart item ID.</param>
  void RemoveCartItem(Guid cartGuid, int cartItemId);
  
  /// <summary>
  /// Updates item price in all carts.
  /// </summary>
  /// <param name="itemId">The item ID.</param>
  /// <param name="price">The new price.</param>
  /// <returns>The number of updated items.</returns>
  int UpdateProductPrice(int itemId, decimal price);
}
