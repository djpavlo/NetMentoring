using Microsoft.AspNetCore.Mvc;
using CatalogService.Infrastructure;
using CatalogService.Domain.Models;
using CatalogService.Domain.Interfaces;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApi.Controllers
{
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
    public async Task<IActionResult> GetCategoriesAsync()
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

    [HttpGet("items")]
    public async Task<IActionResult> GetItems(int categoryId, int page = 1)
    {
      var items = await _productItemRepository.GetItemsAsync();

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

    [HttpPost("categories")]
    public async Task<IActionResult> AddCategoryAsync(Category category)
    {
      await _categoryRepository.AddCategoryAsync(category);
      return Ok("Category added");
    }

    [HttpPost("items")]
    public async Task<IActionResult> AddItem(ProductItem item)
    {
      await _productItemRepository.AddItemAsync(item);
      return Ok("Item added");
    }

    [HttpPut("categories/{id}")]
    public async Task<IActionResult> UpdateCategoryAsync(Category category)
    {
      await _categoryRepository.UpdateCategoryAsync(category);
      return Ok($"Category with id {category.Id} updated");
    }

    [HttpPut("items/{id}")]
    public async Task<IActionResult> UpdateItemAsync(ProductItem item)
    {
      await _productItemRepository.UpdateItemAsync(item);
      return Ok($"Item with id {item.Id} updated");
    }

    [HttpDelete("items/{id}")]
    public async Task<IActionResult> DeleteItemAsync(int id)
    {
      await _productItemRepository.DeleteItemAsync(id);
      return Ok($"Item with id {id} deleted");
    }

    [HttpDelete("categories/{id}")]
    public async Task<IActionResult> DeleteCategoryAsync(int id)
    {
      await _categoryRepository.DeleteCategoryAsync(id);
      return Ok($"Category with id {id} deleted with related items");
    }
  }

  public class HalResponse
  {
    public List<Link>? Links { get; set; }

    public Dictionary<string, object>? Embedded { get; set; }

    public object? Data { get; set; }
  }

  public class Link
  {
    public string? Rel { get; set; }

    public string? Href { get; set; }

    public string? Method { get; set; }
  }
}

