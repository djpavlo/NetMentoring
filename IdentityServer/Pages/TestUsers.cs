using System.Security.Claims;
using System.Text.Json;
using Duende.IdentityServer;
using Duende.IdentityServer.Test;
using IdentityModel;

namespace IdentityServer.Pages;

public class TestUsers
{
    public static List<TestUser> Users
    {
        get
        {
            var address = new
            {
                street_address = "One Hacker Way",
                locality = "Heidelberg",
                postal_code = 69118,
                country = "Germany"
            };

            return new List<TestUser>
            {
                new()
                {
                    SubjectId = "1",
                    Username = "manager",
                    Password = "manager",
                    Claims =
                    {
                        new Claim(JwtClaimTypes.Name, "Manager Smith"),
                        new Claim(JwtClaimTypes.GivenName, "Manager"),
                        new Claim(JwtClaimTypes.FamilyName, "Smith"),
                        new Claim(JwtClaimTypes.Email, "Manager@email.com"),
                        new Claim(JwtClaimTypes.EmailVerified, "true", ClaimValueTypes.Boolean),
                        new Claim(JwtClaimTypes.WebSite, "http://alice.com"),
                        new Claim(JwtClaimTypes.Address, JsonSerializer.Serialize(address),
                            IdentityServerConstants.ClaimValueTypes.Json)
                    }
                },
                new()
                {
                    SubjectId = "2",
                    Username = "buyer",
                    Password = "buyer",
                    Claims =
                    {
                        new Claim(JwtClaimTypes.Name, "Buyer Smith"),
                        new Claim(JwtClaimTypes.GivenName, "Buyer"),
                        new Claim(JwtClaimTypes.FamilyName, "Smith"),
                        new Claim(JwtClaimTypes.Email, "Buyer@email.com"),
                        new Claim(JwtClaimTypes.EmailVerified, "true", ClaimValueTypes.Boolean),
                        new Claim(JwtClaimTypes.WebSite, "http://bob.com"),
                        new Claim(JwtClaimTypes.Address, JsonSerializer.Serialize(address),
                            IdentityServerConstants.ClaimValueTypes.Json)
                    },
                    
                }
            };
        }
    }
}