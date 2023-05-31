using System.Reflection;
using CartingService.DAL;
using CartWebApi.Configurators;
using CartWebApi.Middleware;
using CartWebApi.Service;
using EventBusRabbitMQ;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerGen;
using Serilog;
using Serilog.Exceptions;
using Serilog.Sinks.Elasticsearch;


LoggerConfig.ConfigureLogging();
Serilog.Debugging.SelfLog.Enable(Console.Error);

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

// Configure the HTTP request pipeline.
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.UseMiddleware<Auth0TokenMiddleware>();
app.MapControllers();

app.Run();






