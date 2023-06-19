using AutoMapper;
using Poss.Application.Commons.Bases;
using Poss.Application.Dtos.Request;
using Poss.Application.Dtos.Response;
using Poss.Application.Interfaces;
using Poss.Application.Validators.Category;
using Poss.Infrastructure.Commons.Bases.Request;
using Poss.Infrastructure.Commons.Bases.Response;
using Poss.Infrastructure.Persistences.Interfaces;
using Poss.Utilities.Static;

namespace Poss.Application.Services
{
    public class CategoryApplication : ICategoryApplication
    {
        private readonly IUnitOfWork _unitOfWok;
        private readonly IMapper _mapper;
        private readonly CategoryValidator _cavalidationRules;
        public CategoryApplication(IUnitOfWork unitOfWok, IMapper mapper, CategoryValidator cavalidationRules)
        {
            _unitOfWok = unitOfWok;
            _mapper = mapper;
            _cavalidationRules = cavalidationRules;
        }
        public Task<BaseReponse<CategoryResponseDto>> CategoryById(int categoriId)
        {
            throw new NotImplementedException();
        }

        public Task<BaseReponse<bool>> EditCategory(int categoryId, CategoryRequestDto requestDto)
        {
            throw new NotImplementedException();
        }

        public async Task<BaseReponse<BaseEntityResponse<CategoryResponseDto>>> ListCategories(BaseFilterRequest filters)
        {
            var response = new BaseReponse<BaseEntityResponse<CategoryResponseDto>>();
            var categories = await _unitOfWok.Category.ListCategory(filters);

            if (categories is not null)
            {
                response.IsSuccess = true;
                response.Data = _mapper.Map<BaseEntityResponse<CategoryResponseDto>>(categories);
                response.Message = ReplyMessage.MESSAGE_QUERY;

            }
            else
            {
               response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_QUERY_EMPTY;
            }

            return response;

        }

        public Task<BaseReponse<IEnumerable<CategorySelectResponseDto>>> ListSelectCategories()
        {
            throw new NotImplementedException();
        }

        public Task<BaseReponse<bool>> RegisterCategory(CategoryResponseDto responseDto)
        {
            throw new NotImplementedException();
        }
    }
}
