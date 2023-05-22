using CatalogService.Domain.Models;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Types
{
    /// <summary>
    /// Represents a GraphQL input object type for a category.
    /// </summary>
    public class CategoryInputType : InputObjectGraphType<Category>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="CategoryInputType"/> class.
        /// </summary>
        public CategoryInputType()
        {
            Name = "CategoryInput";
            Field<NonNullGraphType<StringGraphType>>("name");
        }
    }
}