using Microsoft.AspNetCore.Authorization;

namespace CatalogWebApi.AuthHelper;

/// <summary>
/// This class is used by the policy handler to check if scope claim has the required scope
/// </summary>
public class HasScopeRequirement : IAuthorizationRequirement
{
    /// <summary>
    /// Initializes a new instance of the <see cref="HasScopeRequirement" /> class.
    /// </summary>
    public string Issuer { get; }

    /// <summary>
    /// Initializes a new instance of the <see cref="HasScopeRequirement" /> class.
    /// </summary>
    public string Scope { get; }

    /// <summary>
    /// Initializes a new instance of the <see cref="HasScopeRequirement" /> class.
    /// </summary>
    /// <param name="scope"></param>
    /// <param name="issuer"></param>
    /// <exception cref="ArgumentNullException"></exception>
    public HasScopeRequirement(string scope, string issuer)
    {
        Scope = scope ?? throw new ArgumentNullException(nameof(scope));
        Issuer = issuer ?? throw new ArgumentNullException(nameof(issuer));
    }
}