using RabbitMQ.Client.Events;

namespace EventBusRabbitMQ;

public interface IEventBusRabbitMq
{
    event EventHandler<BasicDeliverEventArgs>? OnMessageReceived;
    void StartListening();
    void Publish(string message);
    void Dispose();
}