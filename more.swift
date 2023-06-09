//
//  more.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI

struct more: View {
    @State private var FullName = ""
    @State private var Email = ""
    @State private var Major = ""
    @State private var linkdin = ""
    @State private var Bio = ""
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Hi Dana")
                    .padding(.trailing,200)
                    .font(.largeTitle)
                Text("05********")
                
                    .padding(.trailing,200)
                    .font(.title2)
                
                
                ZStack{
                    HStack{
                        Text("Privacy policy")
                        
                            .foregroundColor(Color("black"))
                        
                            .font(.callout)
                        
                        
                        
                        Spacer()
                        NavigationLink(destination: privacy_policy()){
                            Image(systemName: "chevron.right")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50))
                    .padding()
                }
                .padding()
                
                ZStack{
                    HStack{
                        Text("Contact with us")
                        
                            .foregroundColor(Color("black"))
                            .font(.callout)
                        
                        Spacer()
                        NavigationLink(destination: About_Home_made()){
                            Image(systemName: "chevron.right")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50))
                    .padding()
                }
                .padding()
                ZStack{
                    HStack{
                        Text("About Home made")
                        
                            .foregroundColor(Color("black"))
                            .font(.callout)
                        Spacer()
                        NavigationLink(destination: About_Home_made()){
                            Image(systemName: "chevron.right")
                        }
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50)
                    )
                    .padding()
                }
                .padding()
                ZStack{
                    HStack{
                        
                        Text("Join us" )
                            .padding(.leading)
                            .foregroundColor(Color("black"))
                            .font(.callout)
                        Spacer()
                        NavigationLink(destination: Join_us_now()){
                            Image(systemName: "chevron.right")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50)
                    )
                    
                    .padding()
                }
                .padding()
              
                ZStack{
                    HStack{
                        Text("Log out")
                        
                            .foregroundColor(Color("red"))
                        
                            .font(.callout)
                        
                            .font(.title2)
                        
                        Spacer()
                        NavigationLink(destination: About_Home_made()){
                            Image(systemName: "chevron.right")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50))
                    .padding()
                }
                .padding()
                Button(action: { }) {
                    Text("delete account")
                        .bold()
                        .foregroundColor(Color("red"))
                      
                }
               
                
            
                    
                }
            }
        }
        struct more_Previews: PreviewProvider {
            static var previews: some View {
                more()
            }
        }
    }

