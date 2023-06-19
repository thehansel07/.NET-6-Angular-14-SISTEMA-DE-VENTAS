using Poss.Domain.Entities;
using Poss.Infrastructure.Commons.Bases.Request;
using Poss.Infrastructure.Commons.Bases.Response;

namespace Poss.Infrastructure.Persistences.Interfaces
{
    public interface ICategoryRepository
    {
        Task<BaseEntityResponse<Category>> ListCategory(BaseFilterRequest filters);
        Task<IEnumerable<Category>> ListSelectCategories();
        Task<Category> CategoryById(int CategoryId);

        Task<bool> RegisterCategory(Category category);

        Task<bool> EditCategory(Category category);
        Task<bool> DeleteCategory(int CategoryId);

    }
}
