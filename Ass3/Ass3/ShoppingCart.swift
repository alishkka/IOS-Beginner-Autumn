import Foundation

class ShoppingCart {
    private(set) var items: [CartItem]
    var discountCode: String?

    init(items: [CartItem] = []) {
        self.items = items
    }

    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        if let idx = items.firstIndex(where: { $0.product.id == product.id }) {
            var item = items[idx]
            item.increaseQuantity(by: quantity)
            items[idx] = item
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }

    func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }

    func updateItemQuantity(productId: String, quantity: Int) {
        guard quantity >= 0 else { return }
        if let idx = items.firstIndex(where: { $0.product.id == productId }) {
            if quantity == 0 {
                removeItem(productId: productId)
            } else {
                var item = items[idx]
                item.updateQuantity(quantity)
                items[idx] = item
            }
        }
    }

    func clearCart() {
        items.removeAll()
    }

    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }

    private var discountPercent: Double {
        guard let code = discountCode?.uppercased() else { return 0 }
        switch code {
        case "SAVE10": return 0.10
        case "SAVE20": return 0.20
        default: return 0
        }
    }

    var discountAmount: Double {
        return subtotal * discountPercent
    }

    var total: Double {
        return max(subtotal - discountAmount, 0)
    }

    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }

    var isEmpty: Bool { items.isEmpty }
}
