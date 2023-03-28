using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;

namespace CatalogService.Services.Interfaces;

public class ItemService : IProductItemService
{
  private readonly IProductItemRepository _repository;

  public ItemService(IProductItemRepository repository)
  {
    _repository = repository;
  }

  public async Task<IEnumerable<ProductItem>> GetAllAsync()
  {
    return await _repository.GetItemsAsync();
  }

  public async Task<ProductItem> GetByIdAsync(int id)
  {
    return await _repository.GetItemByIdAsync(id);
  }

  public async Task AddAsync(ProductItem item)
  {
    item.Validate();
    await _repository.AddItemAsync(item);
  }

  public async Task UpdateAsync(ProductItem item)
  {
    item.Validate();
    await _repository.UpdateItemAsync(item);
  }

  public async Task DeleteAsync(int id)
  {
    await _repository.DeleteItemAsync(id);
  }
}