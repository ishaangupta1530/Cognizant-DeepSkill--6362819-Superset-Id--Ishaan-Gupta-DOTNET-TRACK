using System;

class Product
{
    public int ProductId { get; }
    public string ProductName { get; }
    public string Category { get; }

    public Product(int id, string name, string category)
    {
        ProductId = id;
        ProductName = name;
        Category = category;
    }

    public override string ToString()
    {
        return $"{ProductId} - {ProductName} ({Category})";
    }
}

class ProductSearch
{
    public static Product LinearSearch(Product[] products, string targetName)
    {
        foreach (var p in products)
        {
            if (p.ProductName.Equals(targetName, StringComparison.OrdinalIgnoreCase))
            {
                return p;
            }
        }
        return null;
    }

    public static Product BinarySearch(Product[] products, string targetName)
    {
        Array.Sort(products, (p1, p2) => 
            string.Compare(p1.ProductName, p2.ProductName, StringComparison.OrdinalIgnoreCase));

        int left = 0, right = products.Length - 1;

        while (left <= right)
        {
            int mid = (left + right) / 2;
            int cmp = string.Compare(products[mid].ProductName, targetName, StringComparison.OrdinalIgnoreCase);

            if (cmp == 0)
                return products[mid];
            else if (cmp < 0)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return null;
    }

    static void Main()
    {
        Product[] products = new Product[]
        {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Chair", "Furniture"),
            new Product(103, "Shoes", "Apparel"),
            new Product(104, "Smartphone", "Electronics")
        };

        Product result1 = LinearSearch(products, "Shoes");
        Console.WriteLine("Linear Search Result: " + result1);

        Product result2 = BinarySearch(products, "Smartphone");
        Console.WriteLine("Binary Search Result: " + result2);
    }
}
