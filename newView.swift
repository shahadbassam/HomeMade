//
//  newView.swift
//  HomeMade
//
//  Created by shahad on 04/11/1444 AH.
//

import SwiftUI

struct newView: View {
    var body: some View {
        NavigationView{
           ZStack{
               
               Color("PrimaryColor")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("HomeLogo")
                        .imageScale(.large)
                        .foregroundColor(.green)
                    
                    Text("home made")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                        .multilineTextAlignment(.center)
                        
                        
                }
                .padding()
            }
            
        }
       
    }
}

struct newView_Previews: PreviewProvider {
    static var previews: some View {
        newView()
    }
}
