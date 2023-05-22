public class CatalogSchema : Schema
    {
        public CatalogSchema(IDependencyResolver resolver)
            : base(resolver)
        {
            Query = resolver.Resolve<CatalogQuery>();
            Mutation = resolver.Resolve<CatalogMutation>();
        }
    }