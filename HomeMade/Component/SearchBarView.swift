//
//  SearchBarView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
        var body: some View {
            
            HStack {
                TextField("search...", text: $searchText)
                    .font(.title3)
                Image(systemName: searchText.isEmpty ? "magnifyingglass" : "xmark.circle.fill")
                    
               // .foregroundColor(Color.secondary)
                .onTapGesture {
                    searchText = ""
                }
            }
            .foregroundColor(.gray)
            //.padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(
                            RoundedRectangle(cornerRadius: 8)
                                
                                .fill(Color.white)
                                .frame(width: 343 , height: 30)

                        )

                        .padding(.horizontal)
        }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
