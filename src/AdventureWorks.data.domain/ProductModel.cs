namespace AdventureWorks.Data.Domain;

public class ProductModel {
    
    public int ProductModelId { get; set; }

    public string Name { get; set; } = null!;

    public string? CatalogDescription { get; set; }

    public DateTime ModifiedDate { get; set; }
    
    public ICollection<ProductModelProductDescription> ProductModelProductDescriptions { get; set; } = new List<ProductModelProductDescription>();

    public ICollection<Product> Products { get; set; } = new List<Product>();   
}