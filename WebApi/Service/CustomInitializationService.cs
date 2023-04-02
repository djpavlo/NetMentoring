using CatalogService.Domain.Models;
using CatalogService.Infrastructure;

public class CustomInitializationService : IHostedService
{
  private readonly IServiceScopeFactory _scopeFactory;

  public CustomInitializationService(IServiceScopeFactory scopeFactory)
  {
    _scopeFactory = scopeFactory;
  }

  public async Task StartAsync(CancellationToken cancellationToken)
  {
    using (var scope = _scopeFactory.CreateScope())
    {
      // Get the scoped service from the scope
      using (var dbContext = scope.ServiceProvider.GetService<CatalogDbContext>())
      {
        var categories = new List<Category>
          {
              new Category { Id = 1, Name = "Category1" },
              new Category { Id = 2, Name = "Category2" },
              new Category { Id = 3, Name = "Category3" }
          };
        await dbContext.Categories.AddRangeAsync(categories);
        await dbContext.SaveChangesAsync();
      }
    }
  }

  public Task StopAsync(CancellationToken cancellationToken)
  {
    return Task.CompletedTask;
  }
}