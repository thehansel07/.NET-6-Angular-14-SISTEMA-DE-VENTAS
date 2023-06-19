using FluentValidation.Results;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Poss.Application.Commons.Bases
{
    public class BaseReponse<T>
    {
        public bool IsSuccess { get; set; }
        public T? Data { get; set; }
        public string? Message { get; set; }

        public IEnumerable<ValidationFailure>? Errors { get; set; }
    }
}
