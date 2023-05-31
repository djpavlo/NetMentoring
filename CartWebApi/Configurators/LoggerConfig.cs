using System.Reflection;
using Serilog;
using Serilog.Exceptions;
using Serilog.Sinks.Elasticsearch;

namespace CartWebApi.Configurators;

/// <summary>
/// Configures the logger for the CartWebApi project.
/// </summary>
public abstract class LoggerConfig
{
    /// <summary>
    /// Configures the logger for the CartWebApi project with enrichers for log context and exception details, and sinks for debug console and Elasticsearch.
    /// </summary>
    public static void ConfigureLogging()
    {
        var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
        var configuration = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .AddJsonFile($"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT")}.json",
                optional: true)
            .Build();

        Log.Logger = new LoggerConfiguration()
            .Enrich.FromLogContext()
            .Enrich.WithExceptionDetails()
            .WriteTo.Debug()
            .WriteTo.Console()
            .WriteTo.Elasticsearch(ConfigureElasticSink(configuration, environment ?? "development"))
            .Enrich.WithProperty("Environment", environment ?? "development")
            .ReadFrom.Configuration(configuration)
            .CreateLogger();
    }

    /// <summary>
    /// Configures the Elasticsearch sink options for the logger.
    /// </summary>
    /// <param name="configuration">The configuration object.</param>
    /// <param name="environment">The environment name.</param>
    /// <returns>The Elasticsearch sink options.</returns>
    private static ElasticsearchSinkOptions ConfigureElasticSink(IConfiguration configuration, string environment)
    {
        var nodes = new[]
        {
            new Uri(configuration["ElasticConfiguration:Uri"]??string.Empty)
        };
        return new ElasticsearchSinkOptions(nodes)
        {
            AutoRegisterTemplate = true,
            AutoRegisterTemplateVersion = AutoRegisterTemplateVersion.ESv7,
            FailureCallback = e => Console.WriteLine($"Unable to submit event {e.MessageTemplate} Error: {e.Exception?.Message}"),
            EmitEventFailure = EmitEventFailureHandling.WriteToSelfLog | EmitEventFailureHandling.RaiseCallback,
            TypeName = null,
            BatchAction = ElasticOpType.Create,
            IndexFormat = $"{Assembly.GetExecutingAssembly().GetName().Name?.ToLower().Replace(".", "-")}-{environment.ToLower().Replace(".", "-")}-{DateTime.UtcNow:yyyy-MM}"
        };
    }
}