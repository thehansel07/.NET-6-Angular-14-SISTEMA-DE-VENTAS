using Microsoft.AspNetCore.Mvc;
using Poss.Application.Dtos.Request;
using Poss.Application.Interfaces;
using Poss.Infrastructure.Commons.Bases.Request;

namespace Poss.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryApplication _categoryApplication;

        public CategoryController(ICategoryApplication categoryApplication)
        {
            _categoryApplication = categoryApplication;
           
        }

        [HttpPost]
        public async Task<IActionResult> ListCategories([FromBody] BaseFilterRequest filter) 
        {
            var reponse = await _categoryApplication.ListCategories(filter);
            return Ok(reponse);
        }


        [HttpGet("Select")]
        public async Task<IActionResult> ListSelectCategories()
        {
            var reponse = await _categoryApplication.ListSelectCategories();
            return Ok(reponse);
        }


        [HttpGet("{categoryId:int}")]
        public async Task<IActionResult> CategoryById(int categoryId)
        {
            var reponse = await _categoryApplication.CategoryById(categoryId);
            return Ok(reponse);
        }



        [HttpPost("Register")]
        public async Task<IActionResult> RegisterCategory([FromBody] CategoryRequestDto requestDto)
        {
            var reponse = await _categoryApplication.RegisterCategory(requestDto);
            return Ok(reponse);
        }


        [HttpPut("Edit/{categoryId:int}")]
        public async Task<IActionResult> EditCategory(int categoryId, [FromBody] CategoryRequestDto requestDto)
        {
            var reponse = await _categoryApplication.EditCategory(categoryId, requestDto);
            return Ok(reponse);
        }

        [HttpPut("Remove/{categoryId:int}")]
        public async Task<IActionResult> RemoveCategory(int categoryId)
        {
            var reponse = await _categoryApplication.RemoveCategory(categoryId);
            return Ok(reponse);
        }


    }

}
