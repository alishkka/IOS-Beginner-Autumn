import Foundation

struct Address: Codable {
    let street: String
    let city: String
    let zipCode: String
    let country: String

    var formattedAddress: String {
        return "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}
