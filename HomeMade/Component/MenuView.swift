//
//  MenuView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedOption: Int
    let menuOptions: [String] = ["Riyadh", "Jubail", "Dammam"]
    
    var body: some View {
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
}
