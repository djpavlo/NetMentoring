using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;
using CatalogWebApi.GraphQL.Types;
using GraphQL;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL.Mutations;

/// <summary>
/// Represents a GraphQL mutation for the catalog API.
/// </summary>
public class CatalogMutation : ObjectGraphType
{
    /// <summary>
    /// Initializes a new instance of the <see cref="CatalogMutation"/> class.
    /// </summary>
    public CatalogMutation(IServiceProvider serviceProvider)
    {
        var categoryService = serviceProvider.GetRequiredService<ICategoryService>();
        var productItemService = serviceProvider.GetRequiredService<IProductItemService>();
        
        Field<CategoryType>("addCategory")
        .Arguments(
             new QueryArguments(
                new QueryArgument<NonNullGraphType<CategoryInputType>> { Name = "category" }
        ))
        .ResolveAsync(async context =>
        {
            var category = context.GetArgument<Category>("category");
            await categoryService.AddAsync(category);
            return category;
        }

        );

        Field<ProductItemType>("addItem")
        .Arguments(new QueryArguments(
                new QueryArgument<NonNullGraphType<ProductItemInputType>> { Name = "productItem" }
            ))
        .ResolveAsync(async context =>
        {
            var productItem = context.GetArgument<ProductItem>("productItem");
            await productItemService.AddAsync(productItem);
            return productItem;
        }
        );

        Field<CategoryType>("updateCategory")
            .Arguments(
             new QueryArguments(
                new QueryArgument<NonNullGraphType<CategoryInputType>> { Name = "category" }
        ))
        .ResolveAsync(async context =>
        {
            var category = context.GetArgument<Category>("category");

            await categoryService.UpdateAsync(category);
            return category;
        });

        Field<ProductItemType>("updateItem")
        .Arguments(new QueryArguments(
                new QueryArgument<NonNullGraphType<ProductItemInputType>> { Name = "productItem" }
            ))
        .ResolveAsync(async context =>
        {
            var productItem = context.GetArgument<ProductItem>("productItem");
            await productItemService.UpdateAsync(productItem);
            return productItem;
        });

        Field<BooleanGraphType>("deleteItem")
        .Arguments(new QueryArguments(
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" }
            ))
        .ResolveAsync(async context =>
        {
            var id = context.GetArgument<int>("id");
            await productItemService.DeleteAsync(id);
            return true;
        });

        Field<BooleanGraphType>("deleteCategory")
        .Arguments(new QueryArguments(
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" }
            ))
        .ResolveAsync(async context =>
        {
            var id = context.GetArgument<int>("id");
            await categoryService.DeleteAsync(id);
            return true;
        });
    }
}