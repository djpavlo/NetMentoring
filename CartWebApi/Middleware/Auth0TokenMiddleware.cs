using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Authentication;

namespace CartWebApi.Middleware;

/// <summary>
/// This class is used to extract the access token from the request and log it to the console.
/// </summary>
public class Auth0TokenMiddleware
{
    private readonly RequestDelegate _next;

    /// <summary>
    /// Initializes a new instance of the <see cref="Auth0TokenMiddleware"/> class.
    /// </summary>
    /// <param name="next"></param>
    public Auth0TokenMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    /// <summary>
    /// This method is called by the ASP.NET Core runtime.
    /// </summary>
    /// <param name="context"></param>
    public async Task Invoke(HttpContext context)
    {
        var accessToken = await context.GetTokenAsync("access_token");
        
        var tokenHandler = new JwtSecurityTokenHandler();
        var securityToken = (JwtSecurityToken)tokenHandler.ReadToken(accessToken);
        var claims = securityToken.Claims;

        foreach (var claim in claims)
        {
            Console.WriteLine($"Claim Type: {claim.Type} - Claim Value: {claim.Value}");
        }

        await _next(context);
    }
}