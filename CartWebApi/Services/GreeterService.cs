using Grpc.Core;

namespace CartWebApi.Services;

/// <summary>
/// Represents the gRPC greeter service.
/// </summary>
public class GreeterService : Greeter.GreeterBase
{
    private readonly ILogger<GreeterService> _logger;
    /// <summary>
    /// Initializes a new instance of the <see cref="GreeterService"/> class.
    /// </summary>
    public GreeterService(ILogger<GreeterService> logger)
    {
        _logger = logger;
    }

    /// <summary>
    /// Says hello.
    /// </summary>
    public override Task<HelloReply> SayHello(HelloRequest request, ServerCallContext context)
    {
        _logger.LogInformation($"Saying hello to {request.Name}");
        return Task.FromResult(new HelloReply
        {
            Message = "Hello " + request.Name
        });
    }
}