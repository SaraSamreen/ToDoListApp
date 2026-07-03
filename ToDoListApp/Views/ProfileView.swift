//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user{
                    
                    //Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    

                    // Info: Name, Email, Member since
                    VStack(alignment: .leading) {

                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated,time:.shortened))")
                        }
                        .padding()
                    }
                    .padding()

                    // Sign out
                    Button("Log Out"){
                        viewModel.logOut()
                    }
                    .tint(.red)
                    Spacer()
                } else{
                    Text("Loading Profile.....")
                    
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
