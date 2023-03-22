using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;

public interface IProductItemRepository
{
  Task AddItemAsync(ProductItem item);
  Task DeleteItemAsync(int id);
  Task<ProductItem?> GetItemByIdAsync(int id);
  Task<List<ProductItem>> GetItemsAsync();
  Task UpdateItemAsync(ProductItem item);
}