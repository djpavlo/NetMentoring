using CartingService.DAL;
using CartWebApi.Configurators;
using CartWebApi.Middleware;
using CartWebApi.Services;
using EventBusRabbitMQ;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerGen;

LoggerConfig.ConfigureLogging();
Serilog.Debugging.SelfLog.Enable(Console.Error);

Environment.SetEnvironmentVariable("GRPC_TRACE", "call_stream");
Environment.SetEnvironmentVariable("GRPC_VERBOSITY", "DEBUG");

var builder = WebApplication.CreateBuilder(args);
// Add services to the container.
builder.Services.AddSingleton<IEventBusRabbitMq>(_ => EventBusConfig.ConfigureEventBusRabbitMq(builder));
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(AuthConfig.ConfigureJwtBearer(builder));
builder.Services.AddAuthorization(AuthConfig.ConfigureAuthorization(builder));
builder.Services.AddControllers();
builder.Services.AddApiVersioning(SwaggerConfig.SetupApiVersioningOptions)
    .AddApiExplorer(SwaggerConfig.SetupApiExplorerOptions);
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddSwaggerGen(SwaggerConfig.SetupSwaggerGenOptions);
builder.Services.AddScoped<ICartRepository>(_ => RepositoryConfig.ConfigureRepository(builder));
builder.Services.AddHostedService<InitRabbitMqService>();
builder.Services.AddScoped<CartGrpcService>();
builder.Services.AddGrpc();
builder.Services.AddGrpcReflection();


// Configure the HTTP request pipeline.
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.MapGrpcReflectionService();
}
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.UseMiddleware<Auth0TokenMiddleware>();
app.MapControllers();
app.MapGrpcService<CartGrpcService>();


app.Run();






