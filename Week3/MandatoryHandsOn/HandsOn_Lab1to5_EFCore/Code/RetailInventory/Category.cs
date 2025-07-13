public class Category
{
    public int Id { get; set; }
    public required string Name { get; set; } // Added 'required' to resolve CS8618 warning
    public required List<Product> Products { get; set; } = new List<Product>(); // Added 'required' and initialization
}
 ```