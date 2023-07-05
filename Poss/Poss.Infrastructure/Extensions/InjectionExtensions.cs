using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Poss.Infrastructure.Persistences.Context;
using Poss.Infrastructure.Persistences.Interfaces;
using Poss.Infrastructure.Persistences.Repositories;

namespace Poss.Infrastructure.Extensions
{
    public static class InjectionExtensions
    {
        //Inyection de dependencias
        public static IServiceCollection AddInjectionInfraestructure(this IServiceCollection services, IConfiguration configuration)
        {
            var Assembly = typeof(HanselCabreraPruebaContext).Assembly.FullName;

            services.AddDbContext<HanselCabreraPruebaContext>(
                options => options.UseSqlServer(
                   configuration.GetConnectionString("DevConnectionString"), b => b.MigrationsAssembly(Assembly)), ServiceLifetime.Transient);

            services.AddTransient<IUnitOfWork, UnitOfWork>();
            return services;
        
        }
    }
}
