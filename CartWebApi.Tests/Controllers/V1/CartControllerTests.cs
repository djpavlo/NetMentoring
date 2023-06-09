using CartingService.BLL.Models;
using CartingService.DAL;
using CartingService.DAL.Models;
using CartWebApi.Controllers.V1;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;

namespace CartWebApi.Tests.Controllers.V1;

[TestFixture]
public class CartControllerTests
{
    private readonly Mock<ICartRepository> _mockCartRepository;
    private readonly CartController _controller;

    public CartControllerTests()
    {
        _mockCartRepository = new Mock<ICartRepository>();
        Mock<ILogger<CartController>> mockLogger = new();
        _controller = new CartController(_mockCartRepository.Object, mockLogger.Object);
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
        Assert.That(okResult, Is.InstanceOf<OkObjectResult>());
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
        Assert.That(responseCart?.Items.Count, Is.EqualTo(2));
        Assert.That(responseCart?.Items[0].Name, Is.EqualTo("Test Product 1"));

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
        Assert.That(notFoundResult, Is.InstanceOf<NotFoundResult>());
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
        Assert.That(okResult, Is.InstanceOf<OkObjectResult>());
        var item = okResult?.Value as CartItem;
        Assert.That(item?.Name, Is.EqualTo("Test Product 1"));
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
        Assert.That(okResult, Is.InstanceOf<OkResult>());
    }
}