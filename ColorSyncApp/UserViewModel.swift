import SwiftUI
import Firebase
import FirebaseFirestore



class UserViewModel: ObservableObject {
    @Published var users = [User]()
    private var db = Firestore.firestore()
    
    // Add user
    func addUser(user: User) {
        do {
            _ = try db.collection("users").addDocument(from: user)
        } catch {
            print("Error adding user: \(error)")
        }
    }
    
    // Fetch users
    func fetchUsers() {
        db.collection("users").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching users: \(error)")
                return
            }
            self.users = snapshot?.documents.compactMap { try? $0.data(as: User.self) } ?? []
        }
    }
    
    // Delete user
    func deleteUser(user: User) {
        guard let id = user.id else { return }
        db.collection("users").document(id).delete { error in
            if let error = error {
                print("Error deleting user: \(error)")
            }
        }
    }
}

