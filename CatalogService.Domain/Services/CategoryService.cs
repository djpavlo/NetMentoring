using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;

namespace CatalogService.Domain.Services;
public class CategoryService : ICategoryService
{
  private readonly ICategoryRepository _repository;

  public CategoryService(ICategoryRepository repository)
  {
    _repository = repository;
  }

  public async Task<IEnumerable<Category>> GetAllAsync()
  {
    return await _repository.GetCategoriesAsync();
  }

  public async Task<Category?> GetByIdAsync(int id)
  {
    return await _repository.GetCategoryByIdAsync(id);
  }

  public async Task AddAsync(Category category)
  {
    category.Validate();
    await _repository.AddCategoryAsync(category);
  }

  public async Task UpdateAsync(Category category)
  {
    category.Validate();
    await _repository.UpdateCategoryAsync(category);
  }

  public async Task DeleteAsync(int id)
  {
    await _repository.DeleteCategoryAsync(id);
  }
}