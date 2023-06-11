//
//  StoreProductsView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/11/23.
//

import SwiftUI

struct StoreProductsView: View {
    let store: Store
    @StateObject var viewModel: ProductViewModel = ProductViewModel()
    @EnvironmentObject var storeViewModel: StoreViewModel
    
    var body: some View {
        VStack {
            List {
                    ForEach(viewModel.products) { prduct in
                        StoreProductViewCell(product: prduct)
                    }
                }
                .listStyle(.plain)
                .navigationTitle(store.name)
                .navigationBarTitleDisplayMode(.inline)
                .tint(.white)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        let isFavorite = storeViewModel.isFavoriteByCurrentUser(store: store)
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                storeViewModel.toggleFavorite(store: store)
                                
                            }
                    }
                
            }
            
            Button {
                storeViewModel.pressWhatsUp(phoneNumber: store.phone)
            } label: {
                Text("Go to chat")
                    .padding()
                    .foregroundColor(Color("white"))
                    .padding(.leading,10)
                    .padding(.top,100)
                
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color("orange"))
                        .frame(height: 50)
                        .frame(width: UIScreen.main.bounds.width)
                        //.padding(.leading,10)
                        .padding(.top,100)
                    )
            }

            
        }
        .onAppear(perform: {
            viewModel.fetchProducts(storeID: store.id.uuidString)
    })
    }
}

struct StoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        StoreProductsView(store: Store(userId: "", image: "", ownerName: "", name: "", maroofNumber: "", freelancingDocument: "", socialAccount: "", region: "", email: "", phone: "", isOwner: "", isAccepted: true))
            .environmentObject(StoreViewModel())
    }
}
