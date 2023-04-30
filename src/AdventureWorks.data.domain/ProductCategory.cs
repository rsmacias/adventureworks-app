namespace AdventureWorks.Data.Domain;

public class ProductCategory {
    public int ProductCategoryId { get; set; }

    public int? ParentProductCategoryId { get; set; }

    public string Name { get; set; } = null!;

    public DateTime ModifiedDate { get; set; }  

    public ProductCategory? ParentProductCategory { get; set; }  
    
    public ICollection<ProductCategory> ChildProductCategories { get; set; } = new List<ProductCategory>();

}