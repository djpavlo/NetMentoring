namespace CatalogService.Domain.IntegrationEvent;

/// <summary>
/// Product price changed integration event.
/// </summary>
public class ProductPriceChangedIntegrationEvent
{
    /// <summary>
    /// Gets product id.
    /// </summary>
    public int ProductId { get; private init; }

    /// <summary>
    /// Gets new price.
    /// </summary>
    public decimal NewPrice { get; private init; }

    /// <summary>
    /// Gets old price.
    /// </summary>
    public decimal OldPrice { get; private init; }

    /// <summary>
    /// Initializes a new instance of the <see cref="ProductPriceChangedIntegrationEvent"/> class.
    /// </summary>
    /// <param name="productId">Product id.</param>
    /// <param name="newPrice">New price.</param>
    /// <param name="oldPrice">Old price.</param>
    public ProductPriceChangedIntegrationEvent(int productId, decimal newPrice, decimal oldPrice)
    {
        ProductId = productId;
        NewPrice = newPrice;
        OldPrice = oldPrice;
    }
}