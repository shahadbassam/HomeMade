//
//  ContentView.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authManager = AuthManager()
    
    var body: some View {
        if authManager.isLoggedIn {
            MainView()
                .environmentObject(AppState())
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
