//
//  more.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct SettingView: View {
    @EnvironmentObject var viewModel: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            //MARK: - Welcome
            
            if let store = viewModel.getCurrentStore() {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Hi \(store.name)")
                            .font(.largeTitle)
                        Spacer()
                        AsyncImage(url: URL(string: store.image)) { phase in
                            switch phase {
                            case .empty:
                                // Placeholder view while the image is loading
                                Image(systemName: "person")
                                    .resizable()
                            case .success(let image):
                                // Once the image is loaded, display it and apply animation
                                image
                                    .resizable()
                                    .frame(width: 70, height: 70)
                            case .failure(_):
                                // Error view in case the image fails to load
                                Image(systemName: "person")
                                    .resizable()
                            }
                        }
                        .frame(width: 70, height: 70)
                        .padding(.trailing)
                        .padding(.top)
                    }
                    
                    Text(store.phone)
                        .font(.title2)
                }
                .padding(.horizontal)
                .foregroundColor(.black)
            } else {
                VStack(alignment: .leading) {
                    Text("Hi Guest")
                        .font(.largeTitle)
                    
                    Text("05********")
                        .font(.title2)
                }
                .padding(.horizontal)
                .foregroundColor(.black)
            }
            
            
            //MARK: - Contact with us
            Button {
                let email = "communicationhomemade@gmail.com"
                let appURL = URL(string: "mailto:\(email)?subject=Hello!&body=write your message".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!
                if UIApplication.shared.canOpenURL(appURL) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                    }
                    else {
                        UIApplication.shared.openURL(appURL)
                    }
                }
            } label: {
                ZStack{
                    HStack{
                        Text("Contact with us")
                            .foregroundColor(Color("black"))
                            .font(.headline)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50))
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .padding()
            }
            
            
            //MARK: - About Home made
            SubAccountView(txt: "About Home Made", content: {AboutHomeMadeView()})
            
            //MARK: - Join us
            ZStack{
                HStack{
                    Text("Join us")
                        .foregroundColor(Color("black"))
                        .font(.headline)
                    
                    Spacer()
                    NavigationLink(destination: JoinUsNowView()){
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("orange"), lineWidth: 2)
                        .frame(width: 350 , height: 50))
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .padding()
            
            //MARK: - Privacy policy
            SubAccountView(txt: "Privacy policy", content: {PrivacyPolicyView()})
            
            //MARK: - Log out
            Button {
                do {
                    try Auth.auth().signOut()
                } catch {
                    // Handle logout error
                }
            } label: {
                ZStack{
                    HStack{
                        Text("Log out")
                            .foregroundColor(Color("black"))
                            .font(.headline)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("orange"), lineWidth: 2)
                            .frame(width: 350 , height: 50))
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .padding()
            }
            
            HStack {
                Spacer()
                Button(action: { }) {
                    Text("delete account")
                        .bold()
                        .foregroundColor(Color("red"))
                }
                Spacer()
            }
            .padding(.top)
            
            Spacer()
        }
        
    }
}
struct more_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SubAccountView<Content: View>: View {
    var txt: String = ""
    let content: () -> Content
    
    var body: some View {
        ZStack{
            HStack{
                Text(txt)
                    .foregroundColor(Color("black"))
                    .font(.headline)
                
                Spacer()
                NavigationLink(destination: content){
                    Image(systemName: "chevron.right")
                        .foregroundColor(.orange)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("orange"), lineWidth: 2)
                    .frame(width: 350 , height: 50))
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .padding()
    }
}
