//
//  LoginView.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = UserViewModel()
    @State private var navigateToContentView = false
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("E-mail", text: $vm.email)
                    SecureField("password", text: $vm.password)
                    
                    Button(action : {
                        vm.signInUser()
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                }
                .onChange(of: vm.loginSuccess) { success in
                    if success {
                        navigateToContentView = true
                    }
                }
                NavigationLink("New user?", destination: RegisterView())
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
}

#Preview {
    LoginView()
}
