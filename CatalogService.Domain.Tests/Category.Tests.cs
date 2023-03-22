using CatalogService.Domain.Models;

namespace CatalogService.Domain.Tests;

[TestFixture]
public class CategoryTests
{
  [Test]
  public void Validate_CategoryNameIsRequired()
  {
    // Arrange
    var category = new Category { Name = null };

    // Act & Assert
    Assert.Throws<ArgumentException>(() => category.Validate());
  }

  [Test]
  public void Validate_CategoryNameCannotBeLongerThan50Characters()
  {
    // Arrange
    var category = new Category { Name = "This is a category name that is longer than 50 characters" };

    // Act & Assert
    Assert.Throws<ArgumentException>(() => category.Validate());
  }

  [Test]
  public void Validate_ImageUrlIsNotValid()
  {
    // Arrange
    var category = new Category { Name = "Test Category", ImageUrl = "not a valid url" };

    // Act & Assert
    Assert.Throws<ArgumentException>(() => category.Validate());
  }
}