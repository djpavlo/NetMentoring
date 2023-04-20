using System.Text;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace EventBusRabbitMQ;

public class EventBusRabbitMq : IEventBusRabbitMq
{
    private readonly string _queueName;
    private readonly IConnection _connection;
    private readonly IModel _channel;
    private EventingBasicConsumer? _consumer;

    public event EventHandler<BasicDeliverEventArgs>? OnMessageReceived;

    public EventBusRabbitMq(string queueName, string hostName, int port, string userName, string password)
    {
        _queueName = queueName;

        var factory = new ConnectionFactory
            { HostName = hostName, Port = port, UserName = userName, Password = password };
        _connection = factory.CreateConnection();
        _channel = _connection.CreateModel();
        _channel.QueueDeclare(_queueName, durable: true, exclusive: false, autoDelete: false, arguments: null);
    }

    /// <summary>
    /// Starts listening for messages.
    /// </summary>
    public void StartListening()
    {
        _consumer = new EventingBasicConsumer(_channel);
        _consumer.Received += OnConsumerOnReceived;
        _channel.BasicConsume(_queueName, autoAck: true, _consumer);
    }

    /// <summary>
    /// Publishes a message to the message broker.
    /// </summary>
    /// <param name="message"></param>
    public void Publish(string message)
    {
        var body = Encoding.UTF8.GetBytes(message);
        _channel.BasicPublish(exchange: "", routingKey: _queueName, basicProperties: null, body: body);
    }

    /// <summary>
    /// This method is called when a message is received from the message broker
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="ea"></param>
    private void OnConsumerOnReceived(object? sender, BasicDeliverEventArgs ea)
    {
        OnMessageReceived?.Invoke(this, ea);
    }

    /// <summary>
    /// Disposes the connection and channel.
    /// </summary>
    public void Dispose()
    {
        _channel.Close();
        _connection.Close();
    }
}