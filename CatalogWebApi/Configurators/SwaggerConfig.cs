using Asp.Versioning;
using Asp.Versioning.ApiExplorer;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace CatalogWebApi.Configurators;

/// <summary>
/// Configure the SwaggerGenOptions
/// </summary>
public static class SwaggerConfig
{
    /// <summary>
    /// Setup the SwaggerGenOptions
    /// </summary>
    /// <param name="options"></param>
    public static void SetupSwaggerGenOptions(SwaggerGenOptions options)
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

    /// <summary>
    /// Setup the SwaggerUI explorer for versioning
    /// </summary>
    /// <param name="options"></param>
    public static void SetupApiExplorerOptions(ApiExplorerOptions options)
    {
        // add the versioned api explorer, which also adds IApiVersionDescriptionProvider service
        // note: the specified format code will format the version as "'v'major[.minor][-status]"
        options.GroupNameFormat = "'v'VVV";

        // note: this option is only necessary when versioning by url segment. the SubstitutionFormat
        // can also be used to control the format of the API version in route templates
        options.SubstituteApiVersionInUrl = true;
    }

    /// <summary>
    /// Setup the ApiVersioningOptions for versioning
    /// </summary>
    /// <param name="options"></param>
    public static void SetupApiVersioningOptions(ApiVersioningOptions options)
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

    /// <summary>
    /// Setup the SwaggerUIOptions
    /// </summary>
    /// <param name="options"></param>
    /// <param name="app"></param>
    public static void SetupSwaggerUiOptions(SwaggerUIOptions options, WebApplication app)
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
}