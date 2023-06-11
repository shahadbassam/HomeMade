//
//  StoreProductViewCell.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/11/23.
//

import SwiftUI

struct StoreProductViewCell: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 5) {
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    // Placeholder view while the image is loading
                    Image("3sida")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 340, height: 110)
                case .success(let image):
                    // Once the image is loaded, display it and apply animation
                    image
                        .resizable()
                        .frame(width: 340, height: 110)
                case .failure(_):
                    // Error view in case the image fails to load
                    Text("Failed to load image")
                }
            }
            
            HStack {
                Text("\(product.price) SR")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct StoreProductViewCell_Previews: PreviewProvider {
    static var previews: some View {
        StoreProductViewCell(product: Product(storeId: "", image: "", name: "عصيدة التمر", price: "80"))
    }
}
