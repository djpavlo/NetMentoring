namespace WebApi.HalModel;

/// <summary>
/// A link.
/// </summary>
public class Link
{
  /// <summary>
  /// Gets or sets the rel.
  /// </summary>
  public string? Rel { get; set; }

  /// <summary>
  /// Gets or sets the href.
  /// </summary>
  public string? Href { get; set; }

  /// <summary>
  /// Gets or sets the method.
  /// </summary>
  public string? Method { get; set; }
}

