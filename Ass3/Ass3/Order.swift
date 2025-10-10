import Foundation

struct Order: Codable {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address

    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        // Copy items to ensure immutability
        self.items = cart.items.map { CartItem(product: $0.product, quantity: $0.quantity) }
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }

    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
}
