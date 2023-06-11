//
//  HomeView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedOption = 0
    @State private var searchText = ""
    @EnvironmentObject var viewModel: StoreViewModel
    @State private var showAlert = false
    let menuOptions: [String] = ["Riyadh", "Jubail", "Dammam"]
    @State private var region: String = "Riyadh"
    
    var body: some View {
            List {
                ForEach(viewModel.stores.filter({$0.region == region})) { store in
                    NavigationLink(destination: StoreProductsView(store: store)) {
                        HomeCellView(store: store)
                    }
                }
            }
            .listStyle(.plain)
            .toolbar {
               
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        ForEach(menuOptions.indices) { index in
                            Button(action: {
                                selectedOption = index
                                region = menuOptions[index]
                            }) {
                                Text(menuOptions[index])
                            }
                        }
                    } label: {
                        HStack {
                            Text(menuOptions[selectedOption])
                                .foregroundColor(.primary)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.primary)
                                .font(.headline)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if let _ = viewModel.getCurrentStore() {
                        
                        NavigationLink(destination:  ProductView().environmentObject(viewModel)){
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                        }
                    }else {
                        
                        Button{
                            self.showAlert.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                        }.alert(isPresented: $showAlert) { () -> Alert in
                            Alert(title: Text("لاضافه منتجات سجل معنا"))
                        }
                    }
                }
            }
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
//            
//        }
        .onAppear(perform: {
            viewModel.fetchStores()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
