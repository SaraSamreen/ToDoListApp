//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import FirebaseAuth
import Foundation
import Combine

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
    }
    
    func login() {
        guard validate() else {
            return
        }

        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)

        Auth.auth().signIn(withEmail: trimmedEmail, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
   private func validate() -> Bool {
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           
           errorMessage = "Please fill in all fields"
           return false
       }
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Please enter valid email."
           return false
       }
       return true
    }
}
