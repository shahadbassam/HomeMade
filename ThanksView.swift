//
//  thanksView.swift
//  HomeMade
//
//  Created by shahad on 04/11/1444 AH.
//

import SwiftUI

struct thanksView: View {
    var body: some View {
        
        
        VStack(spacing: 150) {
            Text("Thank you for joinig us")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryColor"))
            .multilineTextAlignment(.center)
            
            VStack{
                
                ButtonStyle(buttonText: "Done")

                
            }
            
        }
            
            
        
        
           
            
        
    }

}

struct thanksView_Previews: PreviewProvider {
    static var previews: some View {
        thanksView()
    }
}
   
