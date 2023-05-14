using EventBusRabbitMQ;

namespace CartWebApi.Configurators;

/// <summary>
/// Configure the RabbitMQ event bus
/// </summary>
public static class EventBusConfig
{
    /// <summary>
    /// Configure the RabbitMQ event bus
    /// </summary>
    /// <param name="builder"></param>
    /// <returns></returns>
    /// <exception cref="InvalidOperationException"></exception>
    public static IEventBusRabbitMq ConfigureEventBusRabbitMq(WebApplicationBuilder builder)
    {
        // Get the RabbitMQ parameters from appsettings.json
        var rabbitMqHost = builder.Configuration.GetSection("RabbitMqHost").Value;
        var rabbitMqPort = int.Parse(builder.Configuration.GetSection("RabbitMqPort").Value ?? "5672");
        var rabbitMqUser = builder.Configuration.GetSection("RabbitMqUser").Value;
        var rabbitMqPassword = builder.Configuration.GetSection("RabbitMqPassword").Value;
        var rabbitMqQueue = builder.Configuration.GetSection("RabbitMqQueue").Value;

        return new EventBusRabbitMq(
            rabbitMqQueue ?? throw new InvalidOperationException(),
            rabbitMqHost ?? throw new InvalidOperationException(),
            rabbitMqPort,
            rabbitMqUser ?? throw new InvalidOperationException(),
            rabbitMqPassword ?? throw new InvalidOperationException());
    }
}