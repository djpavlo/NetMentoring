using RabbitMQ.Client.Events;

namespace EventBusRabbitMQ;

public interface IEventBusRabbitMq: IDisposable
{
    event EventHandler<BasicDeliverEventArgs>? OnMessageReceived;
    void StartListening();
    void Publish(string message);
    new void Dispose();
}