using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;

public interface IProductItemRepository
{
  Task AddItemAsync(ProductItem item);
  Task DeleteItemAsync(int id);
  Task<ProductItem?> GetItemByIdAsync(int id);
  Task<List<ProductItem>> GetItemsAsync(int? page = null,
                                      int pageSize = 10);
  Task UpdateItemAsync(ProductItem item);
}