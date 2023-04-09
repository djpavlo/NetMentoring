using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;

public interface IProductItemService
{
  Task<IEnumerable<ProductItem>> GetAllAsync(int? page = null, int pageSize = 10);
  Task<ProductItem?> GetByIdAsync(int id);
  Task AddAsync(ProductItem item);
  Task UpdateAsync(ProductItem item);
  Task DeleteAsync(int id);
}