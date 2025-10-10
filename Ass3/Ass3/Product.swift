import Foundation

struct Product: Codable, Equatable {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String

    enum Category: String, Codable {
        case electronics, clothing, food, books
    }

    var displayPrice: String {
        return String(format: "$%.2f", price)
    }

    init?(id: String = UUID().uuidString, name: String, price: Double, category: Category, description: String = "") {
        guard price >= 0 else { return nil }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}
