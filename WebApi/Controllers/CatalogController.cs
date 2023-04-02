using Microsoft.AspNetCore.Mvc;
using CatalogService.Domain.Models;
using CatalogService.Domain.Interfaces;

namespace WebApi.Controllers;

[ApiController]
[Route("[controller]")]
public class CatalogController : ControllerBase
{
  private readonly ILogger<CatalogController> _logger;
  private readonly ICategoryRepository _categoryRepository;

  private readonly IProductItemRepository _productItemRepository;

  public CatalogController(ILogger<CatalogController> logger,
                           ICategoryRepository categoryRepository,
                           IProductItemRepository productItemRepository)
  {
    _logger = logger;
    _categoryRepository = categoryRepository;
    _productItemRepository = productItemRepository;
  }

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

  [HttpPost("categories")]
  public async Task<IActionResult> AddCategory(Category category)
  {
    await _categoryRepository.AddCategoryAsync(category);
    return CreatedAtAction(nameof(GetCategoryById), new { id = category.Id }, category);
  }

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

  [HttpDelete("categories/{id}")]
  public async Task<IActionResult> DeleteCategory(int id)
  {
    await _categoryRepository.DeleteCategoryAsync(id);
    return Ok($"Category with id {id} deleted with related items");
  }

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

