//
//  SplashcreanView.swift
//  HomeMade
//
//  Created by shahad on 04/11/1444 AH.
//

import SwiftUI

struct Splash_Screen: View {
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            Text("home made")
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryColor"))
                .font(.system(size: 20))
                .bold()
                .padding()
           
        }
        
        
    }

}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Splash_Screen()
    }
}
  
