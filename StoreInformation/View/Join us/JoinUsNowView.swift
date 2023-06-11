//
//  Join us now.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI

struct JoinUsNowView: View {
    
    var body: some View {
        VStack{
            Text("To register as a new partner")
                .padding(.top, -150)
                .foregroundColor(Color("orange"))
                .font(.headline)
            
            
            
            Text("Submit your information\n and we will contact you")
                .font(.headline)
                .padding()
            
            NavigationLink(destination: StoreInfoView()) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("orange"))
                    .frame(width: 307, height: 60)
                    .overlay {
                        Text("Join us now")
                            .padding()
                            .foregroundColor(Color.white)
                            .font(.title2.bold())
                    }
            }
            .padding(.top)
            
        }
        .navigationTitle("Join us")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct Join_us_now_Previews: PreviewProvider {
    static var previews: some View {
        JoinUsNowView()
    }
}
