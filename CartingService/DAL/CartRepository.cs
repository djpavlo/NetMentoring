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

  /// <summary>
  /// Updates item price in all carts.
  /// </summary>
  /// <param name="itemId">The item ID.</param>
  /// <param name="price">The new price.</param>
  /// <returns>The number of updated items.</returns>
  public int UpdateProductPrice(int itemId, decimal price)
  {
    var carts = _db.GetCollection<DbCart>(_dbColName).FindAll();
    var updatedItems = 0;
    foreach (var cart in carts)
    {
      foreach (var item in cart.Items.Where(x => x.Id == itemId))
      {
        item.Price = price;
        updatedItems++;
      }

      _db.GetCollection<DbCart>(_dbColName).Update(cart);
    }
    return updatedItems;
  }
}