//
//  privacy policy.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI

struct privacy_policy: View {
    @State private var des = "Terms and Conditions  privacy policy  Maintain confidentiality of information We are committed to not disclosing any personal information, whether to the specialist or the beneficiary To any party that was within the limits permitted by us according to the law of the Kingdom of Saudi Arabia. Access to this information will not be allowed except for the professional team supervising Askfham.  Data we collect from you The data that the beneficiary is required to enter in his personal account   Observations and complaints submitted by the beneficiary via the (contact us) feature. Evaluation of the beneficiary of the application, the specialists and the services provided Messages that the beneficiary sends to any of our e-mails  Personal account and password The beneficiary is obligated to maintain the confidentiality of his personal information and the password in particular The beneficiary is responsible for all the data and information that he shares through the Istefham platform  Change of privacy policy We may amend the Privacy Policy and make changes to it at any time  Content censorship We at HomeMed reserve the right to manage and monitor all the contents of the platform.  Therefore, we reserve the right to delete, edit or remove any beneficiary who posts matters contrary to the platform's objectives, terms and conditions   Undertaking and warranties  You will not use the Service or the Application to cause harm, annoyance or inconvenience to anyone Will not hinder the proper operation of the application You will keep the password for your account  the prices The prices shown in the application are based on each service before ordering and will be visible on the personal page  paying off HomeMed reserves the right to impose new fees for the use of the application, the service, or both."
    @State private var textStyle = UIFont.TextStyle.body
    
    
    var body: some View {
        
      //  NavigationView{
            
                
                //VStack{
                    
                //    Button {
                  //  } label: {
                       // NavigationLink(destination:more()){
                          //  Image(systemName: "chevron.backward")
                              //  .resizable()
                               // .scaledToFit()
                               // .frame(width: 17, height: 96)
                              //  .foregroundColor(Color("orange"))
                            
                      //  }
                        
                        
                   // }
               //   .position(x:29, y:20)
                   TextView(text: $des, textStyle: $textStyle)
                       .padding(30)
                     // .padding(.top,-300)
                       // .foregroundColor(Color("orange"))
                    
                }
                
            }
            
       // }
            
      // }
    
    struct privacy_policy_Previews: PreviewProvider {
        static var previews: some View {
            privacy_policy()
        }
    }

                     
                        
            


