using CatalogService.Domain.Models;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Types
{
    /// <summary>
    /// Represents a GraphQL object type for a product item.
    /// </summary>
    public class ProductItemType : ObjectGraphType<ProductItem>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductItemType"/> class.
        /// </summary>
        public ProductItemType()
        {
            Field(x => x.Id, type: typeof(IdGraphType)).Description("The ID of the product item.");
            Field(x => x.Name).Description("The name of the product item.");
            Field(x => x.Description).Description("The description of the product item.");
            Field(x => x.Price).Description("The price of the product item.");
            Field(x => x.ImageUrl).Description("The URL of the image for the product item.");
        }
    }
}