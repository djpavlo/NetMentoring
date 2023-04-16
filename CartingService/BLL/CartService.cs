using CartingService.DAL;
using AutoMapper;
using CartingService.DAL.Models;
using CartingService.BLL.Models;

namespace CartingService.BLL
{
  public class CartService : ICartService
  {
    private readonly ICartRepository _cartRepository;
    private readonly Mapper _cartMapper;

    /// <summary>
    /// Initializes a new instance of the <see cref="CartService"/> class.
    /// </summary>
    /// <param name="cartRepository">The cart repository.</param>
    public CartService(ICartRepository cartRepository)
    {
      _cartRepository = cartRepository;

      var config = new MapperConfiguration(cfg =>
      {
        cfg.CreateMap<DbCartItem, CartItem>().ReverseMap();
        cfg.CreateMap<DbCart, Cart>().ReverseMap();
        cfg.CreateMap<DbCartItemImage, CartItemImage>().ReverseMap();
      });
      _cartMapper = new Mapper(config);
    }

    /// <summary>
    /// Gets the cart items.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <returns>The cart items.</returns>
    public Cart GetCartItems(string cartGuid)
    {
      var guid = new Guid(cartGuid);
      var cartFromDb = _cartRepository.GetCartItemList(guid);
      var cart = _cartMapper.Map<Cart>(cartFromDb);
      return cart;
    }

    /// <summary>
    /// Adds a cart item.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <param name="cartItem">The cart item.</param>
    public void AddCartItem(string cartGuid, CartItem cartItem)
    {
      var guid = new Guid(cartGuid);
      var cartItemToAdd = _cartMapper.Map<DbCartItem>(cartItem);
      _cartRepository.AddCartItem(guid, cartItemToAdd);
    }

    /// <summary>
    /// Removes a cart item.
    /// </summary>
    /// <param name="cartGuid">The cart GUID.</param>
    /// <param name="cartItemId">The cart item ID.</param>
    public void RemoveCartItem(string cartGuid, int cartItemId)
    {
      var guid = new Guid(cartGuid);
      _cartRepository.RemoveCartItem(guid, cartItemId);
    }
    
    /// <summary>
    /// Update Product item price in all carts.
    ///   </summary>
    /// <param name="productId">The product ID.</param>
    /// <param name="price">The new price.</param>
    /// <returns>The number of updated carts.</returns>
    public int UpdateProductPrice(int productId, decimal price)
    {
      return _cartRepository.UpdateProductPrice(productId, price);
    }
  }
}
