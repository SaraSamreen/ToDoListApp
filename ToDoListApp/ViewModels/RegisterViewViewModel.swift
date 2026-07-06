//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Mac on 03/07/2026.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation
import Combine

class RegisterViewViewModel: ObservableObject {

    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() { }

    func register() {
        guard validate() else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }

            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }

            guard let userId = result?.user.uid else {
                return
            }

            self.insertUserRecord(id: userId)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date().timeIntervalSince1970
        )

        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }

    private func validate() -> Bool {
        errorMessage = ""

        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)
        let trimmedPassword = password.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty,
              !trimmedEmail.isEmpty,
              !trimmedPassword.isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard trimmedName.count >= 2 else {
            errorMessage = "Name must be at least 2 characters."
            return false
        }

        guard isValidEmail(trimmedEmail) else {
            errorMessage = "Please enter a valid email address."
            return false
        }

        guard trimmedPassword.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            return false
        }

        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
