using Microsoft.EntityFrameworkCore;
using Poss.Domain.Entities;
using Poss.Infrastructure.Commons.Bases.Request;
using Poss.Infrastructure.Commons.Bases.Response;
using Poss.Infrastructure.Persistences.Context;
using Poss.Infrastructure.Persistences.Interfaces;
using Poss.Utilities.Static;

namespace Poss.Infrastructure.Persistences.Repositories
{
    public class CategoryRepository : GenericRepositoy<Category>, ICategoryRepository
    {
        private readonly HanselCabreraPruebaContext _context;

        public CategoryRepository(HanselCabreraPruebaContext context)
        {
            _context = context;

        }

        public async Task<Category> CategoryById(int CategoryId)
        {
            var category = await _context.Categories.AsNoTracking().FirstOrDefaultAsync(x => x.CategoryId.Equals(CategoryId));

            return category!;
        }

        public async Task<bool> DeleteCategory(int CategoryId)
        {
            var category = await _context.Categories.AsNoTracking().SingleOrDefaultAsync(x => x.CategoryId.Equals(CategoryId));

            category!.AuditDeleteUser = 1;
            category!.AuditDeleteDate = DateTime.Now;

            _context.Remove(category);

            var recordsAffected = await _context.SaveChangesAsync();

            return recordsAffected > 0;

        }

        public async Task<bool> EditCategory(Category category)
        {
            category.AuditCreateUser = 1;
            category.AuditCreateDate = DateTime.Now;
            _context.Update(category);

            //Entry + Property + IsModified = FALSE no modificar columnas
            _context.Entry(category).Property(x => x.AuditCreateUser).IsModified = false;
            _context.Entry(category).Property(x => x.AuditCreateDate).IsModified = false;

            //CANTIDAD DE REGISTROS AFECTADOS!!!
            var recordsAffected = await _context.SaveChangesAsync();

            return recordsAffected > 0;



        }

        public async Task<BaseEntityResponse<Category>> ListCategory(BaseFilterRequest filters)
        {
            var response = new BaseEntityResponse<Category>();


            var categories = (from c in _context.Categories
                              where c.AuditCreateDate == null && c.AuditDeleteDate == null
                              select c).AsNoTracking().AsQueryable();

            if (filters.NumFilter is not null && !string.IsNullOrEmpty(filters.TextFilter))
            {
                switch (filters.NumFilter)
                {
                    case 1:
                        categories = categories.Where(x => x.Name!.Contains(filters.TextFilter));
                        break;

                    case 2:
                        categories = categories.Where(x => x.Description!.Contains(filters.TextFilter));
                        break;

                }

            }


            if (filters.StateFilter is not null)
            {
                categories = categories.Where(x => x.State.Equals(filters.StateFilter));

            }

            if (!string.IsNullOrEmpty(filters.StartDate) && !string.IsNullOrEmpty(filters.EndDate))
            {
                categories = categories.Where(x => x.AuditCreateDate >= Convert.ToDateTime(filters.StartDate) &&
                                                   x.AuditCreateDate <= Convert.ToDateTime(filters.EndDate).AddDays(1));

            }

            if (filters.Sort is null) filters.Sort = "CategoryId";


            response.TotalRecords = await categories.CountAsync();
            response.Items = await Ordering(filters, categories, !(bool)filters.Download!).ToListAsync();

            return response;




        }

        public async Task<IEnumerable<Category>> ListSelectCategories()
        {
            var categories = await _context.Categories.Where(x => x.State.Equals((int)StateTypes.Active) &&
                                                             x.AuditDeleteUser == null &&
                                                             x.AuditDeleteDate == null).AsNoTracking().ToListAsync();
            return categories;
        }

        public async Task<bool> RegisterCategory(Category category)
        {
            category.AuditCreateUser = 1;
            category.AuditCreateDate = DateTime.Now;
            await _context.AddAsync(category);

            var recordsAffected = await _context.SaveChangesAsync();

            return recordsAffected > 0;

        }
    }
}
