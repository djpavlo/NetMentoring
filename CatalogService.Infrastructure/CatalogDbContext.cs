using CatalogService.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.Infrastructure;

public class CatalogDbContext : DbContext
{
  public CatalogDbContext(DbContextOptions<CatalogDbContext> options) : base(options) { }

  public DbSet<Category> Categories { get; set; }
  public DbSet<ProductItem> ProductItems { get; set; }
}