//
//  MovieTipsAppApp.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import SwiftUI
import FirebaseCore

@main
struct MovieTipsAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
