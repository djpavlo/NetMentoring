using System.Text.Json;
using CatalogService.Domain.IntegrationEvent;
using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;
using EventBusRabbitMQ;

namespace CatalogService.Domain.Services;

public class ProductItemService : IProductItemService
{
    private readonly IProductItemRepository _repository;
    private readonly IEventBusRabbitMq _publisher;


    public ProductItemService(IProductItemRepository repository, IEventBusRabbitMq publisher)
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
        var oldItem = await _repository.GetItemByIdAsync(item.Id);
        
        if (oldItem == null)
        {
            throw new Exception($"Item with id {item.Id} not found");
        }
        
        await _repository.UpdateItemAsync(item);
        
        if (oldItem.Price != null && item.Price != null && oldItem.Price != item.Price)
        {
            // send updated item data to queue
            var eventItem = new ProductPriceChangedIntegrationEvent(item.Id, item.Price ?? 0, oldItem.Price ?? 0);
            var message = JsonSerializer.Serialize(eventItem);
            _publisher.Publish(message);
        }
    }

    public async Task DeleteAsync(int id)
    {
        await _repository.DeleteItemAsync(id);
    }
}