using CartingService.BLL.Models;

namespace CartingService.BLL
{
    public interface ICartService
    {
        void AddCartItem(string cartGuid, CartItem cartItem);
        Cart GetCartItems(string cartGuid);
        void RemoveCartItem(string cartGuid, int cartItemId);
    }
}