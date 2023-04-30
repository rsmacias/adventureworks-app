namespace AdventureWorks.Data.Domain;

public class ProductModelProductDescription {
    public int ProductModelId { get; set; }

    public int ProductDescriptionId { get; set; }

    public string Culture { get; set; } = null!;

    public DateTime ModifiedDate { get; set; }

    public ProductDescription ProductDescription { get; set; } = null!;

    public ProductModel ProductModel { get; set; } = null!;

}