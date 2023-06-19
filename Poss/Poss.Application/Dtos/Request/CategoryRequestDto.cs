using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Poss.Application.Dtos.Request
{
    public class CategoryRequestDto
    {
        public string? Name { get; set; }
        public string? Descripcion { get; set; }
        public int State { get; set; }
    }
}
