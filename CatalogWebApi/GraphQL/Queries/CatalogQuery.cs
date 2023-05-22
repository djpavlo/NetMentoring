using CatalogService.Domain.Interfaces;
using CatalogWebApi.GraphQL.Types;
using GraphQL;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Queries;

/// <summary>
/// Represents a GraphQL query for the catalog API.
/// </summary>
public class CatalogQuery : ObjectGraphType
{
    /// <summary>
    /// Initializes a new instance of the <see cref="CatalogQuery"/> class.
    /// </summary>
    // public CatalogQuery(ICategoryService categoryService, IProductItemService productItemService)
    public CatalogQuery(IServiceProvider serviceProvider)
    {
        var categoryService = serviceProvider.GetRequiredService<ICategoryService>();
        var productItemService = serviceProvider.GetRequiredService<IProductItemService>();
        
        Field<ListGraphType<CategoryType>>("categories")
        .Description("The categories in the catalog.")
        .ResolveAsync(async context =>
            {
                var categories = await categoryService.GetAllAsync();
                return categories;
            });


        Field<ListGraphType<ProductItemType>>("items")
        .Description("The items in the catalog.")
        .Arguments(
            new QueryArguments(
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }
            )
        )
        .ResolveAsync(async context =>
            {
                var page = context.GetArgument<int>("page");
                var pageSize = context.GetArgument<int>("pageSize");
                return await productItemService.GetAllAsync(page, pageSize);
            }
        );
    }
}