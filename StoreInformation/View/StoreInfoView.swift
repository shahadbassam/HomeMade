//
//  StoreInfoView.swift
//  HomeMade
//
//  Created by shahad on 03/11/1444 AH.
//

import SwiftUI

struct StoreInfoView: View {
    @EnvironmentObject var viewModel: StoreViewModel
    @State private var showAlert: Bool = false
    @State private var isSavingEnabled = true
    @State private var selectedOption = 0
    let menuOptions: [String] = ["Riyadh", "Jubail", "Dammam"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    SelectImageView(selectedImage: $viewModel.selectedimage)
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                .padding(.vertical, 24)
                
                Text("your Name")
                InputTextField(placeholder: "Enter your Name", inputText: $viewModel.store.ownerName)
                
                Text("Store Name")
                InputTextField(placeholder: "Enter Store Name", inputText: $viewModel.store.name)
                
                
                Text("Maroof Number")
                InputTextField(placeholder: "Enter Maroof Number", inputText: $viewModel.store.maroofNumber)
                
                
                Text("Freelancing Document")
                InputTextField(placeholder: "Enter Freelancing Document", inputText: $viewModel.store.freelancingDocument)
                
                VStack(alignment: .leading){
                    
                    Text("Social Link")
                    InputTextField(placeholder: "Enter Social Link", inputText: $viewModel.store.socialAccount)
                    
                    Text("Region")
                    Menu {
                        ForEach(menuOptions.indices) { index in
                            Button(action: {
                                selectedOption = index
                            }) {
                                Text(menuOptions[index])
                            }
                        }
                        
                    } label: {
                        HStack {
                            Text(menuOptions[selectedOption])
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.primary)
                                .font(.headline)
                            
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("PrimaryColor"), lineWidth: 1.5)
                        )
                        .frame(width: 343 , height: 44)
                        
                    }
                    //InputTextField(placeholder: "Enter Region", inputText: $viewModel.store.region)
                    
                    Text("Email")
                    InputTextField(placeholder: "Enter your Email", inputText: $viewModel.store.email)
                    
                    
                    Text("Mobile number")
                    InputTextField(placeholder: "Enter your mobaile number", inputText: $viewModel.store.phone)
                    
                    VStack(alignment: .leading){
                        
                        Text("Are you the owner? Yes/No")
                        InputTextField(placeholder: "yes or no", inputText: $viewModel.store.isOwner)
                        
                        HStack {
                            Spacer()
                            ButtonStyle(buttonText: "Next")
                                .onTapGesture {
                                    viewModel.store.region = menuOptions[selectedOption]
                                    if isAllDataEntered() && isSavingEnabled {
                                        isSavingEnabled = false
                                        viewModel.saveStore()
                                    } else {
                                        showAlert = true
                                    }
                                }
                        }
                        NavigationLink(destination: ThanksView(), isActive: $viewModel.isSaved) {
                            EmptyView()
                        }
                        .hidden()
                    }
                }
                .font(.system(size: 17))
                .navigationTitle("Store Information")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("خطأ") , message: Text("فضلاً تأكد من إدخال جميع البيانات") ,
                          dismissButton: .default(Text("OK") , action: {
                        showAlert = false
                    }) )
                }
            }
            .padding(.horizontal, 24)
        }
    }
    private func isAllDataEntered() -> Bool {
        print(viewModel.store.region)
        if viewModel.selectedimage != nil,
           viewModel.store.ownerName != "",
           viewModel.store.name != "",
           viewModel.store.maroofNumber != "",
           viewModel.store.freelancingDocument != "",
           viewModel.store.socialAccount != "",
           //viewModel.store.region != "",
           viewModel.store.email != "",
           viewModel.store.phone != "",
           viewModel.store.isOwner != ""
        {
            return true
        }
        return false
    }
}

struct StoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInfoView()
    }
}
