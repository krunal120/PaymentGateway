using Microsoft.EntityFrameworkCore;
using PaymentGateway.Models;
using System.Collections.Generic;

namespace PaymentGateway.Business.AuthService
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
    }
}
