namespace WebApi.HalModel;

/// <summary>
/// A HAL response.
/// </summary>
public class HalResponse
{
  /// <summary>
  /// Gets or sets the links.
  /// </summary>
  public List<Link>? Links { get; set; }

  /// <summary>
  /// Gets or sets the embedded resources.
  /// </summary>
  public Dictionary<string, object>? Embedded { get; set; }

  /// <summary>
  /// Gets or sets the data.
  /// </summary>
  public object? Data { get; set; }
}

