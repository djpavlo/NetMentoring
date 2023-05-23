using Duende.IdentityServer.AspNetIdentity;
using Duende.IdentityServer.Models;
using Duende.IdentityServer.Test;
using Microsoft.AspNetCore.Identity;

namespace IdentityServer
{
    public class CustomProfileService : ProfileService<TestUser>
    {
        public CustomProfileService(UserManager<TestUser> userManager, IUserClaimsPrincipalFactory<TestUser> claimsFactory) : base(userManager, claimsFactory)
        {
        }

        protected override async Task GetProfileDataAsync(ProfileDataRequestContext context, TestUser user)
        {
            var principal = await GetUserClaimsAsync(user);

            context.AddRequestedClaims(principal.Claims);
        }
    }
}