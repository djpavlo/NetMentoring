using CartingService.BLL;
using CartingService.BLL.Models;
using CartingService.DAL.Models;
using Moq;

namespace CartingService.UnitTests
{
  [TestFixture]
  public class CartServiceTests
  {
    private Mock<ICartRepository> _cartRepositoryMock;
    private CartService _cartService;

    [SetUp]
    public void SetUp()
    {
      _cartRepositoryMock = new Mock<ICartRepository>();
      _cartService = new CartService(_cartRepositoryMock.Object);
    }

    [Test]
    public void GetCartItems_ShouldReturnCartWithItems_WhenCartExists()
    {
      // Arrange
      var cartId = 1;
      var dbCart = new DbCart
      {
        Id = cartId,
        Items = new List<DbCartItem>
                {
                    new DbCartItem { Id = 1, Name = "Apple", Price = 0.5m, Quantity = 2 },
                    new DbCartItem { Id = 2, Name = "Banana", Price = 0.7m, Quantity = 3, Image = new DbCartItemImage("URL", "altText") }
                }
      };

      _cartRepositoryMock.Setup(x => x.GetCartItemList(cartId)).Returns(dbCart);

      var expectedCart = new Cart(cartId)
      {
        Items = new List<CartItem>
                {
                    new CartItem(1, "Apple", null, 0.5m, 2),
                    new CartItem(2, "Banana", new CartItemImage("URL", "altText"), 0.7m, 3)
                }
      };

      // Set up mock repository behavior
      _cartRepositoryMock.Setup(r => r.GetCartItemList(cartId)).Returns(dbCart);

      // Act
      var actualCart = _cartService.GetCartItems(cartId);

      // Assert
      Assert.AreEqual(expectedCart.Id, actualCart.Id);
      CollectionAssert.AreEqual(expectedCart.Items, actualCart.Items);
    }

    [Test]
    public void GetCartItems_ShouldReturnNull_WhenCartDoesNotExist()
    {
      // Arrange
      var cartId = 1;
      _cartRepositoryMock.Setup(x => x.GetCartItemList(cartId)).Returns((DbCart)null);

      // Act
      var cart = _cartService.GetCartItems(cartId);

      // Assert
      Assert.Null(cart);
    }

    [Test]
    public void RemoveCartItem_ShouldCallRepositoryMethod_WhenValidParameters()
    {
      // Arrange
      var cartId = 1;
      var cartItemId = 1;

      // Act
      _cartService.RemoveCartItem(cartId, cartItemId);

      // Assert
      _cartRepositoryMock.Verify(x => x.RemoveCartItem(cartId, cartItemId), Times.Once);
    }

    [Test]
    public void AddCartItem_ShouldCallRepositoryMethod_WhenValidParameters()
    {
      // Arrange
      var cartId = 1;
      var cartItem = new CartItem(1, "Apple", null, 0.5m, 2);

      // Act
      _cartService.AddCartItem(cartId, cartItem);

      // Assert
      _cartRepositoryMock.Verify(x => x.AddCartItem(cartId, It.IsAny<DbCartItem>()), Times.Once);
    }
  }
}