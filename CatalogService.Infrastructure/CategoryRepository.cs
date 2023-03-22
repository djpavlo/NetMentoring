using CatalogService.Domain;
using CatalogService.Domain.Models;
using CatalogService.Infrastructure.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.Infrastructure;

public class CategoryRepository : ICategoryRepository
{
  private readonly CatalogDbContext _dbContext;

  public CategoryRepository(CatalogDbContext dbContext)
  {
    _dbContext = dbContext;
  }

  public async Task<Category?> GetCategoryByIdAsync(int id)
  {
    return await _dbContext.Categories
        .FirstOrDefaultAsync(c => c.Id == id);
  }

  public async Task<List<Category>> GetCategoriesAsync()
  {
    return await _dbContext.Categories
        .ToListAsync();
  }

  public async Task AddCategoryAsync(Category category)
  {
    _dbContext.Categories.Add(category);
    await _dbContext.SaveChangesAsync();
  }

  public async Task UpdateCategoryAsync(Category category)
  {
    _dbContext.Entry(category).State = EntityState.Modified;
    await _dbContext.SaveChangesAsync();
  }

  public async Task DeleteCategoryAsync(int id)
  {
    var category = await _dbContext.Categories.FindAsync(id);
    _dbContext.Categories.Remove(category);
    await _dbContext.SaveChangesAsync();
  }
}