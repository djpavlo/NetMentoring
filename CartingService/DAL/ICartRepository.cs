using CartingService.DAL.Models;

namespace CartingService.DAL;

public interface ICartRepository
{
  DbCart GetCartItemList(int cartId);
  void AddCartItem(int cartId, DbCartItem cartItem);
  void RemoveCartItem(int cartId, int cartItemId);
}
