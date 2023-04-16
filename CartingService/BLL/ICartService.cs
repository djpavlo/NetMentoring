using CartingService.BLL.Models;

namespace CartingService.BLL
{
  public interface ICartService
  {
    /// <summary>
    /// Gets the cart items.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <returns>The cart items.</returns>
    void AddCartItem(string cartGuid, CartItem cartItem);

    /// <summary>
    /// Adds a cart item.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <param name="cartItem">The cart item.</param>
    Cart GetCartItems(string cartGuid);

    /// <summary>
    /// Removes a cart item.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <param name="cartItemId">The cart item ID.</param>
    void RemoveCartItem(string cartGuid, int cartItemId);

    /// <summary>
    /// Update Product item price in all carts.
    ///   </summary>
    /// <param name="productId">The product ID.</param>
    /// <param name="price">The new price.</param>
    /// <returns>The number of updated carts.</returns>
    int UpdateProductPrice(int productId, decimal price);
  }
}