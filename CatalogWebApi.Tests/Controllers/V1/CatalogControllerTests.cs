using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using WebApi.Controllers.V1;
using WebApi.HalModel;

namespace WebApi.Tests.Controllers.V1;

[TestFixture]
public class CategoryControllerTests
{
  private Mock<ICategoryRepository> _mockCategoryRepository;
  private Mock<IProductItemRepository> _mockProductItemRepository;
  private Mock<ILogger<CatalogController>> _mockLogger;
  private CatalogController _controller;

  [SetUp]
  public void Setup()
  {
    _mockLogger = new Mock<ILogger<CatalogController>>();
    _mockCategoryRepository = new Mock<ICategoryRepository>();
    _mockProductItemRepository = new Mock<IProductItemRepository>();
    _controller = new CatalogController(_mockLogger.Object, _mockCategoryRepository.Object, _mockProductItemRepository.Object);
  }

  [Test]
  public async Task GetCategories_ReturnsOkResult_WithHalResponse()
  {
    // Arrange
    var categories = new List<Category>
        {
            new Category { Id = 1, Name = "Category 1" },
            new Category { Id = 2, Name = "Category 2" },
            new Category { Id = 3, Name = "Category 3" }
        };

    _mockCategoryRepository.Setup(x => x.GetCategoriesAsync())
                   .ReturnsAsync(categories);

    // Act
    var result = await _controller.GetCategories();
    var okResult = result as OkObjectResult;
    var halResponse = okResult?.Value as HalResponse;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.IsNotNull(halResponse);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual("/catalog/categories", halResponse.Links[0].Href);
    Assert.AreEqual("POST", halResponse.Links[1].Method);

    var categoriesEmbedded = halResponse.Embedded["categories"] as IEnumerable<HalResponse>;
    Assert.IsNotNull(categoriesEmbedded);
    Assert.AreEqual(categories.Count, categoriesEmbedded?.Count());

    for (var i = 0; i < categories.Count; i++)
    {
      var category = categories[i];
      var halCategory = categoriesEmbedded?.ElementAt(i);
      Assert.AreEqual($"/catalog/categories/{category.Id}", halCategory.Links[0].Href);
      Assert.AreEqual("PUT", halCategory.Links[1].Method);
      Assert.AreEqual($"/catalog/categories/{category.Id}", halCategory.Links[2].Href);
      Assert.AreEqual("DELETE", halCategory.Links[2].Method);
      Assert.AreEqual(category, halCategory.Data);
    }
  }

  [Test]
  public async Task AddCategory_ReturnsCreatedAtActionResult_WithCategory()
  {
    // Arrange
    var category = new Category { Name = "Test Category" };

    _mockCategoryRepository.Setup(x => x.AddCategoryAsync(category))
                   .Callback((Category c) => c.Id = 1)
                   .Returns(Task.CompletedTask);

    // Act
    var result = await _controller.AddCategory(category);
    var createdAtActionResult = result as CreatedAtActionResult;

    // Assert
    Assert.IsNotNull(createdAtActionResult);
    Assert.AreEqual(201, createdAtActionResult?.StatusCode);
    Assert.AreEqual("GetCategoryById", createdAtActionResult?.ActionName);
    Assert.AreEqual(1, createdAtActionResult?.RouteValues["id"]);
    Assert.AreEqual(category, createdAtActionResult?.Value);
  }

  // [Test]
  // public async Task AddCategory_ReturnsBadRequest_WhenCategoryIsNull()
  // {
  //   // Act
  //   var result = await _controller.AddCategory(null);
  //   var badRequestResult = result as BadRequestResult;

  //   // Assert
  //   Assert.IsNotNull(badRequestResult);
  //   Assert.AreEqual(400, badRequestResult.StatusCode);
  // }

  // [Test]
  // public async Task AddCategory_ReturnsBadRequest_WhenCategoryNameIsNullOrEmpty()
  // {
  //   // Arrange
  //   var category = new Category();

  //   // Act
  //   var result = await _controller.AddCategory(category);
  //   var badRequestResult = result as BadRequestResult;

  //   // Assert
  //   Assert.IsNotNull(badRequestResult);
  //   Assert.AreEqual(400, badRequestResult.StatusCode);
  // }

  [Test]
  public async Task GetCategoryById_ReturnsOkResult_WithHalResponse()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category 1" };

    _mockCategoryRepository.Setup(x => x.GetCategoryByIdAsync(category.Id))
                   .ReturnsAsync(category);

