using CatalogService.Domain.Models;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Types
{
    /// <summary>
    /// Represents a GraphQL input object type for a product item.
    /// </summary>
    public class ProductItemInputType : InputObjectGraphType<ProductItem>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductItemInputType"/> class.
        /// </summary>
        public ProductItemInputType()
        {
            Name = "ProductItemInput";
            Field<NonNullGraphType<StringGraphType>>("name");
            Field<NonNullGraphType<StringGraphType>>("description");
            Field<NonNullGraphType<DecimalGraphType>>("price");
            Field<NonNullGraphType<StringGraphType>>("imageUrl");
            Field<NonNullGraphType<IntGraphType>>("categoryId");
        }
    }
}