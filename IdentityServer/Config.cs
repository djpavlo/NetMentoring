using Duende.IdentityServer;
using Duende.IdentityServer.Models;

namespace IdentityServer;

public static class Config
{
    public static IEnumerable<IdentityResource> IdentityResources =>
        new IdentityResource[]
        {
            new IdentityResources.OpenId(),
            new IdentityResources.Profile(),
        };

    public static IEnumerable<ApiScope> ApiScopes =>
        new ApiScope[]
        {
            new(name: "read:category",   displayName: "Read categories."),
            new(name: "create:category", displayName: "Create category."),
            new(name: "delete:category", displayName: "Delete category."),
            new(name: "update:category", displayName: "Update category.")
        };

    public static IEnumerable<Client> Clients =>
        new List<Client>
        {
            // machine to machine client (from quickstart 1)
            new()
            {
                ClientId = "MentorApp",
                ClientSecrets = { new Secret("secret".Sha256()) },

                AllowedGrantTypes = GrantTypes.ClientCredentials,
                // scopes that client has access to
                AllowedScopes = { "api1" },
                RefreshTokenUsage = TokenUsage.OneTimeOnly
            },
            // interactive ASP.NET Core Web App
            new()
            {
                ClientId = "web",
                ClientSecrets = { new Secret("secret".Sha256()) },

                AllowedGrantTypes = GrantTypes.Code,
            
                // where to redirect to after login
                RedirectUris = { "https://localhost:5002/signin-oidc" },

                // where to redirect to after logout
                PostLogoutRedirectUris = { "https://localhost:5002/signout-callback-oidc" },

                AllowOfflineAccess = true,
                AllowedScopes = new List<string>
                {
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    "read:category", "create:category", "delete:category", "update:category"
                }
            }
        };
}