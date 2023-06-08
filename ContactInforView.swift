//
//  ContactInforView.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct ContactInfoView: View {
    
    @State var yourName = ""
        @State var Email = ""
        @State var Mobilenumber = ""
        @State var areyoutheoner = ""
      
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
               Text("your Name")
                InputTextField(placeholder: "Enter your Name", inputText: $yourName)
                
                
                Text("Email")
                 InputTextField(placeholder: "Enter your Email", inputText: $Email)
                
                
                Text("Mobile number")
                 InputTextField(placeholder: "Enter your mobaile number", inputText: $Mobilenumber)
                
                VStack(alignment: .leading){
                    
                    Text("Are you the owner? Yes/No")
                     InputTextField(placeholder: "yes or no", inputText: $areyoutheoner)
                    
                    
                 
                }
               
                VStack(alignment: .trailing){
                    ButtonStyle(buttonText: "Next")
                    
                }
                
                
            }.font(.system(size: 17))
            
            .navigationTitle("Store Information").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContactInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoView()
    }
}
