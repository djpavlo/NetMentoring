using CatalogWebApi.GraphQL.Mutations;
using CatalogWebApi.GraphQL.Queries;
using GraphQL.Types;

namespace CatalogWebApi.GraphQL;

/// <summary>
/// Represents the GraphQL schema for the catalog API.
/// </summary>
public class CatalogSchema : Schema
{
    /// <summary>
    /// Initializes a new instance of the <see cref="CatalogSchema"/> class.
    /// </summary>
    /// <param name="query">The catalog query.</param>
    /// <param name="mutation">The catalog mutation.</param>
    public CatalogSchema(CatalogQuery query, CatalogMutation mutation) : base()
    {
        Query = query;
        Mutation = mutation;
    }
}
