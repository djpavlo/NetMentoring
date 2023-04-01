using CatalogService.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.Infrastructure.Tests;

[TestFixture]
public class CategoryRepositoryTests
{
  [Test]
  public async Task GetAllAsync_ReturnsCategories()
  {
    // Arrange
    var categories = new List<Category>
          {
              new Category { Id = 1, Name = "Category1" },
              new Category { Id = 2, Name = "Category2" },
              new Category { Id = 3, Name = "Category3" }
          };
    var options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "TestDb")
        .Options;
    using var context = new CatalogDbContext(options);
    await context.Categories.AddRangeAsync(categories);
    await context.SaveChangesAsync();
    var repository = new CategoryRepository(context);

    // Act
    var result = await repository.GetCategoriesAsync();

    // Assert
    Assert.AreEqual(categories.Count, result.Count());
    for (var i = 0; i < categories.Count; i++)
    {
      Assert.AreEqual(categories[i].Id, result[i].Id);
      Assert.AreEqual(categories[i].Name, result[i].Name);
    }
  }

  [Test]
  public async Task GetByIdAsync_ReturnsCategory()
  {
    // Arrange
    var categories = new List<Category>
          {
              new Category { Id = 1, Name = "Category1" },
              new Category { Id = 2, Name = "Category2" },
              new Category { Id = 3, Name = "Category3" }
          };
    var options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "TestDb2")
        .Options;
    using var context = new CatalogDbContext(options);
    await context.Categories.AddRangeAsync(categories);
    await context.SaveChangesAsync();
    var repository = new CategoryRepository(context);

    // Act
    var result = await repository.GetCategoryByIdAsync(2);

    // Assert
    Assert.AreEqual(categories[1].Id, result?.Id);
    Assert.AreEqual(categories[1].Name, result?.Name);
  }

  [Test]
  public async Task AddAsync_AddsCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category1" };
    var options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "TestDb3")
        .Options;
    using var context = new CatalogDbContext(options);
    var repository = new CategoryRepository(context);

    // Act
    await repository.AddCategoryAsync(category);

    // Assert
    Assert.AreEqual(1, context.Categories.CountAsync().Result);
  }

  [Test]
  public async Task UpdateAsync_UpdatesCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category1" };
    var options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "TestDb4")
        .Options;
    using var context = new CatalogDbContext(options);
    await context.Categories.AddAsync(category);
    await context.SaveChangesAsync();
    var repository = new CategoryRepository(context);

    // Act
    category.Name = "Category2";
    await repository.UpdateCategoryAsync(category);

    // Assert
    Assert.AreEqual("Category2", context?.Categories?.Find(1)?.Name);
  }

  [Test]
  public async Task DeleteAsync_DeletesCategory()
  {
    // Arrange
    var category = new Category { Id = 1, Name = "Category1" };
    var options = new DbContextOptionsBuilder<CatalogDbContext>()
        .UseInMemoryDatabase(databaseName: "TestDb5")
        .Options;
    using var context = new CatalogDbContext(options);
    await context.Categories.AddAsync(category);
    await context.SaveChangesAsync();
    var repository = new CategoryRepository(context);

    // Act
    await repository.DeleteCategoryAsync(1);

    // Assert
    Assert.AreEqual(0, context.Categories.CountAsync().Result);
  }
}