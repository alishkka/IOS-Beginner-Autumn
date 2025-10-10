
# README

**Why class for ShoppingCart?**
The `ShoppingCart` is modeled as a class because it represents a mutable, shared piece of state with an identity across the app lifecycle. When multiple parts of the program (views, controllers, services) need to reference the same cart instance and observe or modify it, reference semantics prevent accidental copying and ensure all references see the same updates.

**Why struct for Product and Order?**
`Product` and `Order` are value types because they represent data without a required identity: products are simple data records that can be copied safely, and orders are immutable snapshots taken at checkout. Using structs for these keeps the code predictable — copying a `Product` or `Order` cannot unexpectedly mutate the original.

**Reference vs Value semantics examples**
Reference semantics matter for the cart: passing the cart into a function (`modifyCart(_:)`) mutates the original instance. Value semantics matter for items: copying a `CartItem` produces an independent value; updating the copy does not change the original.

**Challenges & solutions**
Main challenges were choosing validation strategies (guards vs failable init) and ensuring the `Order` snapshot is fully immutable. I used a failable initializer for `Product` to prevent negative prices, and copied cart items when building an `Order` to guarantee immutability.
