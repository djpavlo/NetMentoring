using CatalogService.Domain.Models;
using CatalogService.Infrastructure;

/// <summary>
/// Custom initialization service.
/// </summary>
public class CustomInitializationService : IHostedService
{
  private readonly IServiceScopeFactory _scopeFactory;

  /// <summary>
  /// Initializes a new instance of the <see cref="CustomInitializationService"/> class.
  /// </summary>
  public CustomInitializationService(IServiceScopeFactory scopeFactory)
  {
    _scopeFactory = scopeFactory;
  }

  /// <summary>
  /// Starts the service.
  /// </summary>
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
  /// <summary>
  /// Stops the service.
  /// </summary>
  public Task StopAsync(CancellationToken cancellationToken)
  {
    return Task.CompletedTask;
  }
}