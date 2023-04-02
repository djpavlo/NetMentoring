using CartingService.DAL;
using AutoMapper;
using CartingService.DAL.Models;
using CartingService.BLL.Models;

namespace CartingService.BLL
{
  public class CartService : ICartService
  {
    private readonly ICartRepository _cartRepository;
    private Mapper _cartMapper;

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

    public Cart GetCartItems(string cartGuid)
    {
      var guid = new Guid(cartGuid);
      var cartFromDb = _cartRepository.GetCartItemList(guid);
      var cart = _cartMapper.Map<Cart>(cartFromDb);
      return cart;
    }

    public void AddCartItem(string cartGuid, CartItem cartItem)
    {
      var guid = new Guid(cartGuid);
      var cartItemToAdd = _cartMapper.Map<DbCartItem>(cartItem);
      _cartRepository.AddCartItem(guid, cartItemToAdd);
    }

    public void RemoveCartItem(string cartGuid, int cartItemId)
    {
      var guid = new Guid(cartGuid);
      _cartRepository.RemoveCartItem(guid, cartItemId);
    }
  }
}
