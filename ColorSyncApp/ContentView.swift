import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var name = ""
    @State private var email = ""
    @State private var age = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    
                    Button("Add User") {
                        if let ageInt = Int(age), !name.isEmpty, !email.isEmpty {
                            let user = User(name: name, email: email, age: ageInt)
                            viewModel.addUser(user: user)
                            name = ""
                            email = ""
                            age = ""
                        }
                    }
                }
                .padding(.bottom)
                
                List {
                    ForEach(viewModel.users) { user in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name).font(.headline)
                                Text(user.email).font(.subheadline)
                                Text("\(user.age) years old").font(.subheadline)
                            }
                            Spacer()
                            Button("Delete") {
                                viewModel.deleteUser(user: user)
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

