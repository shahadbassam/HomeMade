//
//  StoreInfoView.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct StoreInfoView: View {
    
    @State var storeName = ""
        @State var maroofNumber = ""
        @State var freelanceringDoc = ""
        @State var kitchenType = ""
        @State var social = ""
        @State var region = ""
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
               Text("Store Name")
                InputTextField(placeholder: "Enter Store Name", inputText: $storeName)
                
                
                Text("Maroof Number")
                 InputTextField(placeholder: "Enter Maroof Number", inputText: $maroofNumber)
                
                
                Text("Freelancing Document")
                 InputTextField(placeholder: "Enter Freelancing Document", inputText: $freelanceringDoc)
                
                VStack(alignment: .leading){
                    
                    Text("Kitchen Type")
                     InputTextField(placeholder: "Enter Store Name", inputText: $kitchenType)
                    
                    
                    Text("Social Link")
                     InputTextField(placeholder: "Enter Social Link", inputText: $social)
                    
                    Text("Region")
                     InputTextField(placeholder: "Enter Region", inputText: $region)
                    
                }
               
                VStack{
                    NavigationLink(destination: ContactInfoView()){
                        
                        ButtonStyle(buttonText: "Next")
                            
                        
                    }
                    
                    
                }
                
                
            }.font(.system(size: 17))
            
            .navigationTitle("Store Information").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct StoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInfoView()
    }
}
