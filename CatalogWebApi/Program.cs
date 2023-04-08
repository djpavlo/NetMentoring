﻿using CatalogService.Domain.Interfaces;
using CatalogService.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Asp.Versioning;
using WebApi;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerGen;

var builder = WebApplication.CreateBuilder(args);

// add db context
builder.Services.AddDbContext<CatalogDbContext>(options =>
{
  options.UseInMemoryDatabase("Catalog");
});

// Add services to the container.
builder.Services.AddControllers();

builder.Services.AddApiVersioning(options =>
                    {
                      // reporting api versions will return the headers
                      // "api-supported-versions" and "api-deprecated-versions"
                      options.ReportApiVersions = true;

                      options.Policies.Sunset(0.9)
                                      .Effective(DateTimeOffset.Now.AddDays(60))
                                      .Link("policy.html")
                                          .Title("Versioning Policy")
                                          .Type("text/html");
                    })
                    .AddApiExplorer(options =>
                    {
                      // add the versioned api explorer, which also adds IApiVersionDescriptionProvider service
                      // note: the specified format code will format the version as "'v'major[.minor][-status]"
                      options.GroupNameFormat = "'v'VVV";

                      // note: this option is only necessary when versioning by url segment. the SubstitutionFormat
                      // can also be used to control the format of the API version in route templates
                      options.SubstituteApiVersionInUrl = true;
                    });



// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddSwaggerGen(
    options =>
    {
        // add a custom operation filter which sets default values
        options.OperationFilter<SwaggerDefaultValues>();

        var fileName = typeof( Program ).Assembly.GetName().Name + ".xml";
        var filePath = Path.Combine( AppContext.BaseDirectory, fileName );

        // integrate xml comments
        options.IncludeXmlComments( filePath );
    } );
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductItemRepository, ProductItemRepository>();
builder.Services.AddHostedService<CustomInitializationService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI(
    options =>
    {
      var descriptions = app.DescribeApiVersions();

      // build a swagger endpoint for each discovered API version
      foreach (var description in descriptions)
      {
        var url = $"/swagger/{description.GroupName}/swagger.json";
        var name = description.GroupName.ToUpperInvariant();
        options.SwaggerEndpoint(url, name);
      }
    });
}

app.UseAuthorization();

app.MapControllers();

app.Run();
