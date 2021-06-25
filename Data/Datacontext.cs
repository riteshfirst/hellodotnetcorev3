using Microsoft.EntityFrameworkCore;

namespace HelloDotnetcore.Data
{
    public class Datacontext : DbContext{

        public Datacontext(DbContextOptions options ): base (options)
        {
            
        }

        public DbSet<employee> employees {get; set;}

    }
}
