namespace CartingService.BLL.Models;

public class Cart
{
  public string Guid { get; private set; } // unique id generated on the client-side
  public List<CartItem> Items { get; set; } // list of items in the cart

  public Cart(string guid)
  {
    Guid = guid;
    Items = new List<CartItem>();
  }
}