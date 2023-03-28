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
            
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<DbCartItem, CartItem>().ReverseMap();
                cfg.CreateMap<DbCart, Cart>().ReverseMap();
                cfg.CreateMap<DbCartItemImage, CartItemImage>().ReverseMap();
            });
            _cartMapper = new Mapper(config);
        }

        public Cart GetCartItems(int cartId)
        {
            var cartFromDb = _cartRepository.GetCartItemList(cartId);
            var cart = _cartMapper.Map<Cart>(cartFromDb);
            return cart;
        }

        public void AddCartItem(int cartId, CartItem cartItem)
        {         
            var cartItemToAdd = _cartMapper.Map<DbCartItem>(cartItem);
            _cartRepository.AddCartItem(cartId, cartItemToAdd);
        }

        public void RemoveCartItem(int cartId, int cartItemId)
        {
            _cartRepository.RemoveCartItem(cartId, cartItemId);
        }
    }
}
