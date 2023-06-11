//
//  FavoriteViewCell.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/11/23.
//

import SwiftUI

struct FavoriteViewCell: View {
    let store: Store
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: store.image)) { phase in
                switch phase {
                case .empty:
                    // Placeholder view while the image is loading
                    Image("food")
                        .resizable()
                        .frame(width: 100, height: 100)
                case .success(let image):
                    // Once the image is loaded, display it and apply animation
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                case .failure(_):
                    // Error view in case the image fails to load
                    Text("Failed to load image")
                }
            }
           
            Text(store.name)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "heart.fill")
                .foregroundColor(Color("PrimaryColor"))
                .font(.largeTitle)
                .padding(.trailing)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct FavoriteViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteViewCell(store: Store(userId: "", image: "", ownerName: "", name: "مطبخ ام عمر", maroofNumber: "", freelancingDocument: "", socialAccount: "", region: "", email: "", phone: "", isOwner: "", isAccepted: true))
    }
}
