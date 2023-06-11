//
//  photoView2.swift
//  HomeMade
//
//  Created by shahad on 05/11/1444 AH.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel = ProductViewModel()
    @EnvironmentObject var storeViewModel: StoreViewModel
    @State private var showAlert: Bool = false
    @State private var isSavingEnabled = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    SelectImageView(selectedImage: $viewModel.selectedimage)
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                .padding(.bottom, 24)
                
                Text("product Name")
                InputTextField(placeholder: "Enter your product Name", inputText: $viewModel.product.name)
                    .padding(.bottom)
                
                Text("the price")
                InputTextField(placeholder: "price", inputText: $viewModel.product.price)
                    .keyboardType(.numberPad)
                
                HStack {
                    Spacer()
                    ButtonStyle(buttonText: "Add product")
                        .onTapGesture {
                            if isSavingEnabled {
                                if let storeID = storeViewModel.getStoreId() {
                                    isSavingEnabled = false
                                    viewModel.saveProduct(storeID: storeID)
                                    
                                        presentationMode.wrappedValue.dismiss()
                                   
                                          
                                } else {
                                    print("error")
                                }
                                
                            } else {
                               // showAlert = true
                            }
                        }
                    Spacer()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Product Information")
           .navigationBarTitleDisplayMode(.inline)
           .alert(isPresented: $showAlert) {
               Alert(title: Text("خطأ") , message: Text("فضلاً تأكد من إدخال جميع البيانات") ,
                     dismissButton: .default(Text("OK") , action: {
                   showAlert = false
               }) )
           }
    }
    
    private func isAllDataEntered() -> Bool {
        if viewModel.product.name != "",
           viewModel.product.price != "",
           viewModel.selectedimage != nil {
            return true
        }
        return false
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: ProductViewModel())
            .environmentObject(StoreViewModel())
    }
}
