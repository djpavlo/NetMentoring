using CartingService.DAL.Models;

namespace CartingService.DAL;

public interface ICartRepository
{
  DbCart GetCartItemList(Guid cartGuid);
  void AddCartItem(Guid cartGuid, DbCartItem cartItem);
  void RemoveCartItem(Guid cartGuid, int cartItemId);
}
