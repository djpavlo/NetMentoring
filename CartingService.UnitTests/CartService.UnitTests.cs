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
      var cartGuid = Guid.NewGuid();
      var dbCart = new DbCart
      {
        Guid = cartGuid,
        Items = new List<DbCartItem>
                {
                    new DbCartItem { Id = 1, Name = "Apple", Price = 0.5m, Quantity = 2 },
                    new DbCartItem { Id = 2, Name = "Banana", Price = 0.7m, Quantity = 3, Image = new DbCartItemImage("URL", "altText") }
                }
      };

      _cartRepositoryMock.Setup(x => x.GetCartItemList(cartGuid)).Returns(dbCart);

      var expectedCart = new Cart(cartGuid.ToString())
      {
        Items = new List<CartItem>
                {
                    new CartItem(1, "Apple", null, 0.5m, 2),
                    new CartItem(2, "Banana", new CartItemImage("URL", "altText"), 0.7m, 3)
                }
      };

      // Set up mock repository behavior
      _cartRepositoryMock.Setup(r => r.GetCartItemList(cartGuid)).Returns(dbCart);

      // Act
      var actualCart = _cartService.GetCartItems(cartGuid.ToString());

      // Assert
      Assert.AreEqual(expectedCart.Guid, actualCart.Guid);
      CollectionAssert.AreEqual(expectedCart.Items, actualCart.Items);
    }

    [Test]
    public void GetCartItems_ShouldReturnNull_WhenCartDoesNotExist()
    {
      // Arrange
      var cartGuid = Guid.NewGuid();
      _cartRepositoryMock.Setup(x => x.GetCartItemList(cartGuid)).Returns((DbCart)null);

      // Act
      var cart = _cartService.GetCartItems(cartGuid.ToString());

      // Assert
      Assert.Null(cart);
    }

    [Test]
    public void RemoveCartItem_ShouldCallRepositoryMethod_WhenValidParameters()
    {
      // Arrange
      var cartGuid = Guid.NewGuid();
      var cartItemId = 1;

      // Act
      _cartService.RemoveCartItem(cartGuid.ToString(), cartItemId);

      // Assert
      _cartRepositoryMock.Verify(x => x.RemoveCartItem(cartGuid, cartItemId), Times.Once);
    }

    [Test]
    public void AddCartItem_ShouldCallRepositoryMethod_WhenValidParameters()
    {
      // Arrange
      var cartGuid = Guid.NewGuid();
      var cartItem = new CartItem(1, "Apple", null, 0.5m, 2);

      // Act
      _cartService.AddCartItem(cartGuid.ToString(), cartItem);

      // Assert
      _cartRepositoryMock.Verify(x => x.AddCartItem(cartGuid, It.IsAny<DbCartItem>()), Times.Once);
    }
  }
}