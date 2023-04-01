namespace CatalogService.Domain.Tests.Services;

[TestFixture]
public class ProductItemServiceTests
{
  private Mock<IProductItemRepository> _mockRepository;
  private ItemService _itemService;

  [SetUp]
  public void Setup()
  {
    _mockRepository = new Mock<IProductItemRepository>();
    _itemService = new ItemService(_mockRepository.Object);
  }

  [Test]
  public async Task GetAllAsync_ReturnsAllItems()
  {
    // Arrange
    var expectedItems = new List<ProductItem>
          {
              new ProductItem { Id = 1, Name = "Item 1", Category = new Category(), Price = 9.99m, Amount = 10 },
              new ProductItem { Id = 2, Name = "Item 2", Category = new Category(), Price = 19.99m, Amount = 5 }
          };
    _mockRepository.Setup(x => x.GetItemsAsync(null, 10)).ReturnsAsync(expectedItems);

    // Act
    var actualItems = await _itemService.GetAllAsync();

    // Assert
    Assert.AreEqual(expectedItems, actualItems);
  }

  [Test]
  public async Task GetByIdAsync_ReturnsCorrectItem()
  {
    // Arrange
    var expectedItem = new ProductItem { Id = 1, Name = "Item 1", Category = new Category(), Price = 9.99m, Amount = 10 };
    _mockRepository.Setup(x => x.GetItemByIdAsync(expectedItem.Id)).ReturnsAsync(expectedItem);

    // Act
    var actualItem = await _itemService.GetByIdAsync(expectedItem.Id);

    // Assert
    Assert.AreEqual(expectedItem, actualItem);
  }

  [Test]
  public async Task GetByIdAsync_WithInvalidId_ReturnsNull()
  {
    // Arrange
    _mockRepository.Setup(x => x.GetItemByIdAsync(It.IsAny<int>())).ReturnsAsync((ProductItem)null);

    // Act
    var actualItem = await _itemService.GetByIdAsync(1);

    // Assert
    Assert.IsNull(actualItem);
  }

  [Test]
  public async Task AddAsync_AddsItem()
  {
    // Arrange
    var item = new ProductItem { Id = 1, Name = "Item 1", Category = new Category(), Price = 9.99m, Amount = 10 };
    _mockRepository.Setup(x => x.AddItemAsync(item));

    // Act
    await _itemService.AddAsync(item);

    // Assert
    _mockRepository.Verify(x => x.AddItemAsync(item), Times.Once);
  }

  [Test]
  public void AddAsync_WithInvalidProductItem_ThrowsException()
  {
    // Arrange
    var item = new ProductItem { Id = 1, Name = "", Category = new Category(), Price = 9.99m, Amount = 10 };

    // Act
    Assert.ThrowsAsync<ArgumentException>(async () => await _itemService.AddAsync(item));

    // Assert
    _mockRepository.Verify(x => x.AddItemAsync(item), Times.Never);
  }

  [Test]
  public async Task UpdateAsync_UpdatesItem()
  {
    // Arrange
    var item = new ProductItem { Id = 1, Name = "Item 1", Category = new Category(), Price = 9.99m, Amount = 10 };
    _mockRepository.Setup(x => x.UpdateItemAsync(item));

    // Act
    await _itemService.UpdateAsync(item);

    // Assert
    _mockRepository.Verify(x => x.UpdateItemAsync(item), Times.Once);
  }

  [Test]
  public async Task DeleteAsync_DeletesItem()
  {
    // Arrange
    var item = new ProductItem { Id = 1, Name = "Item 1", Category = new Category(), Price = 9.99m, Amount = 10 };
    _mockRepository.Setup(x => x.DeleteItemAsync(item.Id));

    // Act
    await _itemService.DeleteAsync(item.Id);

    // Assert
    _mockRepository.Verify(x => x.DeleteItemAsync(item.Id), Times.Once);
  }
}