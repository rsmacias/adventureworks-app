namespace AdventureWorks.Data.Domain;

public class ProductModel {
    
    public int ProductModelId { get; set; }

    public string Name { get; set; } = null!;

    public string? CatalogDescription { get; set; }

    public DateTime ModifiedDate { get; set; }
    
}