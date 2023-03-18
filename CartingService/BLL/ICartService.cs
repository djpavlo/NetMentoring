using CartingService.BLL.Models;

namespace CartingService.BLL
{
    public interface ICartService
    {
        void AddCartItem(int cartId, CartItem cartItem);
        Cart GetCartItems(int cartId);
        void RemoveCartItem(int cartId, int cartItemId);
    }
}