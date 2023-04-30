namespace AdventureWorks.Data.Domain;

public class ProductModelProductDescription {
    public int ProductModelId { get; set; }

    public int ProductDescriptionId { get; set; }

    public string Culture { get; set; } = null!;

    public DateTime ModifiedDate { get; set; }

}