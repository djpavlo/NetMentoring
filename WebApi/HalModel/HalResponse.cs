namespace WebApi.HalModel;

public class HalResponse
{
  public List<Link>? Links { get; set; }

  public Dictionary<string, object>? Embedded { get; set; }

  public object? Data { get; set; }
}

