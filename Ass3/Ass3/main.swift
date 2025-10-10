import Foundation

// --- Sample products ---
let laptop = Product(name: "Laptop Pro", price: 1299.99, category: .electronics, description: "15-inch laptop")!
let book = Product(name: "Swift Programming", price: 39.99, category: .books, description: "Learn Swift")!
let headphones = Product(name: "Headphones", price: 199.99, category: .electronics, description: "Noise-cancelling")!

// --- Cart operations ---
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

// Add same product again (should update quantity)
cart.addItem(product: laptop, quantity: 1)
print("Laptop quantity expected 2 -> actual: \(cart.items.first { $0.product.id == laptop.id }?.quantity ?? 0)")

// Cart calculations
print("Subtotal: \(String(format: "%.2f", cart.subtotal))")
print("Item count: \(cart.itemCount)")

// Discount
cart.discountCode = "SAVE10"
print("Discount amount: \(String(format: "%.2f", cart.discountAmount))")
print("Total with discount: \(String(format: "%.2f", cart.total))")

// Remove item
cart.removeItem(productId: book.id)
print("After removing book, item count: \(cart.itemCount)")

// Reference type behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
print("After modifyCart, item count: \(cart.itemCount)")

// Value type behavior
let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("item1.quantity expected 1 -> actual: \(item1.quantity)")
print("item2.quantity expected 5 -> actual: \(item2.quantity)")

// Create order from cart
let address = Address(street: "123 Main St", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
let order = Order(from: cart, shippingAddress: address)

// Modify cart after order
cart.clearCart()
print("Order items count: \(order.itemCount) // should not be 0")
print("Cart items count: \(cart.itemCount) // should be 0")

// Bonus: user
let user = User(name: "Ali", email: "ali@example.com")
user.placeOrder(order)
print("User total spent: \(String(format: "%.2f", user.totalSpent))")
