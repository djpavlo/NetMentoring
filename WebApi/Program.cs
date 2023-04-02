using CartingService.DAL;
using CatalogService.Domain.Interfaces;
using CatalogService.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateBuilder(args);

// add db context
builder.Services.AddDbContext<CatalogDbContext>(options =>
{
  options.UseInMemoryDatabase("Catalog");
});

// Get the database path from appsettings.json
var dbPath = builder.Configuration.GetSection("DatabasePath").Value;

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductItemRepository, ProductItemRepository>();
builder.Services.AddScoped<ICartRepository>(c => new CartRepository(dbPath));
builder.Services.AddHostedService<CustomInitializationService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();

