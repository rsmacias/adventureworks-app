namespace AdventureWorks.Data.Domain;

public class CustomerAddress {
    
        public int CustomerId { get; set; }
    
        public int AddressId { get; set; }

        public string AddressType { get; set; } = null!;

        public DateTime ModifiedDate { get; set; }

        public Address Address { get; set; } = null!;

        public Customer Customer { get; set; } = null!;
        
}