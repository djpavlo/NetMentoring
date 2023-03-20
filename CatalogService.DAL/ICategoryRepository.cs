using CatalogService.DAL.Models;

namespace Framework.Repositories
{
    public interface ICategoryRepository
    {
        Task AddAsync(DbCategory category);
        Task DeleteAsync(DbCategory category);
        Task<IEnumerable<DbCategory>> GetAllAsync();
        Task<DbCategory> GetByIdAsync(int id);
        Task UpdateAsync(DbCategory category);
    }
}