using CatalogService.Domain;
using CatalogService.Domain.Models;

namespace CatalogService.Infrastructure.Interfaces;

public interface ICategoryRepository
{
  Task AddCategoryAsync(Category category);
  Task DeleteCategoryAsync(int id);
  Task<List<Category>> GetCategoriesAsync();
  Task<Category?> GetCategoryByIdAsync(int id);
  Task UpdateCategoryAsync(Category category);
}