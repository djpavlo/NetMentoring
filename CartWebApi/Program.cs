using Asp.Versioning;
using Asp.Versioning.ApiExplorer;
using CartingService.DAL;
using CartWebApi;
using CartWebApi.Service;
using EventBusRabbitMQ;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerGen;

var builder = WebApplication.CreateBuilder(args);
// Get the database path from appsettings.json
var dbPath = builder.Configuration.GetSection("DatabasePath").Value;

// Get the RabbitMQ parameters from appsettings.json
var rabbitMqHost = builder.Configuration.GetSection("RabbitMqHost").Value;
var rabbitMqPort = int.Parse(builder.Configuration.GetSection("RabbitMqPort").Value ?? "5672");
var rabbitMqUser = builder.Configuration.GetSection("RabbitMqUser").Value;
var rabbitMqPassword = builder.Configuration.GetSection("RabbitMqPassword").Value;
var rabbitMqQueue = builder.Configuration.GetSection("RabbitMqQueue").Value;

// Add services to the container.

builder.Services.AddSingleton<IEventBusRabbitMq>(_ =>
    new EventBusRabbitMq(
        rabbitMqQueue ?? throw new InvalidOperationException(),
        rabbitMqHost ?? throw new InvalidOperationException(),
        rabbitMqPort,
        rabbitMqUser ?? throw new InvalidOperationException(),
        rabbitMqPassword ?? throw new InvalidOperationException()));

builder.Services.AddControllers();
builder.Services.AddApiVersioning(SetupApiVersioningOptions).AddApiExplorer(SetupApiExplorerOptions);
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddSwaggerGen(SetupSwaggerGenOptions);

builder.Services.AddScoped<ICartRepository>(_ => new CartRepository(dbPath ?? throw new InvalidOperationException()));
builder.Services.AddHostedService<InitRabbitMqService>();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

// var listener = ((IApplicationBuilder)app).ApplicationServices.GetService<RabbitMqListener>();
// listener?.StartListening();

void SetupSwaggerGenOptions(SwaggerGenOptions options)
{
    // add a custom operation filter which sets default values
    options.OperationFilter<SwaggerDefaultValues>();

    var fileName = typeof(Program).Assembly.GetName().Name + ".xml";
    var filePath = Path.Combine(AppContext.BaseDirectory, fileName);

    // integrate xml comments
    options.IncludeXmlComments(filePath);
}

void SetupApiExplorerOptions(ApiExplorerOptions options)
{
    // add the versioned api explorer, which also adds IApiVersionDescriptionProvider service
    // note: the specified format code will format the version as "'v'major[.minor][-status]"
    options.GroupNameFormat = "'v'VVV";

    // note: this option is only necessary when versioning by url segment. the SubstitutionFormat
    // can also be used to control the format of the API version in route templates
    options.SubstituteApiVersionInUrl = true;
}

void SetupApiVersioningOptions(ApiVersioningOptions options)
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