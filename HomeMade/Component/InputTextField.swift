//
//  TextField.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct InputTextField: View {
    
    let placeholder : String
    
    @Binding var inputText : String
    
    var body: some View {
        VStack{
            
            HStack{
              
                   
                TextField(placeholder , text: $inputText)
                
                    .disableAutocorrection(false)
                    .autocapitalization(.none)
                
                
            }
           
        }
          .padding()
          .overlay(
                      RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("PrimaryColor"), lineWidth: 1.5)
                  )
            .frame(width: 343 , height: 44)
            
        

    }
}

struct InputTextField_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(placeholder: "", inputText: .constant(""))
    }
}
