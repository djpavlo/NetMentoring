using CartingService.BLL;
using CartingService.BLL.Models;
using CartingService.DAL;
using Grpc.Core;

namespace CartWebApi.Services
{
    /// <summary>
    /// Represents a gRPC controller for managing shopping carts.
    /// </summary>
    public class CartGrpcService : CartGrpc.CartGrpcBase
    {
        private readonly ICartService _cartService;
        private readonly ILogger<CartGrpcService> _logger;

        /// <summary>
        /// Initializes a new instance of the <see cref="CartGrpcService"/> class.
        /// </summary>
        /// <param name="cartRepository">The cart repository.</param>
        /// <param name="logger">The logger.</param>
        public CartGrpcService(ICartRepository cartRepository, ILogger<CartGrpcService> logger)
        {
            _cartService = new CartService(cartRepository);
            _logger = logger;
        }

        /// <summary>
        /// Retrieves a shopping cart by its key.
        /// </summary>
        /// <param name="request">The request containing the cart key.</param>
        /// <param name="context">The server call context.</param>
        /// <returns>The shopping cart.</returns>
        public override Task<GrpcCart> GetCartItems(CartRequest request, ServerCallContext context)
        {
            try
            {
                var dbCart = _cartService.GetCartItems(request.CartGuid);
                if (dbCart == null)
                {
                    throw new RpcException(new Status(StatusCode.NotFound, "Cart not found"));
                }

                var respCart = new GrpcCart
                {
                    CartGuid = dbCart.Guid
                };

                foreach (var item in dbCart.Items)
                {
                    respCart.Items.Add(new GrpcCartItem
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Price = (float)item.Price,
                    });
                }

                return Task.FromResult(respCart);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                throw new RpcException(new Status(StatusCode.Internal, "Error retrieving cart"), e.Message);
            }
        }

        /// <summary>
        /// Retrieves a stream of cart items for a given cart key.
        /// </summary>
        /// <param name="request">The request containing the cart key.</param>
        /// <param name="responseStream">The stream to write the cart items to.</param>
        /// <param name="context">The server call context.</param>
        /// <returns>A task representing the asynchronous operation.</returns>
        public override async Task GetCartItemsStream(CartRequest request, IServerStreamWriter<GrpcCartItem> responseStream, ServerCallContext context)
        {
            try
            {
                var cart = _cartService.GetCartItems(request.CartGuid);
                if (cart == null)
                {
                    throw new RpcException(new Status(StatusCode.NotFound, "Cart not found"));
                }

                foreach (var item in cart.Items)
                {
                    await responseStream.WriteAsync(new GrpcCartItem
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Price = (float)item.Price,
                    });
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                throw new RpcException(new Status(StatusCode.Internal, "Error retrieving cart"), e.Message);
            }
        }

        /// <summary>
        /// Adds a new item to the shopping cart.
        /// </summary>
        /// <param name="requestStream">The request stream containing the cart item to add.</param>
        /// <param name="context">The server call context.</param>
        /// <returns>The updated shopping cart.</returns>
        public override async Task<GrpcCart> AddCartItem(IAsyncStreamReader<GrpcCartItem> requestStream, ServerCallContext context)
        {
            try
            {
                var cartGuid = "";
                while (await requestStream.MoveNext())
                {
                    var cartItem = requestStream.Current;
                    if (cartGuid == "")
                    {
                        cartGuid = cartItem.CartGuid;
                    }
                    _cartService.AddCartItem(cartGuid, new CartItem(cartItem.Id, cartItem.Name, null, (decimal)cartItem.Price, cartItem.Quantity));
                }

                var dbCart = _cartService.GetCartItems(cartGuid);
                if (dbCart == null)
                {
                    throw new RpcException(new Status(StatusCode.NotFound, "Cart not found"));
                }

                var respCart = new GrpcCart
                {
                    CartGuid = dbCart.Guid
                };

                foreach (var item in dbCart.Items)
                {
                    respCart.Items.Add(new GrpcCartItem
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Price = (float)item.Price,
                    });
                }

                return respCart;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                throw new RpcException(new Status(StatusCode.Internal, "Error adding cart item"), e.Message);
            }
        }

        /// <summary>
        /// Adds a stream of cart items to the shopping cart.
        /// </summary>
        /// <param name="requestStream">The request stream containing the cart items to add.</param>
        /// <param name="responseStream">The stream to write the updated shopping cart to.</param>
        /// <param name="context">The server call context.</param>
        /// <returns>A task representing the asynchronous operation.</returns>
        public override async Task AddCartItemStream(IAsyncStreamReader<GrpcCartItem> requestStream, IServerStreamWriter<GrpcCart> responseStream, ServerCallContext context)
        {
            try
            {
                var cartGuid = "";
                while (await requestStream.MoveNext())
                {
                    var cartItem = requestStream.Current;
                    if (cartGuid == "")
                    {
                        cartGuid = cartItem.CartGuid;
                    }

                    _cartService.AddCartItem(cartGuid, new CartItem(cartItem.Id, cartItem.Name, null, (decimal)cartItem.Price, cartItem.Quantity));

                    var dbCart = _cartService.GetCartItems(cartGuid);
                    if (dbCart == null)
                    {
                        throw new RpcException(new Status(StatusCode.NotFound, "Cart not found"));
                    }

                    var respCart = new GrpcCart
                    {
                        CartGuid = dbCart.Guid
                    };

                    foreach (var item in dbCart.Items)
                    {
                        respCart.Items.Add(new GrpcCartItem
                        {
                            Id = item.Id,
                            Name = item.Name,
                            Quantity = item.Quantity,
                            Price = (float)item.Price,
                        });
                    }

                    await responseStream.WriteAsync(respCart);
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                throw new RpcException(new Status(StatusCode.Internal, "Error adding cart item"), e.Message);
            }
        }
    }
}