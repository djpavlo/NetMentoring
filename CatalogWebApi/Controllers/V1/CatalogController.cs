using Asp.Versioning;
using CatalogService.Domain.Interfaces;
using CatalogService.Domain.Models;
using CatalogWebApi.HalModel;
using Microsoft.AspNetCore.Mvc;

namespace CatalogWebApi.Controllers.V1;

/// <summary>
/// Represents the RESTful catalog service.
/// </summary>
[ApiVersion("1.0")]
[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
public class CatalogController : ControllerBase
{
    private readonly ILogger<CatalogController> _logger;
    private readonly ICategoryService _categoryService;

    private readonly IProductItemService _productItemService;

    /// <summary>
    /// Initializes a new instance of the <see cref="CatalogController"/> class.
    /// </summary>
    public CatalogController(ILogger<CatalogController> logger,
        ICategoryService categoryService,
        IProductItemService productItemService)
    {
        _logger = logger;
        _categoryService = categoryService;
        _productItemService = productItemService;
    }


    /// <summary> 
    /// Gets the categories.
    /// </summary>
    /// <returns>The categories.</returns>
    /// <response code="200">The categories were successfully retrieved.</response>  
    [MapToApiVersion("1.0")]
    [HttpGet("categories")]
    public async Task<IActionResult> GetCategories()
    {
        try
        {
            var categories = await _categoryService.GetAllAsync();

            var response = new HalResponse
            {
                Links = new List<Link>
                {
                    new() { Rel = "self", Href = "/catalog/categories" },
                    new() { Rel = "add", Href = "/catalog/categories", Method = "POST" }
                },
                Embedded = new Dictionary<string, object>
                {
                    ["categories"] = categories.Select(c => new HalResponse
                    {
                        Links = new List<Link>
                        {
                            new() { Rel = "self", Href = $"/catalog/categories/{c.Id}" },
                            new() { Rel = "update", Href = $"/catalog/categories/{c.Id}", Method = "PUT" },
                            new() { Rel = "delete", Href = $"/catalog/categories/{c.Id}", Method = "DELETE" }
                        },
                        Data = c
                    })
                }
            };

            return Ok(response);
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }

    /// <summary>
    /// Adds a category.
    /// </summary>
    /// <param name="category">The category.</param>
    /// <returns>The created category.</returns>
    /// <response code="201">The category was successfully created.</response>
    /// <response code="400">The category is null.</response>
    [HttpPost("categories")]
    public async Task<IActionResult> AddCategory(Category category)
    {
        try
        {
            await _categoryService.AddAsync(category);
            return CreatedAtAction(nameof(GetCategoryById), new { id = category.Id }, category);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    /// <summary>
    /// Gets the category by id.
    /// </summary>
    /// <param name="id">The category id.</param>
    /// <returns>The category.</returns>
    /// <response code="200">The category was successfully retrieved.</response>
    /// <response code="404">The category was not found.</response>
    [HttpGet("categories/{id}")]
    public async Task<IActionResult> GetCategoryById(int id)
    {
        try
        {
            var category = await _categoryService.GetByIdAsync(id);

            if (category == null)
            {
                return NotFound();
            }

            var response = new HalResponse
            {
                Links = new List<Link>
                {
                    new() { Rel = "self", Href = $"/catalog/categories/{id}" },
                    new() { Rel = "update", Href = $"/catalog/categories/{id}", Method = "PUT" },
                    new() { Rel = "delete", Href = $"/catalog/categories/{id}", Method = "DELETE" }
                },
                Data = category
            };

            return Ok(response);
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }

    /// <summary>
    /// Updates the category.
    /// </summary>
    /// <param name="category">The category.</param>
    /// <returns>The updated category.</returns>
    /// <response code="200">The category was successfully updated.</response>
    /// <response code="400">The category is null.</response>
    [HttpPut("categories")]
    public async Task<IActionResult> UpdateCategory(Category category)
    {
        try
        {
            if (category == null)
            {
                return BadRequest();
            }
            
            await _categoryService.UpdateAsync(category);
            return Ok($"Category with id {category.Id} updated");
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    /// <summary>
    /// Deletes the category.
    /// </summary>
    /// <param name="id">The category id.</param>
    /// <returns>The deleted category.</returns>
    /// <response code="200">The category was successfully deleted.</response>
    /// <response code="404">The category was not found.</response>
    [HttpDelete("categories/{id}")]
    public async Task<IActionResult> DeleteCategory(int id)
    {
        try
        {
            await _categoryService.DeleteAsync(id);
            return Ok($"Category with id {id} deleted with related items");
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }

    /// <summary>
    /// Gets the product items.
    /// </summary>
    /// <param name="categoryId">The category id.</param>
    /// <param name="page">The page number.</param>
    /// <returns>The product items.</returns>
    /// <response code="200">The product items were successfully retrieved.</response>
    /// <response code="404">The product items were not found.</response>
    [HttpGet("items")]
    public async Task<IActionResult> GetProductItems(int categoryId, int page = 1)
    {
        try
        {
            var items = await _productItemService.GetAllAsync(page);

            var productItems = items.ToList();
            if (!productItems.Any())
            {
                return NotFound();
            }

            var response = new HalResponse
            {
                Links = new List<Link>
                {
                    new() { Rel = "self", Href = $"/catalog/items?categoryId={categoryId}&page={page}" },
                    new() { Rel = "add", Href = "/catalog/items", Method = "POST" }
                },
                Embedded = new Dictionary<string, object>
                {
                    ["items"] = productItems.Select(i => new HalResponse
                    {
                        Links = new List<Link>
                        {
                            new() { Rel = "self", Href = $"/catalog/items/{i.Id}" },
                            new() { Rel = "update", Href = $"/catalog/items/{i.Id}", Method = "PUT" },
                            new() { Rel = "delete", Href = $"/catalog/items/{i.Id}", Method = "DELETE" }
                        },
                        Data = i
                    })
                }
            };
            return Ok(response);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    /// <summary>
    /// Adds a product item.
    /// </summary>
    /// <param name="item">The product item.</param>
    /// <returns>The created product item.</returns>
    /// <response code="201">The product item was successfully created.</response>
    /// <response code="400">The product item is null.</response>
    [HttpPost("items")]
    public async Task<IActionResult> AddProductItem(ProductItem item)
    {
        if (item == null)
        {
            return BadRequest();
        }
        
        try
        {
            await _productItemService.AddAsync(item);
            return CreatedAtAction(nameof(GetProductItemById), new { id = item.Id }, item);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    /// <summary>
    /// Gets the product item by id.
    /// </summary>
    /// <param name="id">The product item id.</param>
    /// <returns>The product item.</returns>
    /// <response code="200">The product item was successfully retrieved.</response>
    /// <response code="404">The product item was not found.</response>
    [HttpGet("items/{id:int}")]
    public async Task<IActionResult> GetProductItemById(int id)
    {
        try
        {
            var item = await _productItemService.GetByIdAsync(id);

            if (item == null)
            {
                return NotFound();
            }

            var response = new HalResponse
            {
                Links = new List<Link>
                {
                    new() { Rel = "self", Href = $"/catalog/items/{id}" },
                    new() { Rel = "update", Href = $"/catalog/items/{id}", Method = "PUT" },
                    new() { Rel = "delete", Href = $"/catalog/items/{id}", Method = "DELETE" }
                },
                Data = item
            };

            return Ok(response);
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }

    /// <summary>
    /// Updates the product item.
    /// </summary>
    /// <param name="item">The product item.</param>
    /// <returns>The updated product item.</returns>
    /// <response code="200">The product item was successfully updated.</response>
    /// <response code="400">The product item is null.</response>
    [HttpPut("items")]
    public async Task<IActionResult> UpdateProductItem(ProductItem item)
    {
        if (item == null)
        {
            return BadRequest();
        }
        
        try
        {
            await _productItemService.UpdateAsync(item);
            return Ok($"Product item with id {item.Id} updated");
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }

    /// <summary>
    /// Deletes the product item.
    /// </summary>
    /// <param name="id">The product item id.</param>
    /// <returns>The deleted product item.</returns>
    /// <response code="200">The product item was successfully deleted.</response>
    /// <response code="404">The product item was not found.</response>
    [HttpDelete("items/{id}")]
    public async Task<IActionResult> DeleteProductItem(int id)
    {
        if (id == 0)
        {
            return BadRequest();
        }

        try
        {
            await _productItemService.DeleteAsync(id);
            return Ok($"Product item with id {id} deleted");
        }
        catch (Exception e)
        {
            return NotFound(e.Message);
        }
    }
}