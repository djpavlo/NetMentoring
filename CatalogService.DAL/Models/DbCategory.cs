using System;

namespace CatalogService.DAL.Models;

public class DbCategory
{
  public int Id { get; set; }
  public string Name { get; set; }
  public string ImageUrl { get; set; }
  public DbCategory ParentCategory { get; set; }

  public override bool Equals(object? obj)
  {
    return obj is DbCategory category &&
           Id == category.Id &&
           Name == category.Name &&
           ImageUrl == category.ImageUrl &&
           EqualityComparer<DbCategory>.Default.Equals(ParentCategory, category.ParentCategory);
  }

  public override int GetHashCode()
  {
    return HashCode.Combine(Id, Name, ImageUrl, ParentCategory);
  }
}

