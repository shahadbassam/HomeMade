//
//  photoView2.swift
//  HomeMade
//
//  Created by shahad on 05/11/1444 AH.
//

import SwiftUI

struct photoView2: View {
    
    @State var productName = ""
        @State var theprice = ""
       
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                VStack (alignment: .leading) {
                    Text("product Name")
                    InputTextField(placeholder: "Enter your product Name", inputText: $productName)
                    
                    Text("the price")
                     InputTextField(placeholder: "price", inputText: $theprice)
                    
                }
                
               
                
                
             
               
                
                VStack(alignment: .leading){
                    
                  
                    
                 
                }
               
                VStack(alignment: .trailing){
                    ButtonStyle(buttonText: "Add product")
                    
                }
                
                
            }.font(.system(size: 17))
            
            
        }
    }
}


struct photoView2_Previews: PreviewProvider {
    static var previews: some View {
        photoView2()
    }
}
