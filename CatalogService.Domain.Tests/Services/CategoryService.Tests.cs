namespace CatalogService.Domain.Tests.Services;

[TestFixture]
public class CategoryServiceTests
{
  private Mock<ICategoryRepository> _mockRepository;
  private ICategoryService _service;

  [SetUp]
  public void SetUp()
  {
    _mockRepository = new Mock<ICategoryRepository>();
    _service = new CategoryService(_mockRepository.Object);
  }

  [Test]
  public async Task GetAllAsync_ReturnsAllCategories()
  {
    // Arrange
    var categories = new List<Category>
          {
              new Category { Id = 1, Name = "Category 1" },
              new Category { Id = 2, Name = "Category 2" },
              new Category { Id = 3, Name = "Category 3" },
          };
    _mockRepository.Setup(x => x.GetCategoriesAsync()).ReturnsAsync(categories);

    // Act
    var result = await _service.GetAllAsync();

    // Assert
    Assert.AreEqual(categories.Count, result.Count());
    Assert.IsTrue(categories.SequenceEqual(result));
  }

  [Test]
  public async Task GetByIdAsync_WithValidId_ReturnsCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category 1" };
    _mockRepository.Setup(x => x.GetCategoryByIdAsync(category.Id)).ReturnsAsync(category);

    // Act
    var result = await _service.GetByIdAsync(category.Id);

    // Assert
    Assert.IsNotNull(result);
    Assert.AreEqual(category.Id, result.Id);
    Assert.AreEqual(category.Name, result.Name);
  }

  [Test]
  public async Task GetByIdAsync_WithInvalidId_ReturnsNull()
  {
    // Arrange
    _mockRepository.Setup(x => x.GetCategoryByIdAsync(It.IsAny<int>())).ReturnsAsync((Category)null);

    // Act
    var result = await _service.GetByIdAsync(1);

    // Assert
    Assert.IsNull(result);
  }

  [Test]
  public async Task AddAsync_WithValidCategory_ReturnsCategoryWithId()
  {
    // Arrange
    var category = new Category { Name = "Category 1" };
    _mockRepository.Setup(x => x.AddCategoryAsync(category)).Returns(Task.CompletedTask);

    // Act
    await _service.AddAsync(category);

    // Assert
    _mockRepository.Verify(x => x.AddCategoryAsync(category), Times.Once);

  }

  [Test]
  public async Task UpdateAsync_WithValidCategory_ReturnsUpdatedCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category 1" };
    _mockRepository.Setup(x => x.UpdateCategoryAsync(category)).Returns(Task.CompletedTask);

    // Act
    await _service.UpdateAsync(category);

    // Assert
    _mockRepository.Verify(x => x.UpdateCategoryAsync(category), Times.Once);

  }

  [Test]
  public async Task DeleteAsync_WithValidId_DeletesCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category 1" };
    _mockRepository.Setup(x => x.DeleteCategoryAsync(category.Id)).Returns(Task.CompletedTask);

    // Act
    await _service.DeleteAsync(category.Id);

    // Assert
    _mockRepository.Verify(x => x.DeleteCategoryAsync(category.Id), Times.Once);
  }
}