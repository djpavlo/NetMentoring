// using System.IO.Compression;
// using System.Net;
// using System.Net.Http.Headers;
// using System.Text;
// using Microsoft.AspNetCore.Http;
// using Newtonsoft.Json;
// using Newtonsoft.Json.Linq;
// using Ocelot.Configuration;
// using Ocelot.Middleware;
// using Ocelot.Multiplexer;
//
// namespace ApiGatewayOcelot.Aggregators;
//
// public class CatalogDetailsAggregatorMiddleware : IDefinedAggregator
// {
//     public async Task<DownstreamResponse> Aggregate(List<HttpContext> responses)
//     {
//         List<Post> posts = new List<Post>();
//         var users = new Dictionary<string, string>();
//
//         foreach (var response in responses)
//         {
//             var downStreamRouteKey = ((DownstreamRoute)response.Items["DownstreamRoute"]).Key;
//             var downstreamResponse = (DownstreamResponse)response.Items["DownstreamResponse"];
//             var downstreamResponseContent = await downstreamResponse.Content.ReadAsByteArrayAsync();
//
//             if (downStreamRouteKey == "CatalogItem")
//             {
//                 posts = JsonSerializer.Deserialize<List<Post>>(DeCompressBrotli(downstreamResponseContent));
//             }
//
//             if (downStreamRouteKey == "CatalogItemProperties")
//             {
//                 users = JsonSerializer.Deserialize<Dictionary<string, string>>(DeCompressBrotli(downstreamResponseContent));
//             }
//         }
//
//         return PostByUsername(posts, users);
//
//     }
//
//     public DownstreamResponse PostByUsername(List<Post> posts, List<User> users)
//     {
//         var postsByUserName = new JObject();
//         var postsByUserID = posts.GroupBy(n => n.UserID);
//
//         foreach (var post in postsByUserID)
//         {
//             string userName = users.Find(n => n.ID == post.Key).Name;
//             var selectPost = JsonConvert.SerializeObject(post.Select(n => new { n.ID, n.Title, n.Body }));
//             var selectPostString = JsonConvert.DeserializeObject<JArray>(selectPost);
//             postsByUserName.Add(new JProperty(userName, selectPostString));
//         }
//
//         var postsByUsernameString = JsonConvert.SerializeObject(postsByUserName);
//         var stringContent = new StringContent(postsByUsernameString)
//         {
//             Headers = { ContentType = new MediaTypeHeaderValue("application/json") }
//         };
//
//         return new DownstreamResponse(stringContent, HttpStatusCode.OK, new List<KeyValuePair<string, IEnumerable<string>>>(), "OK");
//     }
//
//     private string DeCompressBrotli(byte[] xResponseContent)
//     {
//         using var inputStream = new MemoryStream(xResponseContent);
//         using var brotliStream = new BrotliStream(inputStream, CompressionMode.Decompress);
//         using var outputStream = new MemoryStream();
//         
//         brotliStream.CopyTo(outputStream);
//         return Encoding.UTF8.GetString(outputStream.ToArray());
//     }
// }