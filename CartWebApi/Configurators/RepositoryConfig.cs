using CartingService.DAL;

namespace CartWebApi.Configurators;

/// <summary>
/// Configure the repository
/// </summary>
public class RepositoryConfig
{
    /// <summary>
    /// Configure the repository
    /// </summary>
    /// <param name="builder"></param>
    /// <returns></returns>
    /// <exception cref="InvalidOperationException"></exception>
    public static CartRepository ConfigureRepository(WebApplicationBuilder builder)
    {
        // Get the database path from appsettings.json
        var dbPath = builder.Configuration.GetSection("DatabasePath").Value;
        return new CartRepository(dbPath ?? throw new InvalidOperationException());
    }
}