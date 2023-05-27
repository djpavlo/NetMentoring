using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Ocelot.Cache.CacheManager;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using Serilog;
using Serilog.Events;

namespace ApiGatewayOcelot
{
    public static class Program
    {
        /// <summary>
        /// The entry point for the application.
        /// </summary>
        /// <param name="args">The command line arguments.</param>
        public static void Main(string[] args)
        {
            new WebHostBuilder()
                .UseKestrel()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .ConfigureAppConfiguration((hostingContext, config) =>
                {
                    AppConfigurationConfig(config, hostingContext);
                })
                .ConfigureServices(ServicesConfig)
                .ConfigureLogging((hostingContext, logging) => { LogConfig(logging); })
                .UseIISIntegration()
                .Configure(AppConfig)
                .Build()
                .Run();
        }

        /// <summary>
        /// Configures the logging for the application.
        /// </summary>
        /// <param name="logging">The <see cref="ILoggingBuilder"/> instance.</param>
        private static void LogConfig(ILoggingBuilder logging)
        {
            logging.ClearProviders();
            logging.AddSerilog(new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .CreateLogger());
        }

        /// <summary>
        /// Configures the application configuration.
        /// </summary>
        /// <param name="config">The <see cref="IConfigurationBuilder"/> instance.</param>
        /// <param name="hostingContext">The <see cref="WebHostBuilderContext"/> instance.</param>
        private static void AppConfigurationConfig(IConfigurationBuilder config, WebHostBuilderContext hostingContext)
        {
            config
                .SetBasePath(hostingContext.HostingEnvironment.ContentRootPath)
                .AddJsonFile("ocelot.json")
                .AddEnvironmentVariables();
        }

        /// <summary>
        /// Configures the services used by the application.
        /// </summary>
        /// <param name="s">The <see cref="IServiceCollection"/> instance.</param>
        private static void ServicesConfig(IServiceCollection s)
        {
            s.AddAuthentication("Bearer")
                .AddJwtBearer("Bearer", options =>
                {
                    options.Authority = "https://dev-h0aripj1u3vn7uda.us.auth0.com";
                    options.Audience = "https://mentor.org";
                });

            s.AddSwaggerGen(c => { c.SwaggerDoc("v1", new OpenApiInfo { Title = "API Gateway", Version = "v1" }); });
            s.AddOcelot().AddCacheManager(x => { x.WithDictionaryHandle(); });
        }

        /// <summary>
        /// Configures the application pipeline.
        /// </summary>
        /// <param name="app">The <see cref="IApplicationBuilder"/> instance.</param>
        private static void AppConfig(IApplicationBuilder app)
        {
            app.Map("/swagger/v1/swagger.json", b =>
            {
                b.Run(async x =>
                {
                    var json = File.ReadAllText("swagger.json");
                    await x.Response.WriteAsync(json);
                });
            });
            app.UseSwaggerUI(c => { c.SwaggerEndpoint("/swagger/v1/swagger.json", "Ocelot"); });
            // Use authentication middleware
            app.UseAuthentication();

            app.UseOcelot().Wait();
        }
    }
}