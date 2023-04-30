namespace AdventureWorks.Data.Domain;

public class SalesOrderHeader {

    public int SalesOrderId { get; set; }

    public byte RevisionNumber { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime DueDate { get; set; }

    public DateTime? ShipDate { get; set; }

    public byte Status { get; set; }

    public bool? OnlineOrderFlag { get; set; }

    public string SalesOrderNumber { get; set; } = null!;

    public string? PurchaseOrderNumber { get; set; }

    public string? AccountNumber { get; set; }

    public int CustomerId { get; set; }

    public int? ShipToAddressId { get; set; }

    public int? BillToAddressId { get; set; }

    public string ShipMethod { get; set; } = null!;

    public string? CreditCardApprovalCode { get; set; }

    public decimal SubTotal { get; set; }

    public decimal TaxAmt { get; set; }

    public decimal Freight { get; set; }

    public decimal TotalDue { get; set; }

    public string? Comment { get; set; }

    public DateTime ModifiedDate { get; set; }

    public ICollection<SalesOrderDetail> SalesOrderDetails { get; set; } = new List<SalesOrderDetail>();    

}