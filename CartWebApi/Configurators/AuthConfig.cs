using System.Security.Claims;
using CatalogWebApi.AuthHelper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.Tokens;

namespace CartWebApi.Configurators;

/// <summary>
/// Configure the JWT bearer
/// </summary>
public static class AuthConfig
{
    /// <summary>
    /// Configure the JWT bearer
    /// </summary>
    /// <param name="builder"></param>
    /// <returns></returns>
    public static Action<JwtBearerOptions> ConfigureJwtBearer(WebApplicationBuilder builder)
    {
        return options =>
        {
            options.Authority = $"https://{builder.Configuration["Auth0:Domain"]}/";
            options.Audience = builder.Configuration["Auth0:Audience"];
            options.TokenValidationParameters = new TokenValidationParameters
            {
                NameClaimType = ClaimTypes.NameIdentifier
            };
        };
    }
    
    /// <summary>
    /// Configure the authorization
    /// </summary>
    /// <param name="builder"></param>
    /// <returns></returns>
    public static Action<AuthorizationOptions> ConfigureAuthorization(WebApplicationBuilder builder)
    {
        return options =>
        {
            var scopes = new[] { "read:category", "create:category", "update:category", "delete:category" };

            foreach (var scope in scopes)
            {
                var requirement = new HasScopeRequirement(scope, $"https://{builder.Configuration["Auth0:Domain"]}/");
                options.AddPolicy(scope, policy => policy.Requirements.Add(requirement));
            }
            
        };
        
    }
}