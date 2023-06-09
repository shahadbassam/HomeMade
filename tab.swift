//
//  tab.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 04/11/1444 AH.
//

import SwiftUI

struct tab: View {
    @State var selectedTab = 0
    var body: some View {
        
        TabView(selection: $selectedTab)
        {

            
            more()
                        .tabItem {
                            Label("", systemImage: "person")
                        }
                        .tag(0)
            log_in_2()
                .tabItem {
                    Label("", systemImage: "suit.heart")}
                .tag(1)
            About_Home_made()
                .tabItem{
                    
                 
    Image(selectedTab == 2 ? "home2 2" : "home2 1")
                  
                
                
            }
            .tag(2)                           }
                            }
        
    }


struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab()
    }
}
