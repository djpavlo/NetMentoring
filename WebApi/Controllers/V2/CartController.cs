using Microsoft.AspNetCore.Mvc;
using CartingService.DAL;
using System.Net;
using CartingService.BLL.Models;
using CartingService.BLL;
using Asp.Versioning;

namespace WebApi.Controllers.V2;

/// <summary>
/// Represents the RESTful cart service.
/// </summary>
[ApiVersion("2.0")]
[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
public class CartController : ControllerBase
{
  private readonly ICartService _cartService;

  /// <summary>
  /// Initializes a new instance of the <see cref="CartController"/> class.
  /// </summary>
  public CartController(ICartRepository cartRepository)
  {
    _cartService = new CartService(cartRepository);
  }

  /// <summary>
  /// Gets the cart items.
  /// </summary>
  /// <param name="cartKey">The cart key.</param>
  /// <returns>The cart items.</returns>
  /// <response code="200">The cart items were successfully retrieved.</response>
  /// <response code="404">The cart was not found.</response>
  [HttpGet("{cartKey}"), MapToApiVersion("2.0")]
  [ProducesResponseType(typeof(Cart), (int)HttpStatusCode.OK)]
  [ProducesResponseType((int)HttpStatusCode.NotFound)]
  public IActionResult GetCart(string cartKey)
  {
    var cart = _cartService.GetCartItems(cartKey);
    if (cart == null)
    {
      return NotFound();
    }
    return Ok(cart.Items);
  }
}