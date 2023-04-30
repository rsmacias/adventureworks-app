namespace AdventureWorks.Data.Domain;

public class SalesOrderDetail {

    public int SalesOrderId { get; set; }

    public int SalesOrderDetailId { get; set; }

    public short OrderQty { get; set; }

    public int ProductId { get; set; }

    public decimal UnitPrice { get; set; }

    public decimal UnitPriceDiscount { get; set; }

    public decimal LineTotal { get; set; }

    public DateTime ModifiedDate { get; set; }

    public SalesOrderHeader SalesOrder { get; set; } = null!;

    public Product Product { get; set; } = null!;

}