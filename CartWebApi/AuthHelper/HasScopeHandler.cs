using Microsoft.AspNetCore.Authorization;

namespace CatalogWebApi.AuthHelper;

/// <summary>
/// This class is used by the policy handler to check if scope claim has the required scope
/// </summary>
public class HasScopeHandler : AuthorizationHandler<HasScopeRequirement>
{
    /// <summary>
    /// The HandleRequirementAsync method checks for the presence of the scope claim, and if the scope claim exists, checks if it contains the scope required by the resource.
    /// </summary>
    /// <param name="context"></param>
    /// <param name="requirement"></param>
    /// <returns></returns>
    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, HasScopeRequirement requirement)
    {
        // If user does not have the scope claim, get out of here
        if (!context.User.HasClaim(c => c.Type == "scope" && c.Issuer == requirement.Issuer))
            return Task.CompletedTask;

        // Split the scopes string into an array
        var scopes = context.User.FindFirst(c => c.Type == "scope" && c.Issuer == requirement.Issuer).Value.Split(' ');

        // Succeed if the scope array contains the required scope
        if (scopes.Any(s => s == requirement.Scope))
            context.Succeed(requirement);

        return Task.CompletedTask;
    }
}