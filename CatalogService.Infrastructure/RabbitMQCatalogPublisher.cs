using System.Text;
using CatalogService.Domain.Interfaces;
using RabbitMQ.Client;

namespace CatalogService.Infrastructure;

public class RabbitMqCatalogPublisher : IRabbitMqCatalogPublisher
{
  private readonly string _queueName;
  private readonly IConnection _connection;
  private readonly IModel _channel;

  public RabbitMqCatalogPublisher(string queueName, string hostName, int port, string userName, string password)
  {
    _queueName = queueName;

    var factory = new ConnectionFactory() { HostName = hostName, Port = port, UserName = userName, Password = password };
    _connection = factory.CreateConnection();
    _channel = _connection.CreateModel();
    _channel.QueueDeclare(queue: _queueName, durable: true, exclusive: false, autoDelete: false, arguments: null);
  }

  public void Publish(string message)
  {
    var body = Encoding.UTF8.GetBytes(message);
    _channel.BasicPublish(exchange: "", routingKey: _queueName, basicProperties: null, body: body);
  }

  public void Dispose()
  {
    _channel.Close();
    _connection.Close();
  }
}