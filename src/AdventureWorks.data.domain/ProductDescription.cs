namespace AdventureWorks.Data.Domain;

public class ProductDescription {
    
    public int ProductDescriptionId { get; set; }

    public string Description { get; set; } = null!;

    public DateTime ModifiedDate { get; set; }

    public ICollection<ProductModelProductDescription> ProductModelProductDescriptions { get; set; } = new List<ProductModelProductDescription>();

}