    // Act
    var result = await _controller.GetCategoryById(category.Id);
    var okResult = result as OkObjectResult;
    var halResponse = okResult?.Value as HalResponse;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.IsNotNull(halResponse);
    Assert.AreEqual(200, okResult.StatusCode);
    Assert.AreEqual($"/catalog/categories/{category.Id}", halResponse.Links[0].Href);
    Assert.AreEqual("PUT", halResponse.Links[1].Method);
    Assert.AreEqual($"/catalog/categories/{category.Id}", halResponse.Links[2].Href);
    Assert.AreEqual("DELETE", halResponse.Links[2].Method);
    Assert.AreEqual(category, halResponse.Data);
  }

  [Test]
  public async Task GetCategoryById_ReturnsNotFoundResult_WhenCategoryIsNull()
  {
    // Arrange
    var categoryId = 1;

    _mockCategoryRepository.Setup(x => x.GetCategoryByIdAsync(categoryId))
                   .ReturnsAsync((Category)null);

    // Act
    var result = await _controller.GetCategoryById(categoryId);
    var notFoundResult = result as NotFoundResult;

    // Assert
    Assert.IsNotNull(notFoundResult);
    Assert.AreEqual(404, notFoundResult.StatusCode);
  }

  [Test]
  public async Task UpdateCategory_ReturnsNoContentResult()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category 1" };

    _mockCategoryRepository.Setup(x => x.UpdateCategoryAsync(category));

    // Act
    var result = await _controller.UpdateCategory(category);
    var okResult = result as OkObjectResult;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.AreEqual(200, okResult.StatusCode);
    Assert.AreEqual($"Category with id {category.Id} updated", okResult.Value);
  }

  [Test]
  public async Task UpdateCategory_ReturnsBadRequest_WhenCategoryIsNull()
  {
    // Act
    var result = await _controller.UpdateCategory(null);
    var badRequestResult = result as BadRequestResult;

    // Assert
    Assert.IsNotNull(badRequestResult);
    Assert.AreEqual(400, badRequestResult?.StatusCode);
  }

  [Test]
  public async Task DeleteCategory_ReturnsNoContentResult()
  {
    // Arrange
    var categoryId = 1;

    _mockCategoryRepository.Setup(x => x.DeleteCategoryAsync(categoryId));

    // Act
    var result = await _controller.DeleteCategory(categoryId);
    var okResult = result as OkObjectResult;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual($"Category with id {categoryId} deleted with related items", okResult?.Value);
  }

  [Test]
  public async Task GetProductItems_ReturnsOkResult_WithHalResponse()
  {
    // Arrange
    var productItems = new List<ProductItem>
    {
      new ProductItem { Id = 1, Name = "Product Item 1", Price = 10.00m, Category = new Category { Id = 1, Name = "Category 1" } },
      new ProductItem { Id = 2, Name = "Product Item 2", Price = 20.00m, Category = new Category { Id = 1, Name = "Category 1" } },
      new ProductItem { Id = 3, Name = "Product Item 3", Price = 30.00m, Category = new Category { Id = 1, Name = "Category 1" } }
    };

    _mockProductItemRepository.Setup(x => x.GetItemsAsync(1, 10))
                   .ReturnsAsync(productItems);

    // Act
    var result = await _controller.GetProductItems(1);
    var okResult = result as OkObjectResult;
    var halResponse = okResult?.Value as HalResponse;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.IsNotNull(halResponse);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual("/catalog/items?categoryId=1&page=1", halResponse.Links[0].Href);
    Assert.AreEqual("POST", halResponse.Links[1].Method);

    var productItemsEmbedded = halResponse.Embedded["items"] as IEnumerable<HalResponse>;
    Assert.IsNotNull(productItemsEmbedded);
    Assert.AreEqual(productItems.Count, productItemsEmbedded?.Count());

    for (var i = 0; i < productItems.Count; i++)
    {
      var productItem = productItems[i];
      var halProductItem = productItemsEmbedded?.ElementAt(i);
      Assert.AreEqual($"/catalog/items/{productItem.Id}", halProductItem.Links[0].Href);
      Assert.AreEqual("PUT", halProductItem.Links[1].Method);
      Assert.AreEqual($"/catalog/items/{productItem.Id}", halProductItem.Links[2].Href);
      Assert.AreEqual("DELETE", halProductItem.Links[2].Method);
      Assert.AreEqual(productItem, halProductItem.Data);
    }
  }

  [Test]
  public async Task GetProductItems_ReturnsNotFoundResult_WhenProductItemsIsNull()
  {
    // Arrange
    _mockProductItemRepository.Setup(x => x.GetItemsAsync(1, 10))
                   .ReturnsAsync((List<ProductItem>)null);

    // Act
    var result = await _controller.GetProductItems(1);
    var notFoundResult = result as NotFoundResult;

    // Assert
    Assert.IsNotNull(notFoundResult);
    Assert.AreEqual(404, notFoundResult?.StatusCode);
  }

  [Test]
  public async Task AddProductItem_ReturnsCreatedAtRouteResult()
  {
    // Arrange
    var productItem = new ProductItem { Id = 1, Name = "Product Item 1", Price = 10.00m, Category = new Category { Id = 1, Name = "Category 1" } };

    _mockProductItemRepository.Setup(x => x.AddItemAsync(productItem));

    // Act
    var result = await _controller.AddProductItem(productItem);
    var createdResult = result as CreatedAtActionResult;

    // Assert
    Assert.IsNotNull(createdResult);
    Assert.AreEqual(201, createdResult?.StatusCode);
    Assert.AreEqual(productItem, createdResult?.Value);
  }

  [Test]
  public async Task AddProductItem_ReturnsBadRequest_WhenProductItemIsNull()
  {
    // Act
    var result = await _controller.AddProductItem(null);
    var badRequestResult = result as BadRequestResult;

    // Assert
    Assert.IsNotNull(badRequestResult);
    Assert.AreEqual(400, badRequestResult?.StatusCode);
  }

  [Test]
  public async Task GetProductItemById_ReturnsOkResult_WithHalResponse()
  {
    // Arrange
    var productItem = new ProductItem { Id = 1, Name = "Product Item 1", Price = 10.00m, Category = new Category { Id = 1, Name = "Category 1" } };

    _mockProductItemRepository.Setup(x => x.GetItemByIdAsync(productItem.Id))
                   .ReturnsAsync(productItem);

    // Act
    var result = await _controller.GetProductItemById(productItem.Id);
    var okResult = result as OkObjectResult;
    var halResponse = okResult?.Value as HalResponse;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.IsNotNull(halResponse);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual($"/catalog/items/{productItem.Id}", halResponse.Links[0].Href);
    Assert.AreEqual("PUT", halResponse.Links[1].Method);
    Assert.AreEqual($"/catalog/items/{productItem.Id}", halResponse.Links[2].Href);
    Assert.AreEqual("DELETE", halResponse.Links[2].Method);
    Assert.AreEqual(productItem, halResponse.Data);
  }

  [Test]
  public async Task UpdateProductItem_ReturnsNoContentResult()
  {
    // Arrange
    var productItem = new ProductItem { Id = 1, Name = "Product Item 1", Price = 10.00m, Category = new Category { Id = 1, Name = "Category 1" } };

    _mockProductItemRepository.Setup(x => x.UpdateItemAsync(productItem));

    // Act
    var result = await _controller.UpdateProductItem(productItem);
    var okResult = result as OkObjectResult;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual($"Product item with id {productItem.Id} updated", okResult?.Value);
  }

  [Test]
  public async Task UpdateProductItem_ReturnsBadRequest_WhenProductItemIsNull()
  {
    // Act
    var result = await _controller.UpdateProductItem(null);
    var badRequestResult = result as BadRequestResult;

    // Assert
    Assert.IsNotNull(badRequestResult);
    Assert.AreEqual(400, badRequestResult?.StatusCode);
  }

  [Test]
  public async Task DeleteProductItem_ReturnsNoContentResult()
  {
    // Arrange
    var productItem = new ProductItem { Id = 1, Name = "Product Item 1", Price = 10.00m, Category = new Category { Id = 1, Name = "Category 1" } };

    _mockProductItemRepository.Setup(x => x.DeleteItemAsync(productItem.Id));

    // Act
    var result = await _controller.DeleteProductItem(productItem.Id);
    var okResult = result as OkObjectResult;

    // Assert
    Assert.IsNotNull(okResult);
    Assert.AreEqual(200, okResult?.StatusCode);
    Assert.AreEqual($"Product item with id {productItem.Id} deleted", okResult?.Value);
  }

  [Test]
  public async Task DeleteProductItem_ReturnsBadRequest_WhenProductItemIdIsZero()
  {
    // Act
    var result = await _controller.DeleteProductItem(0);
    var badRequestResult = result as BadRequestResult;

    // Assert
    Assert.IsNotNull(badRequestResult);
    Assert.AreEqual(400, badRequestResult?.StatusCode);
  }
}
