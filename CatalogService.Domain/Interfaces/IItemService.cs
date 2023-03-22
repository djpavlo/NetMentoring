
using CatalogService.Domain.Models;

namespace CatalogService.Domain.Interfaces;

public interface IItemService
{
  ProductItem GetItemById(int id);
  IEnumerable<ProductItem> GetItems();
  void AddItem(ProductItem item);
  void UpdateItem(ProductItem item);
  void DeleteItem(int id);
}