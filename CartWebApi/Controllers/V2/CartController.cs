using System.Net;
using Asp.Versioning;
using CartingService.BLL;
using CartingService.BLL.Models;
using CartingService.DAL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CartWebApi.Controllers.V2;

/// <summary>
/// Represents the RESTful cart service.
/// </summary>
[ApiVersion("2.0")]
[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
[Authorize]
public class CartController : ControllerBase
{
    private readonly ICartService _cartService;
    private readonly ILogger _logger;


    /// <summary>
    /// Initializes a new instance of the <see cref="CartController"/> class.
    /// </summary>
    public CartController(ICartRepository cartRepository, ILogger<CartController> logger)
    {
        _cartService = new CartService(cartRepository);
        _logger = logger;
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
            _logger.LogInformation($"Cart with key {cartKey} not found");
            return NotFound();
        }
        return Ok(cart.Items);
    }
}