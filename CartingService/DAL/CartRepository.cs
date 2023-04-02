using CartingService.DAL.Models;
using LiteDB;

namespace CartingService.DAL;

public class CartRepository : ICartRepository
{
  private const string _dbColName = "carts";
  private LiteDatabase _db;
  public CartRepository(string dbPath)
  {
    _db = new LiteDatabase(dbPath);
  }

  public void AddCartItem(Guid cartGuid, DbCartItem cartItem)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Guid == cartGuid);
    if (cart == null)
    {
      cart = new DbCart { Guid = cartGuid };
      _db.GetCollection<DbCart>(_dbColName).Insert(cart);
    }
    
    cart.Items.Add(cartItem);
    _db.GetCollection<DbCart>(_dbColName).Update(cart);
  }

  public DbCart GetCartItemList(Guid cartGuid)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Guid == cartGuid);
    return cart;
  }

  public void RemoveCartItem(Guid cartGuid, int cartItemId)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Guid == cartGuid);
    cart.Items.RemoveAll(ci => ci.Id == cartItemId);
    _db.GetCollection<DbCart>(_dbColName).Update(cart);    
  }

}