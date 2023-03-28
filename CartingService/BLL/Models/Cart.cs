namespace CartingService.BLL.Models;

public class Cart
{
  public int Id { get; private set; } // unique id generated on the client-side
  public List<CartItem> Items { get; set; } // list of items in the cart

  public Cart(int id)
  {
    Id = id;
    Items = new List<CartItem>();
  }
}