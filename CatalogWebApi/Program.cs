using System.Security.Claims;
using CatalogService.Domain.Interfaces;
using CatalogService.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Asp.Versioning;
using Asp.Versioning.ApiExplorer;
using CatalogService.Domain.Services;
using CatalogWebApi;
using CatalogWebApi.AuthHelper;
using CatalogWebApi.Service;
using EventBusRabbitMQ;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using WebApi;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using Swashbuckle.AspNetCore.SwaggerUI;


var builder = WebApplication.CreateBuilder(args);

// Get the RabbitMQ parameters from appsettings.json
var rabbitMqHost = builder.Configuration.GetSection("RabbitMqHost").Value;
var rabbitMqPort = int.Parse(builder.Configuration.GetSection("RabbitMqPort").Value ?? "5672");
var rabbitMqUser = builder.Configuration.GetSection("RabbitMqUser").Value;
var rabbitMqPassword = builder.Configuration.GetSection("RabbitMqPassword").Value;
var rabbitMqQueue = builder.Configuration.GetSection("RabbitMqQueue").Value;
var domain = $"https://{builder.Configuration["Auth0:Domain"]}/";
// add db context
builder.Services.AddDbContext<CatalogDbContext>(options => { options.UseInMemoryDatabase("Catalog"); });
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.Authority = domain;
        options.Audience = builder.Configuration["Auth0:Audience"];
        options.TokenValidationParameters = new TokenValidationParameters
        {
            NameClaimType = ClaimTypes.NameIdentifier
        };
    });

builder.Services.AddAuthorization(options =>
{
    var scopes = new[] { "read:category", "create:category", "update:category", "delete:category" };

    foreach (var scope in scopes)
    {
        var requirement = new HasScopeRequirement(scope, domain);
        options.AddPolicy(scope, policy => policy.Requirements.Add(requirement));
    }
});

// builder.Services.AddAuthorization(options =>
// {
//     options.AddPolicy("read:category", policy => policy.Requirements.Add(new 
//         HasScopeRequirement("read:category", domain)));
//     options.AddPolicy("create:category", policy => policy.Requirements.Add(new 
//         HasScopeRequirement("create:category", domain)));
//     options.AddPolicy("update:category", policy => policy.Requirements.Add(new 
//         HasScopeRequirement("update:category", domain)));
//     options.AddPolicy("delete:category", policy => policy.Requirements.Add(new 
//         HasScopeRequirement("delete:category", domain)));
// });

builder.Services.AddSingleton<IAuthorizationHandler, HasScopeHandler>();
// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddApiVersioning(SetApiVersioningOptions).AddApiExplorer(SetApiExplorerOptions);
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddSwaggerGen(SetupSwaggerGenOptions);
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductItemRepository, ProductItemRepository>();
builder.Services.AddSingleton<IEventBusRabbitMq>(_ =>
    new EventBusRabbitMq(
        rabbitMqQueue ?? throw new InvalidOperationException(),
        rabbitMqHost ?? throw new InvalidOperationException(),
        rabbitMqPort,
        rabbitMqUser ?? throw new InvalidOperationException(),
        rabbitMqPassword ?? throw new InvalidOperationException()));
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IProductItemService, ProductItemService>();
builder.Services.AddHostedService<CustomInitializationService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(SetupSwaggerUiOptions);
}

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();

void SetupSwaggerGenOptions(SwaggerGenOptions options)
{
    // add a custom operation filter which sets default values
    options.OperationFilter<SwaggerDefaultValues>();

    
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                },
                Scheme = "oauth2",
                Name = "Bearer",
                In = ParameterLocation.Header,

            },
            new List<string>()
        }
    });
    
    var fileName = typeof(Program).Assembly.GetName().Name + ".xml";
    var filePath = Path.Combine(AppContext.BaseDirectory, fileName);

    // integrate xml comments
    options.IncludeXmlComments(filePath);
}

void SetupSwaggerUiOptions(SwaggerUIOptions options)
{
    var descriptions = app.DescribeApiVersions();

    // build a swagger endpoint for each discovered API version
    foreach (var description in descriptions)
    {
        var url = $"/swagger/{description.GroupName}/swagger.json";
        var name = description.GroupName.ToUpperInvariant();
        options.SwaggerEndpoint(url, name);
    }
}

void SetApiVersioningOptions(ApiVersioningOptions options)
{
    // reporting api versions will return the headers
    // "api-supported-versions" and "api-deprecated-versions"
    options.ReportApiVersions = true;

    options.Policies.Sunset(0.9)
        .Effective(DateTimeOffset.Now.AddDays(60))
        .Link("policy.html")
        .Title("Versioning Policy")
        .Type("text/html");
}

void SetApiExplorerOptions(ApiExplorerOptions options)
{
    // add the versioned api explorer, which also adds IApiVersionDescriptionProvider service
    // note: the specified format code will format the version as "'v'major[.minor][-status]"
    options.GroupNameFormat = "'v'VVV";

    // note: this option is only necessary when versioning by url segment. the SubstitutionFormat
    // can also be used to control the format of the API version in route templates
    options.SubstituteApiVersionInUrl = true;
}