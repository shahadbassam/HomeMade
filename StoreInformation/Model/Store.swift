//
//  Store.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import Foundation


struct Store: Identifiable, Codable {
    var id = UUID()
    var userId: String
    var image: String
    var ownerName: String
    var name: String
    var maroofNumber: String
    var freelancingDocument: String
    var socialAccount: String
    var region: String
    var email: String
    var phone: String
    var isOwner: String
    var favoriteBy: [String] = []
    var isAccepted: Bool
}

