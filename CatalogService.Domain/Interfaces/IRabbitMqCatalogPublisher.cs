namespace CatalogService.Domain.Interfaces;

public interface IRabbitMqCatalogPublisher
{
  void Dispose();
  void Publish(string message);
}