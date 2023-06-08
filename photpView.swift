//
//  photpView.swift
//  HomeMade
//
//  Created by shahad on 05/11/1444 AH.
//
import SwiftUI

struct photpView: View {
    
    @State var productName = ""
        @State var theprice = ""
       
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
               Text("product Name")
                InputTextField(placeholder: "Enter your product Name", inputText: $productName)
                
                
                Text("the price")
                 InputTextField(placeholder: "price", inputText: $theprice)
                
               
                
                 
                    
              
                
                
            }.font(.system(size: 17))
            
            .navigationTitle("Save").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct phptpView_Previews: PreviewProvider {
    static var previews: some View {
        photpView()
    }
}
