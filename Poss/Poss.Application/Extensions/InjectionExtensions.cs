using FluentValidation.AspNetCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Poss.Application.Interfaces;
using Poss.Application.Services;
using System.Reflection;

namespace Poss.Application.Extensions
{
    public static class InjectionExtensions
    {
        public static IServiceCollection AddInjectionApplicacion(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton(configuration);

            services.AddFluentValidation(options =>
            {
                options.RegisterValidatorsFromAssemblies(AppDomain.CurrentDomain.GetAssemblies().Where(p => !p.IsDynamic));
            });

            services.AddAutoMapper(Assembly.GetExecutingAssembly());

            services.AddScoped<ICategoryApplication, CategoryApplication>();

            return services;

        }
    }
}
