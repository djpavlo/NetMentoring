using CatalogService.Domain.Models;
using CatalogService.Infrastructure.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.Infrastructure;

public class ProductItemRepository : IProductItemRepository
{
  private readonly CatalogDbContext _dbContext;

  public ProductItemRepository(CatalogDbContext dbContext)
  {
    _dbContext = dbContext;
  }

  public async Task<ProductItem?> GetItemByIdAsync(int id)
  {
    return await _dbContext.ProductItems
        .Include(i => i.Category)
        .FirstOrDefaultAsync(i => i.Id == id);
  }

  public async Task<List<ProductItem>> GetItemsAsync()
  {
    return await _dbContext.ProductItems
        .Include(i => i.Category)
        .ToListAsync();
  }

  public async Task AddItemAsync(ProductItem item)
  {
    await _dbContext.ProductItems.AddAsync(item);
    await _dbContext.SaveChangesAsync();
  }

  public async Task UpdateItemAsync(ProductItem item)
  {
    _dbContext.Entry(item).State = EntityState.Modified;
    await _dbContext.SaveChangesAsync();
  }

  public async Task DeleteItemAsync(int id)
  {
    var item = _dbContext.ProductItems.Find(id);
    _dbContext.ProductItems.Remove(item);
    await _dbContext.SaveChangesAsync();
  }
}