using System.Text;
using System.Text.Json;
using CartingService.BLL;
using CartingService.DAL;
using CartWebApi.IntegrationEvent;
using EventBusRabbitMQ;
using RabbitMQ.Client.Events;

namespace CartWebApi.Services;

/// <summary>
/// Custom initialization service.
/// </summary>
public class InitRabbitMqService : IHostedService
{
    private readonly IEventBusRabbitMq _rabbitMqListener;
    private readonly ICartService _cartService;

    /// <summary>
    /// Initializes a new instance of the <see cref="InitRabbitMqService"/> class.
    /// </summary>
    public InitRabbitMqService(IEventBusRabbitMq rabbitMqListener, IServiceScopeFactory scopeFactory)
    {
        _rabbitMqListener = rabbitMqListener;
        var cartRepository = scopeFactory.CreateScope().ServiceProvider.GetService<ICartRepository>();
        _cartService = new CartService(cartRepository ?? throw new InvalidOperationException());
    }

    /// <summary>
    /// Starts the service.
    /// </summary>
    public Task StartAsync(CancellationToken cancellationToken)
    {
        _rabbitMqListener.OnMessageReceived += OnMessageReceived;
        _rabbitMqListener.StartListening();
        return Task.CompletedTask;
    }

    /// <summary>
    /// Handles the message received event.  
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void OnMessageReceived(object? sender, BasicDeliverEventArgs e)
    {
        var body = e.Body.ToArray();
        var message = Encoding.UTF8.GetString(body);
        var eventItem = JsonSerializer.Deserialize<ProductPriceChangedIntegrationEvent>(message);
        if (eventItem != null)
        {
            _cartService.UpdateProductPrice(eventItem.ProductId, eventItem.NewPrice);
        }
    }

    /// <summary>
    /// Stops the service.
    /// </summary>
    public Task StopAsync(CancellationToken cancellationToken)
    {
        _rabbitMqListener.Dispose();
        return Task.CompletedTask;
    }
}