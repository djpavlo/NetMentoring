using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using CatalogService.DAL.Models;

namespace Framework.Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly CatalogDbContext _context;

        public CategoryRepository(CatalogDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<DbCategory>> GetAllAsync()
        {
            return await _context.Categories.ToListAsync();
        }

        public async Task<DbCategory> GetByIdAsync(int id)
        {
            return await _context.Categories.FindAsync(id);
        }

        public async Task AddAsync(DbCategory category)
        {
            await _context.Categories.AddAsync(category);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(DbCategory category)
        {
            _context.Categories.Update(category);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(DbCategory category)
        {
            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();
        }
    }
}