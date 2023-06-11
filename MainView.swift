//
//  tab.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 04/11/1444 AH.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    init() {
        UINavigationBarAppearance()
            .setColor(title: .white, background: .orange)
    }
    
    var body: some View {
        TabView {
            // Home View
            NavigationView {
                HomeView()
                    .navigationBarTitle("Home Made")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .accentColor(.white)
            .tabItem {
                Image("home")
            }
            
            // Favorite View
            NavigationView {
                FavoriteView()
                    .navigationBarTitle("Favorite")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .accentColor(.white)
            .tabItem {
                Image("heart")
            }
            
            
            // Account View
            NavigationView {
                SettingView()
                    .id(appState.rootViewId)
                    .navigationBarTitle("My Account")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .accentColor(.white)
            .tabItem {
                Image("person")
            }
        }
        .environmentObject(StoreViewModel())
        .accentColor(.orange)
        
    }
}


struct tab_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
