using Microsoft.AspNetCore.Mvc;
using CartingService.DAL;
using System.Net;
using CartingService.BLL.Models;
using CartingService.BLL;

namespace CartingService.Controllers
{
  [ApiController]
  [Route("api/v1/[controller]")]
  public class CartController : ControllerBase
  {
    private readonly ICartService _cartService;
    public CartController(ICartRepository cartRepository)
    {
      _cartService = new CartService(cartRepository);
    }

    [HttpGet("{cartKey}")]
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

    [HttpPost("{cartKey}")]
    [ProducesResponseType((int)HttpStatusCode.OK)]
    public IActionResult AddCartItem(string cartKey, [FromBody] CartItem cartItem)
    {
      _cartService.AddCartItem(cartKey, cartItem);

      return Ok();
    }

    [HttpDelete("{cartKey}/{cartItemId}")]
    [ProducesResponseType((int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    public IActionResult RemoveCartItem(string cartKey, int cartItemId)
    {
      _cartService.RemoveCartItem(cartKey, cartItemId);

      return Ok();
    }
  }
}