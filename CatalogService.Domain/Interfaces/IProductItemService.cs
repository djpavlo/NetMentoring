using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;

public interface IProductItemService
{
  Task<IEnumerable<ProductItem>> GetAllAsync();
  Task<ProductItem> GetByIdAsync(int id);
  Task AddAsync(ProductItem item);
  Task UpdateAsync(ProductItem item);
  Task DeleteAsync(int id);
}