public class CatalogQuery : ObjectGraphType
    {
        public CatalogQuery(ICategoryService categoryService, IProductItemService productItemService)
        {
            Field<ListGraphType<CategoryType>>(
                "categories",
                resolve: context => categoryService.GetCategories()
            );

            Field<ListGraphType<ProductItemType>>(
                "items",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "categoryId" },
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "skip" },
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "take" }
                ),
                resolve: context =>
                {
                    var categoryId = context.GetArgument<int>("categoryId");
                    var skip = context.GetArgument<int>("skip");
                    var take = context.GetArgument<int>("take");
                    return productItemService.GetItems(categoryId, skip, take);
                }
            );
        }
    }