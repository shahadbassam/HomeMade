//
//  Product.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import Foundation
struct Product: Identifiable, Codable {
    var id = UUID()
    var storeId: String
    var image: String
    var name: String
    var price: String
}
