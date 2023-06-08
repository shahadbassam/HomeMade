//
//  ButtonStyle.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct ButtonStyle: View {
    
    let buttonText : String
    
    var body: some View {
        
      
            
          ZStack {
              
              Text(buttonText)
                  
                  .foregroundColor(.white)
              Spacer()

             

          }
          .frame(width: 100 , height: 40)
            .background(Color("PrimaryColor"))
            .background(.white)
            .cornerRadius(20)
            .multilineTextAlignment(.center)
          .padding()
          .font(.system(size: 14))
          
        
        
       
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle(buttonText:  "Next")
    }
}
