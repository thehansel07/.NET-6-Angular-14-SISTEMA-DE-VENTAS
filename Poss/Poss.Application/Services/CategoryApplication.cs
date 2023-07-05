using AutoMapper;
using FluentValidation;
using Poss.Application.Commons.Bases;
using Poss.Application.Dtos.Request;
using Poss.Application.Dtos.Response;
using Poss.Application.Interfaces;
using Poss.Application.Validators.Category;
using Poss.Domain.Entities;
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
        private readonly CategoryValidator _validationRules;
        public CategoryApplication(IUnitOfWork unitOfWok, IMapper mapper, CategoryValidator validationRules)
        {
            _unitOfWok = unitOfWok;
            _mapper = mapper;
            _validationRules = validationRules;
        }
        public async Task<BaseReponse<CategoryResponseDto>> CategoryById(int categoriId)
        {
            var response = new BaseReponse<CategoryResponseDto>();
            var category = await _unitOfWok.Category.CategoryById(categoriId);


            if (category is not null)
            {
                response.IsSuccess = true;
                response.Data = _mapper.Map<CategoryResponseDto>(category);
                response.Message = ReplyMessage.MESSAGE_QUERY;

            }

            else
            {
                response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_QUERY_EMPTY;

            }

            return response;
        }

        public async Task<BaseReponse<bool>> EditCategory(int categoryId, CategoryRequestDto requestDto)
        {
            var response = new BaseReponse<bool>();
            var categoryEdit = await CategoryById(categoryId);

            if (categoryEdit is null)
            {
                response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_QUERY_EMPTY;

            }
            var category = _mapper.Map<Category>(requestDto);
            category.CategoryId = categoryId;

            response.Data = await _unitOfWok.Category.EditCategory(category);

            if (response.Data)
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_UPDATE;

            }
            else
            {
                response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_FAILED;

            }

            return response;

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

        public async Task<BaseReponse<IEnumerable<CategorySelectResponseDto>>> ListSelectCategories()
        {
            var response = new BaseReponse<IEnumerable<CategorySelectResponseDto>>();
            var categories = await _unitOfWok.Category.ListSelectCategories();

            if (categories is not null)
            {
                response.IsSuccess = true;
                response.Data = _mapper.Map<IEnumerable<CategorySelectResponseDto>>(categories);
                response.Message = ReplyMessage.MESSAGE_QUERY;

            }
            else
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_QUERY_EMPTY;
            }

            return response;
        }

        public async Task<BaseReponse<bool>> RegisterCategory(CategoryRequestDto resquestDto)
        {
            var response = new BaseReponse<bool>();
            var validationResult = await _validationRules.ValidateAsync(resquestDto);

            if (!validationResult.IsValid)
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_VALIDATE;
                response.Errors = validationResult.Errors;

            }

            var category = _mapper.Map<Category>(resquestDto);
            response.Data = await _unitOfWok.Category.RegisterCategory(category);

            if (response.Data)
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_SAVE;

            }
            else
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_FAILED;
            }

            return response;
        }


        public async Task<BaseReponse<bool>> RemoveCategory(int categoryId)
        {
            var response = new BaseReponse<bool>();
            var categoryRemove = await CategoryById(categoryId);

            if (categoryRemove is null)
            {
                response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_QUERY_EMPTY;

            }

            response.Data = await _unitOfWok.Category.DeleteCategory(categoryId);

            if (response.Data)
            {
                response.IsSuccess = true;
                response.Message = ReplyMessage.MESSAGE_DELETE;

            }

            else
            {
                response.IsSuccess = false;
                response.Message = ReplyMessage.MESSAGE_FAILED;


            }
            return response;
        }
    }
}
