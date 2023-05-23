using CatalogService.Domain.Models;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Types
{    
    /// <summary>
    /// Represents a GraphQL object type for a category.
    /// </summary>
    public class CategoryType : ObjectGraphType<Category>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="CategoryType"/> class.
        /// </summary>
        public CategoryType()
        {
            Field(x => x.Id, type: typeof(IdGraphType)).Description("The ID of the category.");
            Field(x => x.Name).Description("The name of the category.");
        }
    }    
}