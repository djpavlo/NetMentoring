namespace CartingService.BLL.Models;

public class CartItem
{
  public int Id { get; set; } // id of the item in external system
  public string Name { get; set; } // plain text name of the item
  public CartItemImage? Image { get; set; } // optional image of the item (URL and alt text)
  public decimal Price { get; set; } // price of the item (money)
  public int Quantity { get; set; } // quantity of items in the cart

  public CartItem(int id, string name, CartItemImage? image, decimal price, int quantity)
  {
    if (string.IsNullOrWhiteSpace(name))
      throw new ArgumentException("Name must be specified", nameof(name));

    Id = id;
    Name = name;
    Image = image;
    Price = price;
    Quantity = quantity;
  }

  public override bool Equals(object? obj)
  {
    if (obj == null || !(obj is CartItem))
      return false;

    var other = (CartItem)obj;
    return this.Id == other.Id
        && this.Name == other.Name
        && object.Equals(this.Image, other.Image)
        && this.Price == other.Price
        && this.Quantity == other.Quantity;
  }

  public override int GetHashCode()
  {
    // Use a simple hash code algorithm based on properties
    return this.Id
        * 17
        + this.Name.GetHashCode()
        + this.Image?.GetHashCode() ?? 0
        + this.Price.GetHashCode()
        + this.Quantity.GetHashCode();
  }
}