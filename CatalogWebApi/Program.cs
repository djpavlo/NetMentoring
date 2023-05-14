using CatalogService.Domain.Interfaces;
using CatalogService.Infrastructure;
using Microsoft.EntityFrameworkCore;
using CatalogService.Domain.Services;
using CatalogWebApi.AuthHelper;
using CatalogWebApi.Configurators;
using CatalogWebApi.Service;
using EventBusRabbitMQ;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerGen;


var builder = WebApplication.CreateBuilder(args);
// Add services to the container.
// add db context
builder.Services.AddDbContext<CatalogDbContext>(options => { options.UseInMemoryDatabase("Catalog"); });
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(AuthConfig.ConfigureJwtBearer(builder));
builder.Services.AddAuthorization(AuthConfig.ConfigureAuthorization(builder));
builder.Services.AddSingleton<IAuthorizationHandler, HasScopeHandler>();
builder.Services.AddControllers();
builder.Services.AddApiVersioning(SwaggerConfig.SetupApiVersioningOptions).AddApiExplorer(SwaggerConfig.SetupApiExplorerOptions);
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddSwaggerGen(SwaggerConfig.SetupSwaggerGenOptions);
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductItemRepository, ProductItemRepository>();
builder.Services.AddSingleton<IEventBusRabbitMq>(_ => EventBusConfig.ConfigureEventBusRabbitMq(builder));
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IProductItemService, ProductItemService>();
builder.Services.AddHostedService<CustomInitializationService>();

var app = builder.Build();

// Configure the HTTP request pipeline.s
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options => SwaggerConfig.SetupSwaggerUiOptions(options, app));
}

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();



