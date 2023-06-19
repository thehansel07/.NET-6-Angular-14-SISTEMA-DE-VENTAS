using Poss.Application.Commons.Bases;
using Poss.Application.Dtos.Request;
using Poss.Application.Dtos.Response;
using Poss.Infrastructure.Commons.Bases.Request;
using Poss.Infrastructure.Commons.Bases.Response;

namespace Poss.Application.Interfaces
{
    public interface ICategoryApplication
    {
        Task<BaseReponse<BaseEntityResponse<CategoryResponseDto>>> ListCategories(BaseFilterRequest filters);
        Task<BaseReponse<IEnumerable<CategorySelectResponseDto>>> ListSelectCategories();
        Task<BaseReponse<CategoryResponseDto>> CategoryById(int categoriId);
        Task<BaseReponse<bool>> RegisterCategory(CategoryResponseDto responseDto);
        Task<BaseReponse<bool>> EditCategory(int categoryId, CategoryRequestDto requestDto);
    }
}
