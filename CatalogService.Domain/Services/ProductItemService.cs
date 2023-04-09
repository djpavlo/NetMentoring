using System.Text.Json;
using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;

namespace CatalogService.Domain.Services;

public class ProductItemService : IProductItemService
{
  private readonly IProductItemRepository _repository;
  private readonly IRabbitMqCatalogPublisher _publisher;
  

  public ProductItemService(IProductItemRepository repository, IRabbitMqCatalogPublisher publisher)
  {
    _repository = repository;
    _publisher = publisher;
  }

  public async Task<IEnumerable<ProductItem>> GetAllAsync(int? page = null, int pageSize = 10)
  {
    return await _repository.GetItemsAsync(page, pageSize);
  }

  public async Task<ProductItem?> GetByIdAsync(int id)
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
    // send updated item data to queue
    var message = JsonSerializer.Serialize(item);
    _publisher.Publish(message);
  }

  public async Task DeleteAsync(int id)
  {
    await _repository.DeleteItemAsync(id);
  }
}