//
//  AuthManager.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/12/23.
//

import Foundation
import FirebaseAuth

class AuthManager : ObservableObject {
    @Published var isLoggedIn = false
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        authStateHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
}
