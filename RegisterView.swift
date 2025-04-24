//
//  RegisterView.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject private var vm = UserViewModel()
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                        
                Form {
                    TextField("Name", text: $vm.name)
                    TextField("E-mail", text: $vm.email)
                    SecureField("Password", text: $vm.password)
                            
                    Button(action : {
                        vm.registerNewUser()
                    }) {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                        }
                    }
                        
                    .onChange(of: vm.registrationSuccesful) { success in
                        if success {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                navigateToLogin = true
                            }
                        }
                    }
                    .navigationDestination(isPresented: $navigateToLogin) {
                        LoginView()
                            .transition(.move(edge: .trailing))
                        }
                    }
                }
            }
        }

#Preview {
    RegisterView()
}
