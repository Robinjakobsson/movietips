//
//  UserViewModel.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore


class UserViewModel : ObservableObject {
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var tips : String = ""
    @Published var registrationSuccesful = false
    @Published var loginSuccess = false
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    
    
    func registerNewUser() {
            guard !email.isEmpty, !password.isEmpty, !name.isEmpty else {
                print("Fill in all fields")
                return
            }

            auth.createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("Registration error: \(error.localizedDescription)")
                    return
                }

                guard let user = result?.user else { return }

                let newUser = User(name: self.name, tips: self.tips)

                do {
                    try self.db.collection("users").document(user.uid).setData(from: newUser)
                    self.registrationSuccesful = true
                    print("Successfully saved \(newUser.name) to Database!")
                } catch {
                    print("Failed to save user: \(error)")
            }
        }
    }
    
    func signInUser() {
        
        guard !email.isEmpty, !password.isEmpty else {
            print ("Fill in all fields!")
            return
        }
        
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print ("\(error.localizedDescription)")
                return
            }
            
            self.loginSuccess = true
            print("User successfully Logged in!")
            
            
        }
        
    }
}
