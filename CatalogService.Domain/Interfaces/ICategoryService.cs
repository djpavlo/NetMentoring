using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;
public interface ICategoryService
{
  Category GetCategoryById(int id);
  IEnumerable<Category> GetCategories();
  void AddCategory(Category category);
  void UpdateCategory(Category category);
  void DeleteCategory(int id);
}