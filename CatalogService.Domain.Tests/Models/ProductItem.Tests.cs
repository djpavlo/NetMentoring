namespace CatalogService.Domain.Tests.Models;

[TestFixture]
public class ProductItemTests
{
    [Test]
    public void Validate_ProductNameIsRequired()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = null,
            Description = "Test description",
            ImageUrl = "https://test.com/image.png",
            Category = new Category(),
            Price = 10.0m,
            Amount = 5
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }

    [Test]
    public void Validate_ProductNameCannotBeLongerThan50Characters()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = "Test product name that is longer than 50 characters",
            Description = "Test description",
            ImageUrl = "https://test.com/image.png",
            Category = new Category(),
            Price = 10.0m,
            Amount = 5
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }

    [Test]
    public void Validate_ImageUrlIsValid()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = "Test product name",
            Description = "Test description",
            ImageUrl = "not a valid url",
            Category = new Category(),
            Price = 10.0m,
            Amount = 5
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }

    [Test]
    public void Validate_CategoryIsRequired()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = "Test product name",
            Description = "Test description",
            ImageUrl = "https://test.com/image.png",
            Category = null,
            Price = 10.0m,
            Amount = 5
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }

    [Test]
    public void Validate_PriceIsRequired()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = "Test product name",
            Description = "Test description",
            ImageUrl = "https://test.com/image.png",
            Category = new Category(),
            Price = null,
            Amount = 5
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }

    [Test]
    public void Validate_AmountIsRequired()
    {
        // Arrange
        var productItem = new ProductItem
        {
            Name = "Test product name",
            Description = "Test description",
            ImageUrl = "https://test.com/image.png",
            Category = new Category(),
            Price = 10.0m,
            Amount = null
        };

        // Act & Assert
        Assert.Throws<ArgumentException>(() => productItem.Validate());
    }
}