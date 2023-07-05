using AutoMapper;
using Poss.Application.Dtos.Request;
using Poss.Application.Dtos.Response;
using Poss.Domain.Entities;
using Poss.Infrastructure.Commons.Bases.Response;
using Poss.Utilities.Static;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Poss.Application.Mappers
{
    public class CategoryMappingProfile : Profile
    {
        public CategoryMappingProfile()
        {
            CreateMap<Category, CategoryResponseDto>()
                .ForMember(x => x.StateCategory, x => x.MapFrom(y => y.State.Equals((int)StateTypes.Active) ? "Activo" : "Inactivo"))
                .ReverseMap();

            CreateMap<BaseEntityResponse<Category>, BaseEntityResponse<CategoryResponseDto>>().ReverseMap();

            CreateMap<CategoryRequestDto, Category>();

            CreateMap<Category, CategorySelectResponseDto>()
                .ReverseMap();
                
        }
    }
}
