import Foundation

struct User: Identifiable, Codable {
    var id: String?      // optional, manually assigned by Firestore document ID
    var name: String
    var email: String
    var age: Int
}

