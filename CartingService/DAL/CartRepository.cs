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

  public void AddCartItem(int cartId, DbCartItem cartItem)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Id == cartId);
    cart.Items.Add(cartItem);
    _db.GetCollection<DbCart>(_dbColName).Update(cart);
  }

  public DbCart GetCartItemList(int cartId)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Id == cartId);
    return cart;
  }

  public void RemoveCartItem(int cartId, int cartItemId)
  {
    var cart = _db.GetCollection<DbCart>(_dbColName).FindOne(c => c.Id == cartId);
    cart.Items.RemoveAll(ci => ci.Id == cartItemId);
    _db.GetCollection<DbCart>(_dbColName).Update(cart);    
  }

}