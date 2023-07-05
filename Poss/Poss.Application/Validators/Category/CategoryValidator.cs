using FluentValidation;
using Poss.Application.Dtos.Request;

namespace Poss.Application.Validators.Category
{
    public class CategoryValidator : AbstractValidator<CategoryRequestDto>
    {
        public CategoryValidator()
        {
            RuleFor(x => x.Name)
                .NotNull().WithMessage("El campo Nombre no puede ser nulo.")
                .NotEmpty().WithMessage("Ël campo Nombre no puede ser vacio");


                
        }
    }
}
