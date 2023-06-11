//
//  FavoriteView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: StoreViewModel
    
    var body: some View {
            List {
                ForEach(viewModel.getFavoriteStores(stores: viewModel.stores)) { store in
                    NavigationLink(destination: StoreProductsView(store: store)) {
                        FavoriteViewCell(store: store)
                    }
                }
            }
            .listStyle(.plain)
        .onAppear {
            viewModel.fetchStores()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
