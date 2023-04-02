using NUnit.Framework;
using CartingService.DAL.Models;
using LiteDB;

namespace CartingService.DAL.UnitTests
{
  [TestFixture]
  public class CartRepositoryTests
  {
    private const string _testDbPath = "test.db";
    private Guid _cartGuid = Guid.NewGuid();

    [SetUp]
    public void Setup()
    {
      using var db = new LiteDatabase(_testDbPath);
      var carts = db.GetCollection<DbCart>("carts");
      carts.Insert(new DbCart { Guid = _cartGuid, Items = new List<DbCartItem>() });
    }

    [TearDown]
    public void TearDown()
    {
      System.IO.File.Delete(_testDbPath);
    }

    [Test]
    public void AddCartItem_AddsItemToCart()
    {
      // Arrange
      var cartRepo = new CartRepository(_testDbPath);
      var cartItem = new DbCartItem { Id = 1, Name = "Test Item", Price = 9.99m, Quantity = 1 };

      // Act
      cartRepo.AddCartItem(_cartGuid, cartItem);
      var resultCart = cartRepo.GetCartItemList(_cartGuid);

      // Assert
      Assert.That(resultCart.Items.Count, Is.EqualTo(1));
      Assert.That(resultCart.Items[0].Id, Is.EqualTo(cartItem.Id));
      Assert.That(resultCart.Items[0].Name, Is.EqualTo(cartItem.Name));
      Assert.That(resultCart.Items[0].Price, Is.EqualTo(cartItem.Price));
      Assert.That(resultCart.Items[0].Quantity, Is.EqualTo(cartItem.Quantity));
    }

    [Test]
    public void RemoveCartItem_RemovesItemFromCart()
    {
      // Arrange
      var cartRepo = new CartRepository(_testDbPath);
      var cartItem = new DbCartItem { Id = 1, Name = "Test Item", Price = 9.99m, Quantity = 1 };
      cartRepo.AddCartItem(_cartGuid, cartItem);

      // Act
      cartRepo.RemoveCartItem(_cartGuid, cartItem.Id);
      var resultCart = cartRepo.GetCartItemList(_cartGuid);

      // Assert
      Assert.That(resultCart.Items.Count, Is.EqualTo(0));
    }

    [Test]
    public void GetCartItemList_ReturnsCartWithCorrectItems()
    {
      // Arrange
      var cartRepo = new CartRepository(_testDbPath);
      var cartGuid = Guid.NewGuid();
      var cartItem1 = new DbCartItem { Id = 1, Name = "Test Item 1", Price = 9.99m, Quantity = 1 };
      var cartItem2 = new DbCartItem { Id = 2, Name = "Test Item 2", Price = 19.99m, Quantity = 2 };
      var cart = new DbCart { Guid = cartGuid, Items = new List<DbCartItem> { cartItem1, cartItem2 } };
      using (var db = new LiteDatabase(_testDbPath))
      {
        var carts = db.GetCollection<DbCart>("carts");
        carts.Insert(cart);
      }

      // Act
      var resultCart = cartRepo.GetCartItemList(cartGuid);

      // Assert
      Assert.That(resultCart.Guid, Is.EqualTo(cart.Guid));
      Assert.That(resultCart.Items.Count, Is.EqualTo(cart.Items.Count));
      Assert.That(resultCart.Items[0].Id, Is.EqualTo(cartItem1.Id));
      Assert.That(resultCart.Items[0].Name, Is.EqualTo(cartItem1.Name));
      Assert.That(resultCart.Items[0].Price, Is.EqualTo(cartItem1.Price));
      Assert.That(resultCart.Items[0].Quantity, Is.EqualTo(cartItem1.Quantity));
      Assert.That(resultCart.Items[1].Id, Is.EqualTo(cartItem2.Id));
      Assert.That(resultCart.Items[1].Name, Is.EqualTo(cartItem2.Name));
      Assert.That(resultCart.Items[1].Price, Is.EqualTo(cartItem2.Price));
      Assert.That(resultCart.Items[1].Quantity, Is.EqualTo(cartItem2.Quantity));
    }
  }
}
