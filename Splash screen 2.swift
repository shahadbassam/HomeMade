//
//  Splash screen 2.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct Splash_screen_2: View {
    var body: some View {
        VStack{
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height:128)
                Text("Cairocodere")
                    .font(Font.custom("Baskernille-Bold", size:26))
                    .foregroundColor(.black.opacity(0.80))
                        
                        
                        
         
         }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now , +2.0) {}
                
            }
            
            
        
            }
     }
    }


struct Splash_screen_2_Previews: PreviewProvider {
    static var previews: some View {
        Splash_screen_2()
    }
}
