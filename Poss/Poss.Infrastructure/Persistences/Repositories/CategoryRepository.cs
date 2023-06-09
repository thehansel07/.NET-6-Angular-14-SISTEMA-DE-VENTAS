using Poss.Domain.Entities;
using Poss.Infrastructure.Persistences.Context;
using Poss.Infrastructure.Persistences.Interfaces;

namespace Poss.Infrastructure.Persistences.Repositories
{
    public class CategoryRepository : IGenericRepository<Category>, ICategoryRepository
    {
        private readonly HanselCabreraPruebaContext _context;

        public CategoryRepository(HanselCabreraPruebaContext context)
        {
            _context = context;
                
        }
    }
}
