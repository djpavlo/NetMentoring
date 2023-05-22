public class CatalogMutation : ObjectGraphType
    {
        public CatalogMutation(ICategoryService categoryService, IProductItemService productItemService)
        {
            Field<CategoryType>(
                "addCategory",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "name" }
                ),
                resolve: context =>
                {
                    var name = context.GetArgument<string>("name");
                    return categoryService.AddCategory(name);
                }
            );

            Field<ProductItemType>(
                "addItem",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "name" },
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "categoryId" }
                ),
                resolve: context =>
                {
                    var name = context.GetArgument<string>("name");
                    var categoryId = context.GetArgument<int>("categoryId");
                    return productItemService.AddItem(name, categoryId);
                }
            );

            Field<CategoryType>(
                "updateCategory",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "name" }
                ),
                resolve: context =>
                {
                    var id = context.GetArgument<int>("id");
                    var name = context.GetArgument<string>("name");
                    return categoryService.UpdateCategory(id, name);
                }
            );

            Field<ProductItemType>(
                "updateItem",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "name" },
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "categoryId" }
                ),
                resolve: context =>
                {
                    var id = context.GetArgument<int>("id");
                    var name = context.GetArgument<string>("name");
                    var categoryId = context.GetArgument<int>("categoryId");
                    return productItemService.UpdateItem(id, name, categoryId);
                }
            );

            Field<BooleanGraphType>(
                "deleteItem",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" }
                ),
                resolve: context =>
                {
                    var id = context.GetArgument<int>("id");
                    return productItemService.DeleteItem(id);
                }
            );

            Field<BooleanGraphType>(
                "deleteCategory",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "id" }
                ),
                resolve: context =>
                {
                    var id = context.GetArgument<int>("id");
                    return categoryService.DeleteCategory(id);
                }
            );
        }
    }