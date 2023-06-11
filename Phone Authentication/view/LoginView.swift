//
//  ContentView.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 28/10/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
     
    @State private var phoneNumber = ""
    @State private var isVerification: Bool = false
    @State private var verificationID: String = ""
    
    //    let user: User
    
    var body: some View {
        if !isVerification {
            
            VStack {
                Text("Enter Mobile Number")
                
                TextField("+9665*******", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .frame(width: 300 , height: 30)
                    .padding()
                    .foregroundColor(Color("black"))
                    .font(.callout)
                    .font(.title2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                    )
                
                    .padding()
                Button(action: {
                    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {  vervicationId, error in
                        if let error {
                            print(error.localizedDescription)
                            return
                        } else {
                            isVerification = true
                            self.verificationID = vervicationId ?? ""
                        }
                        
                    }
                }) {
                    
                    Text("Next").padding()
                        .foregroundColor(Color("white"))
                        .padding(.leading,10)
                        .padding(.top,100)
                    
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(Color("orange"))
                            .frame(width: 307, height: 60)
                            .padding(.leading,10)
                            .padding(.top,100)
                        )
                }
                
            }
        } else {
            VerificationView(verificationId: $verificationID)
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
    
    
    
    
    
}

