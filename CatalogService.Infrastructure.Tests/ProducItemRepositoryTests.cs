using CatalogService.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.Infrastructure.Tests;

[TestFixture]
public class ProductItemRepositoryTests
{
  private CatalogDbContext _context;
  private ProductItemRepository _repository;
  private DbContextOptions<CatalogDbContext> _options;

  [SetUp]
  public void Setup()
  {
    _options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "ProductTestDb")
        .Options;

    _context = new CatalogDbContext(_options);
    _repository = new ProductItemRepository(_context);

  }

  [Test]
  public async Task GetAllAsync_ReturnsItems()
  {
    // Arrange
    var items = new List<ProductItem>
          {
              new ProductItem { Id = 1, Name = "Item1", Price = 10.0m, Amount = 5, Category = new Category { Id = 1, Name = "Category1" } },
              new ProductItem { Id = 2, Name = "Item2", Price = 20.0m, Amount = 10, Category = new Category { Id = 2, Name = "Category2" } },
              new ProductItem { Id = 3, Name = "Item3", Price = 30.0m, Amount = 15, Category = new Category { Id = 3, Name = "Category3" } }
          };

    var options = new DbContextOptionsBuilder<CatalogDbContext>()
               .UseInMemoryDatabase(databaseName: "ProductTestDb2")
               .Options;

    using (var context = new CatalogDbContext(options))
    {
      await context.ProductItems.AddRangeAsync(items);
      await context.SaveChangesAsync();

      var repository = new ProductItemRepository(context);
      // Act
      var result = await repository.GetItemsAsync();

      // Assert
      Assert.AreEqual(items.Count, result.Count());
      for (var i = 0; i < items.Count; i++)
      {
        Assert.AreEqual(items[i].Id, result[i].Id);
        Assert.AreEqual(items[i].Name, result[i].Name);
        Assert.AreEqual(items[i].Price, result[i].Price);
        Assert.AreEqual(items[i].Amount, result[i].Amount);
        Assert.AreEqual(items[i].Category.Id, result[i].Category.Id);
        Assert.AreEqual(items[i].Category.Name, result[i].Category.Name);
      }
    }
  }

  [Test]
  public async Task GetItemByIdAsync_ReturnsItem()
  {
    // Arrange
    var item = new ProductItem { Id = 4, Name = "Item4", Price = 10.0m, Amount = 5, Category = new Category { Id = 4, Name = "Category1" } };

    await _context.ProductItems.AddAsync(item);
    await _context.SaveChangesAsync();

    // Act
    var result = await _repository.GetItemByIdAsync(item.Id);

    // Assert
    Assert.IsNotNull(result);
    Assert.AreEqual(item.Id, result.Id);
    Assert.AreEqual(item.Name, result.Name);
    Assert.AreEqual(item.Price, result.Price);
    Assert.AreEqual(item.Amount, result.Amount);
    Assert.AreEqual(item.Category.Id, result.Category.Id);
    Assert.AreEqual(item.Category.Name, result.Category.Name);
  }

  [Test]
  public async Task GetItemByIdAsync_ReturnsNullForInvalidId()
  {
    // Act
    var result = await _repository.GetItemByIdAsync(99);

    // Assert
    Assert.IsNull(result);
  }

  [Test]
  public async Task AddItemAsync_AddsItemToDatabase()
  {
    // Arrange
    var item = new ProductItem { Id = 5, Name = "Item5", Price = 10.0m, Amount = 5, Category = new Category { Id = 5, Name = "Category1" } };

    // Act
    await _repository.AddItemAsync(item);

    // Assert
    var result = await _context.ProductItems.FirstOrDefaultAsync(i => i.Id == item.Id);
    Assert.IsNotNull(result);
    Assert.AreEqual(item.Id, result.Id);
    Assert.AreEqual(item.Name, result.Name);
    Assert.AreEqual(item.Price, result.Price);
    Assert.AreEqual(item.Amount, result.Amount);
    Assert.AreEqual(item.Category.Id, result.Category.Id);
    Assert.AreEqual(item.Category.Name, result.Category.Name);
  }

  [Test]
  public async Task UpdateItemAsync_UpdatesItemInDatabase()
  {
    // Arrange
    var item = new ProductItem { Id = 6, Name = "Item6", Price = 10.0m, Amount = 5, Category = new Category { Id = 6, Name = "Category1" } };

    await _context.ProductItems.AddAsync(item);
    await _context.SaveChangesAsync();

    //var updatedItem = new ProductItem { Id = 6, Name = "Item6", Price = 10.0m, Amount = 5, Category = new Category { Id = 6, Name = "Category1" } };
    item.Name = "Item7";
    item.Price = 20.0m;

    // Act
    await _repository.UpdateItemAsync(item);

    // Assert
    var result = await _context.ProductItems.FirstOrDefaultAsync(i => i.Id == item.Id);
    Assert.IsNotNull(result);
    Assert.AreEqual(item.Id, result.Id);
    Assert.AreEqual(item.Name, result.Name);
    Assert.AreEqual(item.Price, result.Price);
    Assert.AreEqual(item.Amount, result.Amount);
    Assert.AreEqual(item.Category.Id, result.Category.Id);
    Assert.AreEqual(item.Category.Name, result.Category.Name);
  }

  [Test]
  public async Task DeleteItemAsync_DeletesItemFromDatabase()
  {
    // Arrange
    var item = new ProductItem { Id = 7, Name = "Item7", Price = 10.0m, Amount = 5, Category = new Category { Id = 7, Name = "Category1" } };

    await _context.ProductItems.AddAsync(item);
    await _context.SaveChangesAsync();

    // Act
    await _repository.DeleteItemAsync(item.Id);

    // Assert
    var result = await _context.ProductItems.FirstOrDefaultAsync(i => i.Id == item.Id);
    Assert.IsNull(result);
  }
}
