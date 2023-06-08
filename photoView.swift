//
//  photoView.swift
//  HomeMade
//
//  Created by shahad on 05/11/1444 AH.
//

import SwiftUI

struct photoView: View {
    
    @State var productName = ""
        @State var theprice = ""
       
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
               Text("product Name")
                InputTextField(placeholder: "Enter your product Name", inputText: $productName)
                
                
                Text("the price")
                 InputTextField(placeholder: "price", inputText: $theprice)
                
               
                
                VStack(alignment: .leading){
                    
                  
                    
                 
                }
               
                VStack(alignment: .trailing){
                    ButtonStyle(buttonText: "Add product")
                    
                }
                
                
            }.font(.system(size: 17))
            
            .navigationTitle("save").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct photo_Previews: PreviewProvider {
    static var previews: some View {
        photoView()
    }
}
