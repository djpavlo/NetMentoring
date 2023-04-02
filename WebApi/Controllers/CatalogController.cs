using Microsoft.AspNetCore.Mvc;
using CatalogService.Domain.Models;
using CatalogService.Domain.Interfaces;
using WebApi.HalModel;
using Asp.Versioning;

namespace WebApi.Controllers;

/// <summary>
/// Represents the RESTful catalog service.
/// </summary>
[ApiVersion("1.0")]
[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
public class CatalogController : ControllerBase
{
  private readonly ILogger<CatalogController> _logger;
  private readonly ICategoryRepository _categoryRepository;

  private readonly IProductItemRepository _productItemRepository;
  /// <summary>
  /// Initializes a new instance of the <see cref="CatalogController"/> class.
  /// </summary>
  public CatalogController(ILogger<CatalogController> logger,
                           ICategoryRepository categoryRepository,
                           IProductItemRepository productItemRepository)
  {
    _logger = logger;
    _categoryRepository = categoryRepository;
    _productItemRepository = productItemRepository;
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
    var categories = await _categoryRepository.GetCategoriesAsync();

    var response = new HalResponse
    {
      Links = new List<Link>
              {
                  new Link { Rel = "self", Href = "/catalog/categories" },
                  new Link { Rel = "add", Href = "/catalog/categories", Method = "POST" }
              },
      Embedded = new Dictionary<string, object>
      {
        ["categories"] = categories.Select(c => new HalResponse
        {
          Links = new List<Link>
                      {
                          new Link { Rel = "self", Href = $"/catalog/categories/{c.Id}" },
                          new Link { Rel = "update", Href = $"/catalog/categories/{c.Id}", Method = "PUT" },
                          new Link { Rel = "delete", Href = $"/catalog/categories/{c.Id}", Method = "DELETE" }
                      },
          Data = c
        })
      }
    };

    return Ok(response);
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
    await _categoryRepository.AddCategoryAsync(category);
    return CreatedAtAction(nameof(GetCategoryById), new { id = category.Id }, category);
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
    var category = await _categoryRepository.GetCategoryByIdAsync(id);

    if (category == null)
    {
      return NotFound();
    }

    var response = new HalResponse
    {
      Links = new List<Link>
              {
                  new Link { Rel = "self", Href = $"/catalog/categories/{id}" },
                  new Link { Rel = "update", Href = $"/catalog/categories/{id}", Method = "PUT" },
                  new Link { Rel = "delete", Href = $"/catalog/categories/{id}", Method = "DELETE" }
              },
      Data = category
    };

    return Ok(response);
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
    if (category == null)
    {
      return BadRequest();
    }

    await _categoryRepository.UpdateCategoryAsync(category);
    return Ok($"Category with id {category.Id} updated");
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
    await _categoryRepository.DeleteCategoryAsync(id);
    return Ok($"Category with id {id} deleted with related items");
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
    var items = await _productItemRepository.GetItemsAsync(page);

    if (items == null)
    {
      return NotFound();
    }

    var response = new HalResponse
    {
      Links = new List<Link>
              {
                  new Link { Rel = "self", Href = $"/catalog/items?categoryId={categoryId}&page={page}" },
                  new Link { Rel = "add", Href = "/catalog/items", Method = "POST" }
              },
      Embedded = new Dictionary<string, object>
      {
        ["items"] = items.Select(i => new HalResponse
        {
          Links = new List<Link>
                      {
                          new Link { Rel = "self", Href = $"/catalog/items/{i.Id}" },
                          new Link { Rel = "update", Href = $"/catalog/items/{i.Id}", Method = "PUT" },
                          new Link { Rel = "delete", Href = $"/catalog/items/{i.Id}", Method = "DELETE" }
                      },
          Data = i
        })
      }
    };

    return Ok(response);
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

    await _productItemRepository.AddItemAsync(item);

    return CreatedAtAction(nameof(GetProductItemById), new { id = item.Id }, item);
  }

  /// <summary>
  /// Gets the product item by id.
  /// </summary>
  /// <param name="id">The product item id.</param>
  /// <returns>The product item.</returns>
  /// <response code="200">The product item was successfully retrieved.</response>
  /// <response code="404">The product item was not found.</response>
  [HttpGet("items/{id}")]
  public async Task<IActionResult> GetProductItemById(int id)
  {
    var item = await _productItemRepository.GetItemByIdAsync(id);

    if (item == null)
    {
      return NotFound();
    }

    var response = new HalResponse
    {
      Links = new List<Link>
              {
                  new Link { Rel = "self", Href = $"/catalog/items/{id}" },
                  new Link { Rel = "update", Href = $"/catalog/items/{id}", Method = "PUT" },
                  new Link { Rel = "delete", Href = $"/catalog/items/{id}", Method = "DELETE" }
              },
      Data = item
    };

    return Ok(response);
  }

  /// <summary>
  /// Updates the product item.
  /// </summary>
  /// <param name="item">The product item.</param>
  /// <returns>The updated product item.</returns>
  /// <response code="200">The product item was successfully updated.</response>
  /// <response code="400">The product item is null.</response>
  [HttpPut("items/{id}")]
  public async Task<IActionResult> UpdateProductItem(ProductItem item)
  {
    if (item == null)
    {
      return BadRequest();
    }

    await _productItemRepository.UpdateItemAsync(item);
    return Ok($"Product item with id {item.Id} updated");
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

    await _productItemRepository.DeleteItemAsync(id);
    return Ok($"Product item with id {id} deleted");
  }
}

