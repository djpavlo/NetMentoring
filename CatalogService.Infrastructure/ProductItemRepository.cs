using CatalogService.Domain.Models;
using CatalogService.Domain.Interfaces;
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
    return await _dbContext.ProductItems.AsNoTracking()
        .Include(i => i.Category)
        .FirstOrDefaultAsync(i => i.Id == id);
  }

  public async Task<List<ProductItem>> GetItemsAsync(
                                      int? page = null,
                                      int pageSize = 10)
  {
    var productItems = _dbContext.ProductItems.Include(i => i.Category).AsQueryable();

    if (page == null)
    {
      return await productItems.ToListAsync();
    }

    // Apply pagination, based on page number and page size
    var pagedCategories = await productItems.Skip((page ?? 0 - 1) * pageSize).Take(pageSize).ToListAsync();
    return pagedCategories;
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
    var item = await _dbContext.ProductItems.FindAsync(id);
    if (item == null)
    {
        throw new Exception($"Item with id {id} not found.");
    }
    _dbContext.ProductItems.Remove(item);
    await _dbContext.SaveChangesAsync();
  }
}