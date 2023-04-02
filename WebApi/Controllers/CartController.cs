using Microsoft.AspNetCore.Mvc;
using CartingService.DAL;
using System.Net;
using CartingService.BLL.Models;
using CartingService.BLL;
using Asp.Versioning;

namespace CartingService.Controllers;

/// <summary>
/// Represents the RESTful cart service.
/// </summary>
[ApiVersion("1.0")]
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
  /// <returns>The cart object with items.</returns>
  /// <response code="200">The cart items were successfully retrieved.</response>
  /// <response code="404">The cart was not found.</response>
  [HttpGet("{cartKey}")]
  [MapToApiVersion("1.0")]
  [Produces("application/json")]
  [ProducesResponseType(typeof(Cart), (int)HttpStatusCode.OK)]
  [ProducesResponseType((int)HttpStatusCode.NotFound)]
  public IActionResult GetCart(string cartKey)
  {
    var cart = _cartService.GetCartItems(cartKey);
    if (cart == null)
    {
      return NotFound();
    }
    return Ok(cart);
  }
  /// <summary>
  /// Adds a cart item.
  /// </summary>
  /// <param name="cartKey">The cart key.</param>
  /// <param name="cartItem">The cart item.</param>
  /// <returns>The cart object with items.</returns>
  /// <response code="200">The cart item was successfully added.</response>
  /// <response code="404">The cart was not found.</response>
  /// <remarks>
  /// Sample request:
  ///
  ///     POST /api/v1/cart/123
  ///     {
  ///       "id": 1,
  ///       "name": "Test name",
  ///       "image": {
  ///           "url": "http://test.com/image.jpg",
  ///           "altText": "alt text"
  ///           },
  ///       "price": 10,
  ///       "quantity": 2
  ///     }
  ///
  /// </remarks>
  [HttpPost("{cartKey}")]
  [MapToApiVersion("1.0")]
  [Consumes("application/json")]
  [Produces("application/json")]
  [ProducesResponseType((int)HttpStatusCode.OK)]
  public IActionResult AddCartItem(string cartKey, [FromBody] CartItem cartItem)
  {
    _cartService.AddCartItem(cartKey, cartItem);

    return Ok(cartItem);
  }

  /// <summary>
  /// Removes a cart item.
  /// </summary>
  /// <param name="cartKey">The cart key.</param>
  /// <param name="cartItemId">The cart item id.</param>
  /// <response code="200">The cart item was successfully removed.</response>
  /// <response code="404">The cart was not found.</response>
  [HttpDelete("{cartKey}/{cartItemId}")]
  [ProducesResponseType((int)HttpStatusCode.OK)]
  [ProducesResponseType((int)HttpStatusCode.NotFound)]
  public IActionResult RemoveCartItem(string cartKey, int cartItemId)
  {
    _cartService.RemoveCartItem(cartKey, cartItemId);

    return Ok();
  }
}