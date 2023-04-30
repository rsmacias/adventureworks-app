using Microsoft.EntityFrameworkCore;
using AdventureWorks.Data.Domain;

namespace AdventureWorks.data.services;

public class AdventureWorksContext : DbContext {

    public DbSet<Address> Addresses { get; set; }
    public DbSet<Customer> Customers { get; set; }
    public DbSet<CustomerAddress> CustomerAddresses { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<ProductCategory> ProductCategories { get; set; }
    public DbSet<ProductDescription> ProductDescriptions { get; set; }
    public DbSet<ProductModel> ProductModels { get; set; }
    public DbSet<ProductModelProductDescription> ProductModelProductDescriptions { get; set; }
    public DbSet<SalesOrderDetail> SalesOrderDetails { get; set; }
    public DbSet<SalesOrderHeader> SalesOrderHeaders { get; set; }    

    public AdventureWorksContext() {
        
    }

    public AdventureWorksContext(DbContextOptions<AdventureWorksContext> options) : base(options) {
        
    }
        
    
}
