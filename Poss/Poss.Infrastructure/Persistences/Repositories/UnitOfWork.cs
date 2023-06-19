using Poss.Infrastructure.Persistences.Context;
using Poss.Infrastructure.Persistences.Interfaces;

namespace Poss.Infrastructure.Persistences.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {

        public readonly HanselCabreraPruebaContext _context;

        public ICategoryRepository Category { get; private set; }

        public UnitOfWork(HanselCabreraPruebaContext context)
        {
            _context = context;
            Category = new CategoryRepository(_context);
        }

        public void Dispose()
        {
            //Eliminar los recursos en memoria
            _context.Dispose();
        }

        public void SaveChange()
        {
            _context.SaveChanges();

        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
