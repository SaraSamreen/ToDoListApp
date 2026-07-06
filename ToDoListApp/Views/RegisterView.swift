//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
   
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: " Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            //Form
            Form{
                if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Create Account", background: .blue){
                    viewModel.register() 
                }
                .padding( )
            }
            
            .offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
