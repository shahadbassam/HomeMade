//
//  HomeCellView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import SwiftUI

struct HomeCellView: View {
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
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCellView(store: Store(userId: "", image: "", ownerName: "", name: "", maroofNumber: "", freelancingDocument: "", socialAccount: "", region: "", email: "", phone: "", isOwner: "", isAccepted: true))
    }
}
