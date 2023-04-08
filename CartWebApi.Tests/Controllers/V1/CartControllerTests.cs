using CartingService.BLL;
using CartingService.BLL.Models;
using CartingService.DAL;
using CartingService.DAL.Models;
using CartWebApi.Controllers.V1;
using Microsoft.AspNetCore.Mvc;
using Moq;

namespace CartWebApi.Tests.Controllers.V1;

[TestFixture]
public class CartControllerTests
{
  private Mock<ICartRepository> _mockCartRepository;
  private Mock<ICartService> _mockCartService;
  private CartController _controller;

  [SetUp]
  public void Setup()
  {
    _mockCartRepository = new Mock<ICartRepository>();
    _controller = new CartController(_mockCartRepository.Object);
  }

  [Test]
  public void GetCart_WhenCalled_ReturnsOkResult()
  {
    // Arrange
    var cartKey = Guid.NewGuid();
    var cart = new Cart(cartKey.ToString());
    var dbCart = new DbCart();
    _mockCartRepository.Setup(repo => repo.GetCartItemList(cartKey)).Returns(dbCart);

    // Act
    var okResult = _controller.GetCart(cartKey.ToString());

    // Assert
    Assert.IsInstanceOf<OkObjectResult>(okResult);
  }

  [Test]
  public void GetCart_WhenCalled_ReturnsAllItems()
  {
    // Arrange
    var cartKey = Guid.NewGuid();
    var cart = new Cart(cartKey.ToString());
    var dbCart = new DbCart();
    dbCart.Items.Add(new DbCartItem()
    {
      Id = 1,
      Name = "Test Product 1",
      Image = new DbCartItemImage("http://test.com/image1.jpg", ""),
      Price = 1.99m,
      Quantity = 1
    });
    dbCart.Items.Add(new DbCartItem()
    {
      Id = 2,
      Name = "Test Product 2",
      Image = new DbCartItemImage("http://test.com/image2.jpg", ""),
      Price = 2.99m,
      Quantity = 2
    });
    _mockCartRepository.Setup(repo => repo.GetCartItemList(cartKey)).Returns(dbCart);

    // Act
    var okResult = _controller.GetCart(cartKey.ToString()) as OkObjectResult;

    // Assert
    var responseCart = okResult?.Value as Cart;
    Assert.AreEqual(2, responseCart?.Items.Count);
    Assert.AreEqual("Test Product 1", responseCart?.Items[0].Name);

  }

  [Test]
  public void GetCart_WhenCalled_ReturnsNotFound()
  {
    // Arrange
    var cartKey = Guid.NewGuid();
    _mockCartRepository.Setup(repo => repo.GetCartItemList(cartKey)).Returns((DbCart)null);

    // Act
    var notFoundResult = _controller.GetCart(cartKey.ToString());

    // Assert
    Assert.IsInstanceOf<NotFoundResult>(notFoundResult);
  }

  [Test]
  public void AddCartItem_WhenCalled_ReturnsAddedItem()
  {
    // Arrange
    var cartKey = Guid.NewGuid();
    var cartItem = new CartItem(1, "Test Product 1", new CartItemImage("http://test.com/image1.jpg", ""), 1.99m, 1);
    var dbCartItem = new DbCartItem()
    {
      Id = 1,
      Name = "Test Product 1",
      Image = new DbCartItemImage("http://test.com/image1.jpg", ""),
      Price = 1.99m,
      Quantity = 1
    };
    _mockCartRepository.Setup(repo => repo.AddCartItem(cartKey, dbCartItem));

    // Act
    var okResult = _controller.AddCartItem(cartKey.ToString(), cartItem) as OkObjectResult;

    // Assert
    Assert.IsInstanceOf<OkObjectResult>(okResult);
    var item = okResult?.Value as CartItem;
    Assert.AreEqual("Test Product 1", item?.Name);
  }

  [Test]
  public void RemoveCartItem_WhenCalled_ReturnsNoContent()
  {
    // Arrange
    var cartKey = Guid.NewGuid();
    var cartItemId = 1;
    _mockCartRepository.Setup(repo => repo.RemoveCartItem(cartKey, cartItemId));

    // Act
    var okResult = _controller.RemoveCartItem(cartKey.ToString(), cartItemId);

    // Assert
    Assert.IsInstanceOf<OkResult>(okResult);
  }
}