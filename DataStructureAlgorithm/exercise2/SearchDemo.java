package DataStructureAlgorithm.exercise2;

public class SearchDemo {
    // LINEAR SEARCH – Searches each element one by one until it finds the target. Works on UNSORTED arrays.
    // Time Complexity: O(n) – in worst case, checks all elements.

    public static Product linearSearch(Product[] products, int targetId) {
        // Loop through each product
        for (int i = 0; i < products.length; i++) {
            // Check if this product's ID matches the target
            if (products[i].getProductId() == targetId) {
                return products[i];  // Found, Return the product
            }
        }
        // If loop completes without finding, return null
        return null;
    }


    // BINARY SEARCH – Works on SORTED arrays.Repeatedly divides the search range in half.
    // Time Complexity: O(log n) – very fast for large datasets.

    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0;                    
        int right = products.length - 1; 

        while (left <= right) {

            int mid = left + (right - left) / 2;
            if (products[mid].getProductId() == targetId) {
                return products[mid];  // Found
            }

            if (products[mid].getProductId() > targetId) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        // Target not found
        return null;
    }


    // MAIN METHOD – Test both searches
    public static void main(String[] args) {
        // Create some sample products
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(205, "Shirt", "Clothing"),
            new Product(309, "Book", "Education"),
            new Product(450, "Phone", "Electronics"),
            new Product(572, "Shoes", "Footwear")
        };

        // For binary search, we need a SORTED array by productId
        // Using the same products but sorted by ID
        Product[] sortedProducts = {
            new Product(101, "Laptop", "Electronics"),
            new Product(205, "Shirt", "Clothing"),
            new Product(309, "Book", "Education"),
            new Product(450, "Phone", "Electronics"),
            new Product(572, "Shoes", "Footwear")
        };

        System.out.println("E-Commerce Search Demo\n");

        //TEST LINEAR SEARCH
        System.out.println("Linear Search (O(n))");
        System.out.println("Searching for product ID 309...");
        
        long startTime = System.nanoTime();
        Product found = linearSearch(products, 309);
        long endTime = System.nanoTime();
        
        if (found != null) {
            System.out.println("Found: " + found);
        } else {
            System.out.println("Product not found");
        }
        System.out.println("Time taken: " + (endTime - startTime) + " ns\n");

        //TEST BINARY SEARCH 
        System.out.println("Binary Search (O(log n))");
        System.out.println("Searching for product ID 450...");
        
        startTime = System.nanoTime();
        Product found2 = binarySearch(sortedProducts, 450);
        endTime = System.nanoTime();
        
        if (found2 != null) {
            System.out.println("Found: " + found2);
        } else {
            System.out.println("Product not found");
        }
        System.out.println("Time taken: " + (endTime - startTime) + " ns\n");

        // COMPARE PERFORMANCE 
        System.out.println("Performance Comparison");
        System.out.println("Linear Search:  O(n) checks every element");
        System.out.println("Binary Search:  O(log n) divides search in half");
        System.out.println("\n Binary search is faster for large datasets,");
        System.out.println(" but requires sorted data.");
    }
}



/*

E-Commerce Search Demo 

--- Linear Search (O(n)) ---
Searching for product ID 309...
Found: ID: 309, Name: Book, Category: Education
Time taken: 8200 ns

--- Binary Search (O(log n)) ---
Searching for product ID 450...
Found: ID: 450, Name: Phone, Category: Electronics
Time taken: 3100 ns

=== Performance Comparison ===
Linear Search:  O(n)   – checks every element
Binary Search:  O(log n) – divides search in half

Binary search is faster for large datasets,
   but requires sorted data.

*/