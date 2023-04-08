using CartingService.BLL;
using CartingService.BLL.Models;
using CartingService.DAL;
using CartingService.DAL.Models;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WebApi.Controllers.V2;

namespace WebApi.Tests.Controllers.V2;

[TestFixture]
public class CartControllerTests
{
  private Mock<ICartRepository> _mockCartRepository;
  private Mock<ICartService> _mockCartService;
  // private Mock<IProductItemRepository> _mockProductItemRepository;
  // private Mock<ILogger<CatalogController>> _mockLogger;
  private CartController _controller;

  [SetUp]
  public void Setup()
  {
    _mockCartRepository = new Mock<ICartRepository>();
    // _mockCartService = new Mock<ICartService>();
    // _mockProductItemRepository = new Mock<IProductItemRepository>();
    // _mockLogger = new Mock<ILogger<CatalogController>>();
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
    var items = okResult?.Value as List<CartItem>;
    Assert.AreEqual(2, items?.Count);
    Assert.AreEqual("Test Product 1", items[0].Name);

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
}