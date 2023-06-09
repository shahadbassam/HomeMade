//
//  log in 2.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct log_in_2: View {
    @State private var verificationCode = ""
    var verificationId: String = ""
    @State private var isSignin: Bool = false
    
    
    var body: some View {
        if isSignin {
            tab()
        } else {
            VStack {
                Text("Enter Verification code")
                HStack{
                    TextField("Enter Verification code", text: $verificationCode)
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
                    
                    
                    
                }
                Text("Resend again ?")
                    .padding()
                    .onTapGesture {
                    
                    }
                
                Button(action: {
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: verificationCode)
                    Auth.auth().signIn(with: credential) { result, error in
                        if let error {
                            print(error.localizedDescription)
                            return
                        }
                        
                        guard let uid = result?.user.uid, uid.isEmpty else {
                            return
                        }
                        if Auth.auth().currentUser != nil {
                            isSignin = true
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
        }
    }
}

    struct log_in_2_Previews: PreviewProvider {
        static var previews: some View {
            log_in_2()
        }
    }

