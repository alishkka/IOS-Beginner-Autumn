import Foundation

struct CartItem: Codable {
    let product: Product
    private(set) var quantity: Int

    var subtotal: Double {
        return product.price * Double(quantity)
    }

    init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = max(1, quantity)
    }

    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else { return }
        self.quantity = newQuantity
    }

    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        self.quantity += amount
    }
}
